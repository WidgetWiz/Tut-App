import 'package:flutter/material.dart';
import 'package:wellos/app/di.dart';
import 'package:wellos/presentation/forgot_password/forgot_password_view.dart';
import 'package:wellos/presentation/login/view/login_view.dart';
import 'package:wellos/presentation/main/main_view.dart';
import 'package:wellos/presentation/onboarding/view/onboarding_view.dart';
import 'package:wellos/presentation/register/register_view.dart';
import 'package:wellos/presentation/resources/stringes_manager.dart';
import 'package:wellos/presentation/splash/splash_view.dart';
import 'package:wellos/presentation/store_details/store_details_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = 'onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
