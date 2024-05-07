import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:quickui/quickui.dart';

class AppColors {
  AppColors._();

  static const Color brand = Color(0xFF5F7DFD);
}

class AppGradients {
  AppGradients._();

  static LinearGradient gold = LinearGradient(
    begin: const Alignment(-0.9, -0.9),
    end: const Alignment(0.9, 0.9),
    transform: const GradientRotation(0.9 * (math.pi / 2)),
    stops: const [
      0.2,
      0.3,
      0.5,
      0.65,
      0.95,
      1,
      1,
    ],
    colors: [
      '#C9A31D'.clr(),
      '#E9BC1D'.clr(),
      '#F6DC7D'.clr(),
      '#EFCA48'.clr(),
      '#D0990A'.clr(),
      '#DAAC36'.clr(),
      '#CCA312'.clr(),
    ],
  );
}
