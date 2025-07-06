import 'package:boilerplate/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:quickui/quickui.dart';

class ErrorStateWidget extends StatelessWidget {
  final String heading;
  final String? text;
  final String buttonText;
  final String? illustrationPath;
  final VoidCallback onPressed;

  const ErrorStateWidget({
    super.key,
    required this.heading,
    this.text,
    required this.buttonText,
    required this.illustrationPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image_(
          assetName: illustrationPath,
          height: 200,
        ),
        Gap(24.h),
        Text(
          heading,
          style: AppTextStyles.proximaS1SemiBold18,
          textAlign: TextAlign.center,
        ),
        if (text != null)
          Padding_(
            topPadding: 12.h,
            child: Text(
              text!,
              style: AppTextStyles.proximaS1SemiBold18,
              textAlign: TextAlign.center,
            ),
          ),
        Padding_(
          topPadding: 12.h,
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: AppTextStyles.proximaS1SemiBold18.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
