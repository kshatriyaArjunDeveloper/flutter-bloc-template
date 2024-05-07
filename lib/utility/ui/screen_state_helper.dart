import 'package:boilerplate/component/miscellaneous/error_state_widget.dart';
import 'package:boilerplate/router/go_route.dart';
import 'package:boilerplate/utility/network/result.dart';
import 'package:boilerplate/values/app_illustrations.dart';
import 'package:boilerplate/values/app_strings.dart';
import 'package:flutter/material.dart';

sealed class ScreenStateUIModel {}

class InitialState extends ScreenStateUIModel {}

class DataFetchedState extends ScreenStateUIModel {}

class LoadingState extends ScreenStateUIModel {}

class NoInternetState extends ScreenStateUIModel {}

class ErrorState extends ScreenStateUIModel {
  final String message;
  final int errorCode;

  ErrorState({
    required this.message,
    required this.errorCode,
  });
}

extension ScreenStateUIModelExtension on ScreenStateUIModel {
  Widget showScreenState({
    required VoidCallback onPressed,
    required Widget Function() buildSlotWidget,
    bool handleLoading = true,
    List<int>? errorCodeToNotHandleList,
  }) {
    switch (this) {
      case InitialState():
        return buildSlotWidget();
      case DataFetchedState():
        return buildSlotWidget();
      case LoadingState():
        return handleLoading ? _buildLoadingWidget() : buildSlotWidget();
      case NoInternetState():
        return _noInternetStateWidget(
          onPressed: onPressed,
        );
      case ErrorState(
          errorCode: int errorCode,
          message: String message,
        ):
        if (errorCodeToNotHandleList != null &&
            errorCodeToNotHandleList.contains(errorCode)) {
          return buildSlotWidget();
        } else {
          return _buildErrorWidget(message);
        }

      default:
        return ErrorStateWidget(
          heading: AppStrings.somethingWentWrong,
          text: AppStrings.goBackRetryErrorStateWidget,
          illustrationPath: AppIllustrations.nameIls,
          buttonText: AppStrings.goBackErrorStateWidget,
          onPressed: () => goRouter.pop(),
        );
    }
  }

  ErrorStateWidget _buildErrorWidget(String message) {
    return ErrorStateWidget(
      heading: message,
      illustrationPath: AppIllustrations.nameIls,
      text: AppStrings.goBackRetryErrorStateWidget,
      buttonText: AppStrings.goBackErrorStateWidget,
      onPressed: () => goRouter.pop(),
    );
  }

  ErrorStateWidget _noInternetStateWidget({
    required VoidCallback onPressed,
  }) {
    return ErrorStateWidget(
      heading: AppStrings.noInternet,
      illustrationPath: AppIllustrations.nameIls,
      text: AppStrings.noInternetRetryErrorStateWidget,
      buttonText: AppStrings.retryErrorStateWidget,
      onPressed: onPressed,
    );
  }

  Center _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}

extension ResultUiExtension on Result {
  ScreenStateUIModel toScreenState() {
    if (hasData()) {
      return DataFetchedState();
    } else if (hasBackendErrorMessage()) {
      return ErrorState(
        errorCode: statusCode,
        message: baseResponse!.message!,
      );
    } else {
      if (isNoInternet) {
        return NoInternetState();
      } else {
        return ErrorState(
          errorCode: statusCode,
          message: noResponseError!,
        );
      }
    }
  }
}
