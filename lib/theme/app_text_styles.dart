import 'package:boilerplate/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_fonts.dart';

/// By default font is Proxima
class AppTextStyles {
  AppTextStyles._privateConstructor();

  static TextStyle proximaS1SemiBold18 = TextStyle(
    fontFamily: AppFonts.proxima,
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    color: AppColors.brand,
  );
}
