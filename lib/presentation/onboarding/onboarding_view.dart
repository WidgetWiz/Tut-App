import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wellos/presentation/resources/assets_manager.dart';
import 'package:wellos/presentation/resources/color_manager.dart';
import 'package:wellos/presentation/resources/stringes_manager.dart';
import 'package:wellos/presentation/resources/values_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingDesc1,
            ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingDesc2,
            ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingDesc3,
            ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingDesc4,
            ImageAssets.onboardingLogo4),
        SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingDesc1,
            ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingDesc2,
            ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingDesc3,
            ImageAssets.onboardingLogo3),
        // todo: remove duplicates
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return OnboardingScreen(_list[index]);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.end,
                  )),
            ),
            //_getBottomSheetWidget(context),
            // ToDo : bottom sheet Implementation
          ],
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnboardingScreen(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        Image.asset(_sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
