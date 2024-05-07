import 'package:boilerplate/presentation/delete_module/select_language_screen/select_language_screen.dart';
import 'package:flutter/material.dart';
import 'package:quickui/quickui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text(
          'Home Screen\nGo to select language',
        ).onClick(() {
          SelectLanguageScreen.navigate(context);
        }),
      ),
    );
  }
}
