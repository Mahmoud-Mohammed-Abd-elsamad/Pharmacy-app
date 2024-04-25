import 'package:farmacy_app/features/location_screen/presentation/pages/governorate_screen.dart';
import 'package:farmacy_app/features/location_screen/presentation/pages/location_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Routes{

  static const String splashScreen = "/";
  static const String locationScreen = "primaryScreen";
  static const String governorateScreen = "governorateScreen";


}

class AppRouts{

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context){
          return  const LocationScreen();
        });

      case Routes.locationScreen:
        return MaterialPageRoute(builder: (context){
          return  const LocationScreen();
        });

      case Routes.governorateScreen:
        return MaterialPageRoute(builder: (context){
          return  const GovernorateScreen();
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
