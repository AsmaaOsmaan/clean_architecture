import 'package:clean_architecture_app/presentation/resources/font_manger.dart';
import 'package:clean_architecture_app/presentation/resources/styles_manager.dart';
import 'package:clean_architecture_app/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
ThemeData getApplecationTheme(){
  return ThemeData(

    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkGray,
    disabledColor: ColorManager.gray1,
   //cardView theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,

  ),
    // app bar theme
    appBarTheme: AppBarTheme(
      elevation: AppSize.s4,
      color: ColorManager.primary,
      shadowColor: ColorManager.lightPrimary,
      centerTitle: true,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16
      )
    ),

      // button theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primary,
      disabledColor: ColorManager.gray1,
      splashColor: ColorManager.lightPrimary,
      shape:const  StadiumBorder(),
  ),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s17),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(AppSize.s12)
        )
      )
    ),
    textTheme: TextTheme(
      displayLarge: getLightStyle(color: ColorManager.white,fontSize: FontSize.s12),
      headlineLarge: getSemiBoldStyle(color: ColorManager.darkGray,fontSize: FontSize.s16),
      titleMedium: getMediumStyle(color: ColorManager.lightGrey,fontSize: FontSize.s14),
      bodyLarge: getRegularStyle(color: ColorManager.grey),
      bodySmall: getRegularStyle(color: ColorManager.grey)
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:const  EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s14),
      labelStyle: getMediumStyle(color: ColorManager.grey,fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error,),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
        borderRadius:const  BorderRadius.all(Radius.circular(AppSize.s8))
      ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s1_5),
            borderRadius:const  BorderRadius.all(Radius.circular(AppSize.s8))
        ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error,width: AppSize.s1_5),
          borderRadius:const  BorderRadius.all(Radius.circular(AppSize.s8))
      ),
      focusedErrorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
          borderRadius:const  BorderRadius.all(Radius.circular(AppSize.s8))
      )
    ),
    
    



  );
}