part of 'select_language_cubit.dart';

@freezed
class SelectLanguageState with _$SelectLanguageState {
  const factory SelectLanguageState({
    @Default([]) List<LanguageResponseDto> languageList,
    required ScreenStateUIModel screenState,
  }) = _SelectLanguageState;
}
