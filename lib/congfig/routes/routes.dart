import 'package:farmacy_app/features/location_screen/presentation/pages/location_screen.dart';
import 'package:farmacy_app/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/location_screen/presentation/pages/governorate_screen.dart';


class Routes{

  static const String splashScreen = "/";
  static const String locationScreen = "primaryScreen";
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
