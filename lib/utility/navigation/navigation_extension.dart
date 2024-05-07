import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void goBackTill(String routeName) {
    Navigator.popUntil(
      this,
      (route) => route.settings.name == routeName,
    );
  }
}
