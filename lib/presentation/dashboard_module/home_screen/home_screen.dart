import 'package:boilerplate/presentation/dashboard_module/home_screen/bloc/home_screen_cubit.dart';
import 'package:boilerplate/presentation/delete_module/select_language_screen/select_language_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          print("HI");
          // SelectLanguageScreen.navigate(context);
          context.read<HomeScreenCubit>().runPayment(100.90);
        }),
      ),
    );
  }
}
