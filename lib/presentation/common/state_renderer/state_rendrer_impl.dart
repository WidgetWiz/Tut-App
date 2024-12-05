import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wellos/presentation/common/state_renderer/state_renderer.dart';

import '../../../app/constants.dart';
import '../../resources/stringes_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String? message;

  LoadingState(
      {required this.stateRendererType, String message = AppStrings.loading});
  @override
  String getMessage() => message ?? AppStrings.loading;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;
  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ContentState extends FlowState {
  @override
  String getMessage() => Constants.empty;
  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

class EmptyState extends FlowState {
  String message;
  EmptyState(this.message);
  @override
  String getMessage() => message;
  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
      BuildContext context, Widget contentScreenWidget, Function retryAction) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            showPopup(context, getStateRendererType(), getMessage());
            return contentScreenWidget;
          } else {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                retryActionFunction: retryAction);
          }
        }
      case ErrorState:
        {}
      case ContentState:
        {}
      case EmptyState:
        {}
      default:
        {
          break;
        }
    }
  }

  showPopup(BuildContext context, StateRendererType stateRendererType,
      String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (BuildContext context) => StateRenderer(
                stateRendererType: stateRendererType,
                message: message,
                retryActionFunction: () {},
              ));
    });
  }
}
