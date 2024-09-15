import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:samh_task/core/constants/app_constants.dart';
import 'package:samh_task/core/managers/shared_pref_manager.dart';
import 'package:samh_task/core/utils/localization_util.dart';
import 'package:samh_task/infrastructure/response_wrapper.dart';

abstract class NetworkManager {
  Future<ResponseWrapper<T?>> get<T>(
    String url, {
    Map<String, dynamic> queryParameters,
    required T Function(dynamic data) fromJsonBuilder,
    bool addRefresh = false,
    Map<String, String> headers,
  });

  Future<ResponseWrapper<T?>> post<T>(
    String url,
    dynamic data, {
    required T Function(dynamic data) bodyBuilder,
    Map<String, String> headers,
    void Function(int, int)? onSendProgressSendTotal,
    bool addRefresh = false,
  });

  Future<ResponseWrapper<T?>> put<T>(
    String url,
    dynamic data, {
    required T Function(dynamic data) bodyBuilder,
    Map<String, String> headers,
    bool addRefresh = false,
  });

  Future<ResponseWrapper<T?>> patch<T>(
    String url,
    dynamic data, {
    required T Function(dynamic data) bodyBuilder,
    Map<String, String> headers,
    bool addRefresh = false,
  });

  Future<ResponseWrapper<T?>> delete<T>(
    String url, {
    Map<String, dynamic> queryParameters,
    required T Function(dynamic data) fromJsonBuilder,
    Map<String, String> headers,
    bool addRefresh = false,
  });
}

class NetworkManagerImpl extends NetworkManager {
  final _dioClient = Dio();

  Future<ResponseWrapper<T>> _makeRequest<T>(
    Future<Response> requestMethod,
    String url, {
    required T Function(dynamic data) fromJson,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String dataKey = 'data',
  }) async {
    try {
      Response response;
      response = await requestMethod;
      return ResponseWrapper<T>.fromJson(
        response.data as Map<String, dynamic>,
        responseData: fromJson(response.data['data']),
        responseHeader: response.headers.map,
        responseOptionsHeader: response.requestOptions.headers,
        statueCode: response.statusCode,
        dataKey: dataKey,
      );
    } catch (e) {
      log("[ERROR]: $e");
      rethrow;
    }
  }

  @override
  Future<ResponseWrapper<T?>> get<T>(String url,
      {Map<String, dynamic>? queryParameters,
      required T Function(dynamic data) fromJsonBuilder,
      bool forceLogoutUnAuth = true,
      bool showErrorMessage = false,
      bool showBlockedReq = false,
      bool addRefresh = false,
      Map<String, String>? headers}) async {
    headers = await _getHeaders(headers, addRefresh);
    dynamic method = _dioClient.get(url, queryParameters: queryParameters, options: Options(headers: headers));

    return _makeRequest(
      method,
      url,
      queryParameters: queryParameters,
      headers: headers,
      fromJson: fromJsonBuilder,
    );
  }

  @override
  Future<ResponseWrapper<T?>> post<T>(
    String url,
    dynamic data, {
    required T Function(dynamic data) bodyBuilder,
    Map<String, String>? headers,
    bool forceLogoutUnAuth = true,
    void Function(int, int)? onSendProgressSendTotal,
    bool addRefresh = false,
  }) async {
    headers = await _getHeaders(headers, addRefresh);
    Future<Response> method =
        _dioClient.post(url, data: data, options: Options(headers: headers), onSendProgress: onSendProgressSendTotal);
    return await _makeRequest(
      method,
      url,
      data: data,
      headers: headers,
      fromJson: bodyBuilder,
    );
  }

  @override
  Future<ResponseWrapper<T?>> put<T>(
    String url,
    dynamic data, {
    required T Function(dynamic data) bodyBuilder,
    Map<String, String>? headers,
    bool addRefresh = false,
  }) async {
    headers = await _getHeaders(headers, addRefresh);
    Future<Response> method = _dioClient.put(url, data: data, options: Options(headers: headers));
    return _makeRequest(
      method,
      url,
      data: data,
      headers: headers,
      fromJson: bodyBuilder,
    );
  }

  @override
  Future<ResponseWrapper<T?>> patch<T>(
    String url,
    dynamic data, {
    required T Function(dynamic data) bodyBuilder,
    Map<String, String>? headers,
    bool addRefresh = false,
  }) async {
    headers = await _getHeaders(headers, addRefresh);
    Future<Response> method = _dioClient.patch(url, data: data, options: Options(headers: headers));
    return _makeRequest(
      method,
      url,
      data: data,
      headers: headers,
      fromJson: bodyBuilder,
    );
  }

  @override
  Future<ResponseWrapper<T?>> delete<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJsonBuilder,
    Map<String, String>? headers,
    bool addRefresh = false,
  }) async {
    headers = await _getHeaders(headers, addRefresh);
    Future<Response> method =
        _dioClient.delete(url, queryParameters: queryParameters, options: Options(headers: headers));

    return _makeRequest(
      method,
      url,
      queryParameters: queryParameters,
      headers: headers,
      fromJson: fromJsonBuilder,
    );
  }

  Future<Map<String, String>> _getHeaders(Map<String, String>? headers, bool addRefresh) async {
    final token = await SharedPreferencesManager.getData(key: AppConstants.accessToken);
    final refresh = await SharedPreferencesManager.getData(key: AppConstants.refreshToken);
    final header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Accept-Language': LocalizationUtil.locale.languageCode,
      if (token != null) 'Authorization': "Bearer $token",
      if (addRefresh) 'rt': "Bearer $refresh",
    };
    if (headers != null) header.addAll(headers);
    return header;
  }
}
