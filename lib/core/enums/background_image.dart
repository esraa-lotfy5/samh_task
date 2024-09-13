import 'package:samh_task/core/constants/app_images.dart';

enum BackgroundImage {
  bookFlight(AppPng.icBookFlightBackground),
  searchResults(AppPng.icSearchResultBackground);

  const BackgroundImage(this.imagePath);

  final String imagePath;
}
