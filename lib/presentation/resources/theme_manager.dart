import 'package:flutter/material.dart';
import 'package:wellos/presentation/resources/color_manager.dart';
import 'package:wellos/presentation/resources/font_manager.dart';
import 'package:wellos/presentation/resources/styles_manager.dart';
import 'package:wellos/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.lightGrey,

    // cardview theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white),
    ),

    // button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.lightGrey,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s18),
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    // text theme
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s22),
      titleMedium:
          getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s18),
      bodySmall:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle:
            getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        labelStyle:
            getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),
        //enabled
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        //focused
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        //error
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1)),
        //focused error
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1))),
  );
}
