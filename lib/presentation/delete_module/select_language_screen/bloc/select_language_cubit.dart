import 'package:boilerplate/data/dto/response_dto/delete_dto/language_response_dto.dart';
import 'package:boilerplate/data/repository/miscellaneous_repository.dart';
import 'package:boilerplate/utility/ui/screen_state_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_language_cubit.freezed.dart';
part 'select_language_state.dart';

class SelectLanguageCubit extends Cubit<SelectLanguageState> {
  final MiscellaneousRepository _miscellaneousRepository =
      MiscellaneousRepository();

  SelectLanguageCubit()
      : super(
          SelectLanguageState(
            screenState: LoadingState(),
          ),
        ) {
    getAllLanguages();
  }

  Future<void> getAllLanguages() async {
    emit(
      SelectLanguageState(
        screenState: LoadingState(),
      ),
    );
    final response = await _miscellaneousRepository.getAllLanguages();

    emit(
      state.copyWith(
        screenState: response.toScreenState(),
      ),
    );

    if (response.hasData()) {
      emit(
        state.copyWith(
          languageList: response.baseResponse!.data!,
        ),
      );
    } else if (response.hasBackendErrorMessage()) {
    } else if (response.hasNoBackendResponse()) {}
  }
}
