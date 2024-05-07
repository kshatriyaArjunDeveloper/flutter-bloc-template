import 'package:boilerplate/component/card/select_language_card.dart';
import 'package:boilerplate/component/miscellaneous/error_state_widget.dart';
import 'package:boilerplate/presentation/miscellaneous_module/widget_screen/widget/class_heading_widget.dart';
import 'package:boilerplate/utility/ui/screen_dimension_extension.dart';
import 'package:boilerplate/values/app_illustrations.dart';
import 'package:flutter/material.dart';
import 'package:quickui/quickui.dart';

class WidgetScreen extends StatelessWidget {
  const WidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container_(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blueGrey,
          allPadding: 20,
          child: Padding_(
            allPadding: 8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ClassHeadingWidget(
                    headingText: 'WidgetFileName',
                  ),
                  Container_(
                    borderColor: Colors.black,
                    width: double.infinity,
                    height: context.height * 0.5,
                    child: ErrorStateWidget(
                      heading: 'heading',
                      buttonText: 'buttonText',
                      illustrationPath: AppIllustrations.nameIls,
                      text: 'text',
                      onPressed: () {},
                    ),
                  ),
                  const ClassHeadingWidget(
                    headingText: 'SelectLanguageCard',
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: SelectLanguageCard(
                          greetingText: 'Hello',
                          language: 'English',
                          alphabets: 'Ae',
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: SelectLanguageCard(
                          greetingText: 'Hello',
                          language: 'English',
                          alphabets: 'Ae',
                          isSelected: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
