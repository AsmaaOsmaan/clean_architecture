import 'package:clean_architecture_app/presentation/main/main_view.dart';
import 'package:clean_architecture_app/presentation/onboarding/view/onboarding_view.dart';
import 'package:clean_architecture_app/presentation/register/register_view.dart';
import 'package:clean_architecture_app/presentation/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../forget_password/forget_password_view.dart';
import '../login/view/login_view.dart';
import 'app_strings.dart';

class Routes{
  static const String splashRoute='/';
  static const String loginRoute='/login';
  static const String registerRoute='/register';
  static const String onBoardingRoute='/onBoarding';
  static const String forgetPasswordRoute='/forgetPassword';
  static const String mainRoute='/main';
  static const String storeDetailsRoute='/storeDetails';
}
class RouteGenerator{
  static Route<dynamic>getRoute(RouteSettings settings){
switch (settings.name){
  case Routes.splashRoute:
    return MaterialPageRoute(builder: (_)=> const SplahView());
  case Routes.loginRoute:
    return MaterialPageRoute(builder: (_)=> const LoginView());
  case Routes.forgetPasswordRoute:
    return MaterialPageRoute(builder: (_)=> const ForgetPasswordView());
  case Routes.registerRoute:
    return MaterialPageRoute(builder: (_)=> const RegisterView());
  case Routes.mainRoute:
    return MaterialPageRoute(builder: (_)=> const MainView());
  case Routes.onBoardingRoute:
    return MaterialPageRoute(builder: (_)=> const OnBoardingView());
    default:
      return UnDefinedRoute();
}
  }
  static Route<dynamic>UnDefinedRoute(){
    return MaterialPageRoute(builder: (_)=> Scaffold(

      appBar: AppBar(
        title:const Text(AppString.noRouteFound),
      ),
      body:const  Center(child: Text(AppString.noRouteFound)) ,
    ));

  }

}