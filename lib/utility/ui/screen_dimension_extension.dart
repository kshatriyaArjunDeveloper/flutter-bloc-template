import 'package:boilerplate/values/app_dimension.dart';
import 'package:flutter/material.dart';

extension MediaQueryProvider on BuildContext {
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  double get bottomNavigationHeight {
    AppDimension().setBottomNavigationHeight = padding.bottom;
    return AppDimension().getBottomNavigationHeight;
  }

  double get statusBarHeight => padding.top;

  double get keyboardHeight {
    AppDimension().setKeyboardHeight = viewInsets.bottom;
    return AppDimension().keyboardHeight;
  }

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;
}
