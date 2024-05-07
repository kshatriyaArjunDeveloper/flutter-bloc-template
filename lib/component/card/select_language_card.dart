import 'dart:convert';
import 'dart:ui';

import 'package:boilerplate/theme/app_colors.dart';
import 'package:boilerplate/theme/app_fonts.dart';
import 'package:boilerplate/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickui/quickui.dart';

// todo @Project Setup: Delete this
class SelectLanguageCard extends StatelessWidget {
  final bool isSelected;
  final String greetingText;
  final String language;
  final String alphabets;
  final bool glyphNeedsExtraPadding;

  const SelectLanguageCard({
    super.key,
    required this.greetingText,
    required this.language,
    required this.alphabets,
    this.isSelected = false,
    this.glyphNeedsExtraPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    String? alpha;
    if (language == 'German') {
      final List<String> stringList = alphabets.split(']');
      List<int> listOfInts = List<int>.from(jsonDecode('${stringList.first}]'));
      alpha = utf8.decode(listOfInts) + stringList.last;
    }
    return Container_(
      allCornerRadius: 12,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          blendMode: BlendMode.src,
          child: Container_(
            topPadding: 12,
            leftPadding: 12,
            borderColor: isSelected ? Colors.white.withOpacity(0.1) : null,
            borderWidth: isSelected ? 1 : 0,
            color: isSelected ? null : Colors.white.withOpacity(0.2),
            gradient: isSelected ? AppGradients.gold : null,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      greetingText,
                      style: AppTextStyles.proximaS1SemiBold18.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Padding_(
                      bottomPadding: 8,
                      child: Text(
                        language,
                        style: AppTextStyles.proximaS1SemiBold18.copyWith(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding_(
                  rightPadding: 2,
                  bottomPadding: glyphNeedsExtraPadding ? 12 : 0,
                  child: Text(
                    alpha ?? alphabets,
                    style: TextStyle(
                      color: AppColors.brand.withOpacity(0.15),
                      fontSize: (glyphNeedsExtraPadding) ? 54.sp : 64.sp,
                      fontFamily: AppFonts.proxima,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
