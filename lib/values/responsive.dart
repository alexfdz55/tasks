part of values;

class Responsive {
  late double height, width, diagonal, heihtSafeArea;
  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    diagonal = sqrt(pow(height, 2) + pow(width, 2));
    heihtSafeArea = MediaQuery.of(context).padding.top;
  }

  double wp(double percent) => width * percent / 100;
  double hp(double percent) => height * percent / 100;
  double dp(double percent) => diagonal * percent / 100;

  double wDisponible(double percent, double ancho) =>
      (width - ancho) * percent / 100;

  double hpDisponible({required double percent, bool bottomBar = true}) {
    double h;
    if (bottomBar) {
      h = 160;
    } else {
      h = 110;
    }
    return (height - h) * percent / 100;
  }

  double dpHeightDisponible() =>
      height - (AppBar().preferredSize.height + heihtSafeArea);

  optionDevice({
    required mobileOption,
    required tabletOption,
    required desktopOption,
  }) {
    final w = width;
    // If our width is more than 1100 then we consider it a desktop
    if (w >= 1100) {
      return desktopOption;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (w >= 500 && w < 1100) {
      return tabletOption;
    }
    // Or less then that we called it mobile
    else {
      return mobileOption;
    }
  }

  // double dp(double percent) => this.diagonal * percent / 100;
}
