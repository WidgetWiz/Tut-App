import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wellos/presentation/resources/assets_manager.dart';
import 'package:wellos/presentation/resources/color_manager.dart';
import 'package:wellos/presentation/resources/styles_manager.dart';
import 'package:wellos/presentation/resources/values_manager.dart';
import '../../resources/stringes_manager.dart';

enum StateRendererType {
  popupLoadingState,
  popupErrorState,
//todo implement success state
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  contentState
}

class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  Function? retryActionFunction;

  StateRenderer({
    required this.stateRendererType,
    this.message = AppStrings.loading,
    this.title = '',
    required this.retryActionFunction,
  });

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(
          context,
          [_getAnimatedImage(JsonAssets.loadingAnimation)],
        );

      case StateRendererType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.errorAnimation),
          _getMessageWidget(message),
          _getRetryButton(AppStrings.ok, context)
        ]);

      case StateRendererType.fullScreenLoadingState:
        return _getColumnItems([
          _getAnimatedImage(JsonAssets.loadingAnimation),
          _getMessageWidget(message)
        ]);

      case StateRendererType.fullScreenErrorState:
        return _getColumnItems([
          _getAnimatedImage(JsonAssets.errorAnimation),
          _getMessageWidget(message),
          _getRetryButton(AppStrings.retry, context)
        ]);

      case StateRendererType.fullScreenEmptyState:
        return _getColumnItems([
          _getAnimatedImage(JsonAssets.emptyAnimation),
          _getMessageWidget(message)
        ]);

      case StateRendererType.contentState:
        return Container();

      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, children) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 15,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              )
            ]),
        child: _getDialogContent(children, context),
      ),
    );
  }

  Widget _getDialogContent(List<Widget> children, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getColumnItems(List<Widget> children) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children);
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessageWidget(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: getRegularStyle(
            color: ColorManager.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.all(AppPadding.p18),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                if (stateRendererType ==
                    StateRendererType.fullScreenErrorState) {
                  retryActionFunction?.call();
                } else {
                  //popUp
                  Navigator.of(context).pop();
                }
              },
              child: Text(buttonTitle))),
    ));
  }
}
