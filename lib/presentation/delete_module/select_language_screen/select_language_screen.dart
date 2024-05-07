import 'package:boilerplate/component/card/select_language_card.dart';
import 'package:boilerplate/presentation/delete_module/select_language_screen/bloc/select_language_cubit.dart';
import 'package:boilerplate/router/app_routes.dart';
import 'package:boilerplate/theme/app_text_styles.dart';
import 'package:boilerplate/utility/ui/screen_state_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quickui/quickui.dart';

class SelectLanguageScreen extends StatelessWidget {
  static navigate(BuildContext context) => context.push(
        AppRoutes.selectLanguageScreen,
      );

  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: BlocBuilder<SelectLanguageCubit, SelectLanguageState>(
          builder: (context, state) {
            return state.screenState.showScreenState(
              onPressed: () {
                context.read<SelectLanguageCubit>().getAllLanguages();
              },
              buildSlotWidget: () => Padding_(
                allPadding: 24.w,
                child: _buildContent(
                  state,
                  context,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(
    SelectLanguageState state,
    BuildContext context,
  ) {
    if (state.languageList.isEmpty) {
      return Center(
        child: Text(
          'No Results Found!',
          style: AppTextStyles.proximaS1SemiBold18.copyWith(
            color: Colors.white,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select your preferred language',
          style: AppTextStyles.proximaS1SemiBold18.copyWith(
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Padding_(
            topPadding: 24,
            child: buildSelectLanguageCardGrid(state),
          ),
        ),
      ],
    );
  }

  Widget buildSelectLanguageCardGrid(
    SelectLanguageState state,
  ) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 165 / 96,
        ),
        itemCount: state.languageList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = state.languageList[index];
          return SelectLanguageCard(
            greetingText: item.greeting ?? '',
            language: item.languageType,
            alphabets: item.alphabet ?? '',
            isSelected: index == 0,
            glyphNeedsExtraPadding: item.languageType == 'Mandarin',
          );
        });
  }
}
