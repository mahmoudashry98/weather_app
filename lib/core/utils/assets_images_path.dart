const String imageAssetsRoot = "assets/images/";
const String iconAssetsRoot = "assets/icons/";

// String weatherImage = _getAssetsImagePath('weather_image.jpg');
String weatherImage = _getAssetsImagePath('weather.jpg');
String crescentIcon = _getAssetsImagePath('crescent-moon.png');
String _getAssetsImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}

String _getAssetsIconPath(String fileName) {
  return iconAssetsRoot + fileName;
}

class ImageUrl {
  static const String sunImage =
      'https://assets2.lottiefiles.com/packages/lf20_jqfghjiz.json';
}
