class AppSize {
  // full screen width and height
  static double heightSize;
  static double widthSize;

  static double heightPercentage;
  static double widthPercentage;

  static const double xdHeightSize = 667.0;
  static const double xdWidhtSize = 375.0;

  static void setHeightSize(double size) {
    heightSize = size;
    heightPercentage = heightSize / xdHeightSize;
  }

  static void setWidthSize(double size) {
    widthSize = size;
    widthPercentage = widthSize / xdWidhtSize;
  }
}
