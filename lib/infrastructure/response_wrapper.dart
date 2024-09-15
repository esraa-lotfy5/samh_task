// import 'package:logger/logger.dart';

class ResponseWrapper<TResponse> {
  final int? status;
  final TResponse? data;
  final dynamic body;
  final Map<String, dynamic>? header;

  ResponseWrapper({
    this.status,
    this.data,
    this.body,
    this.header,
  });
  // static final logger = Logger();
  bool get isSuccess => status == 200 || status == 201;
  factory ResponseWrapper.fromJson(
    Map<String, dynamic> json, {
    TResponse? responseData,
    Map<String, dynamic>? responseHeader,
    Map<String, dynamic>? responseOptionsHeader,
    int? statueCode,
    String dataKey = 'data',
  }) {
    return ResponseWrapper<TResponse>(
      status: statueCode ?? 0,
      header: responseHeader,
      data: responseData,
      body: json[dataKey],
    );
  }
}
