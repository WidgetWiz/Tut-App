import 'dart:async';
import 'dart:ffi';

import 'package:wellos/app/domain/models.dart';

import '../../base/baseviewmodel.dart';
import '../../resources/assets_manager.dart';
import '../../resources/stringes_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //stream controllers outputs
  StreamController _streamController = StreamController<SliderViewObject>();
  StreamController _isPasswordValidedStreamController =
      StreamController<Bool>();
  late final List<SliderObject> _list;

  // OnBoardingViewModelInputs implementation
  @override
  void dispose() {
    // Implement dispose logic here
    _streamController.close();
    _isPasswordValidedStreamController.close();
  }

  @override
  void start() {
    // Implement start logic here
    _list = _getSliderData();
    InputIsPasswordValid.add("123456");
  }

  @override
  void goBack() {
    // TODO: implement goBack
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void onPageChange(int index) {
    // TODO: implement onPageChange
  }
//OnBoardingViewModelInputs
  @override
  Sink get InputSliderViewObject => _streamController.sink;
//OnBoardingViewModelOutputs
  @override
  // TODO: implement OutputSliderViewObject
  Stream<SliderViewObject> get OutputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onboarding private functions
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingDesc1,
            ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingDesc2,
            ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingDesc3,
            ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingDesc4,
            ImageAssets.onboardingLogo4),
      ];

  @override
  // TODO: implement InputIsPasswordValid
  Sink get InputIsPasswordValid => _isPasswordValidedStreamController.sink;

  @override
  // TODO: implement OutputIsPasswordValid
  Stream<Bool> get OutputIsPasswordValid =>
      _isPasswordValidedStreamController.stream.map((password) => password);

  // get inputIsPasswordValided => null;
}

// Orders that will be received from the view
mixin OnBoardingViewModelInputs {
  void goNext(); // Swipe left or right arrow click
  void goBack(); // Swipe right or left arrow click
  void onPageChange(int index);

  //stream controller input
  Sink get InputSliderViewObject;
  Sink get InputIsPasswordValid;
}

// Outputs for the view
mixin OnBoardingViewModelOutputs {
  //stream controller output
  Stream<SliderViewObject> get OutputSliderViewObject;
  Stream<Bool> get OutputIsPasswordValid;
}
