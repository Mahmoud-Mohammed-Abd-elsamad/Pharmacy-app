import 'package:farmacy_app/features/RegisterScreen/presentation/pages/register_screen.dart';
import 'package:farmacy_app/features/forget_password_screen/presentation/pages/forget_password_screen.dart';
import 'package:farmacy_app/features/location_screen/presentation/pages/location_screen.dart';
import 'package:farmacy_app/features/login_screen/presentation/pages/login_screen.dart';
import 'package:farmacy_app/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/location_screen/presentation/pages/governorate_screen.dart';


class Routes{

  static const String splashScreen = "/";
  static const String locationScreen = "locationScreen";
  static const String loginScreen = "loginScreen";
  static const String registerScreen = "registerScreen";
  static const String forgetPasswordScreen = "forgetPasswordScreen";
  static const String governorateScreen = "governorateScreen";
  static const String homeScreen = "homeScreen";


}

class AppRouts{

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context){
          return  const SplashScreen();
        });

      case Routes.locationScreen:
        return MaterialPageRoute(builder: (context){
          return  const LocationScreen();
        });

      case Routes.governorateScreen:
        return MaterialPageRoute(builder: (context){
          return  const GovernorateScreen();
        });
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context){
          return   LoginScreen();
        });
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context){
          return  const RegisterScreen();
        });
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (context){
          return  const ForgetPasswordScreen();
        });

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context){
          return  const HomeScreen();
        });

      default:
        return MaterialPageRoute(builder: (context) {
          return unDefindScreen();
        });

    }
    }
  static Widget unDefindScreen() {
    return const Scaffold(
      body: Center(child: Text("Undefind screen")),
    );
  }


}
