import 'package:flutter/material.dart';
import 'package:quickui/quickui.dart';

class ClassHeadingWidget extends StatelessWidget {
  const ClassHeadingWidget({
    super.key,
    required this.headingText,
  });

  final String headingText;

  @override
  Widget build(BuildContext context) {
    return Container_(
      verticalMargin: 16,
      width: double.infinity,
      color: Colors.white,
      allPadding: 16,
      child: Text(
        headingText,
      ),
    );
  }
}
