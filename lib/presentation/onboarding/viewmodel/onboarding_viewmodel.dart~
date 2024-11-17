import 'dart:async';
import 'package:wellos/app/domain/models.dart';
import '../../base/baseviewmodel.dart';
import '../../resources/assets_manager.dart';
import '../../resources/stringes_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //stream controllers outputs
  final _streamController = StreamController<SliderViewObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;

  // OnBoardingViewModelInputs implementation
  @override
  void dispose() {
    // Implement dispose logic here
    _streamController.close();
  }

  @override
  void start() {
    // Implement start logic here
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goBack() {
    if (_currentIndex <= 0) {
      return _list.length - 1;
    } else {
      return _currentIndex - 1;
    }
  }

  @override
  int goNext() {
    if (_currentIndex >= _list.length - 1) {
      return 0;
    } else {
      return _currentIndex + 1;
    }
  }

  @override
  void onPageChange(int index) {
    _currentIndex = index;
    _postDataToView();
  }

//OnBoardingViewModelInputs
  @override
  Sink get inputSliderViewObject => _streamController.sink;
//OnBoardingViewModelOutputs
  @override
  // TODO: implement OutputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
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

  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

// Orders that will be received from the view
mixin OnBoardingViewModelInputs {
  void goNext(); // Swipe left or right arrow click
  void goBack(); // Swipe right or left arrow click
  void onPageChange(int index);

  //stream controller input
  Sink get inputSliderViewObject;
}

// Outputs for the view
mixin OnBoardingViewModelOutputs {
  //stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}
