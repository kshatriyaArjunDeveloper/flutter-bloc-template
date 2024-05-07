class AppDimension {
  AppDimension._();

  static AppDimension? _instance;

  factory AppDimension() {
    _instance ??= AppDimension._();
    return _instance!;
  }

  double _bottomNavigationHeight = 0;
  double _keyboardHeight = 240;

  double get getBottomNavigationHeight => _bottomNavigationHeight;

  set setBottomNavigationHeight(double height) {
    if (height > _bottomNavigationHeight) _bottomNavigationHeight = height;
  }

  double get keyboardHeight => _keyboardHeight;

  set setKeyboardHeight(double height) {
    if (height > _keyboardHeight) _keyboardHeight = height;
  }
}
