import 'package:farmacy_app/features/RegisterScreen/presentation/manager/provider/register_provider.dart';
import 'package:farmacy_app/features/RegisterScreen/presentation/pages/register_screen.dart';
import 'package:farmacy_app/features/dash_board/presentation/pages/dash_baord_categories_screen.dart';
import 'package:farmacy_app/features/dash_board/presentation/pages/dash_baord_cmedicines_screen.dart';
import 'package:farmacy_app/features/forget_password_screen/presentation/manager/provider.dart';
import 'package:farmacy_app/features/forget_password_screen/presentation/pages/forget_password_screen.dart';
import 'package:farmacy_app/features/home/data/data_sources/cart_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/categories_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/medicien_data_source.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:farmacy_app/features/location_screen/presentation/pages/location_screen.dart';
import 'package:farmacy_app/features/login_screen/presentation/manager/provider.dart';
import 'package:farmacy_app/features/login_screen/presentation/pages/login_screen.dart';
import 'package:farmacy_app/features/splash_screen/presentation/pages/splash/presentation/views/splash_view.dart';
import 'package:farmacy_app/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/RegisterScreen/data/data_sources/register_data_source.dart';
import '../../features/forget_password_screen/data/data_sources/forget_passord_data_sources.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/location_screen/data/data_sources/branches_data_source.dart';
import '../../features/location_screen/presentation/manager/locatin/provider.dart';
import '../../features/location_screen/presentation/pages/governorate_screen.dart';
import '../../features/login_screen/data/data_sources/login_user_data_source.dart';

class Routes {
  static const String splashScreen = "/";
  static const String splashView = "splashView";
  static const String locationScreen = "locationScreen";
  static const String loginScreen = "loginScreen";
  static const String registerScreen = "registerScreen";
  static const String forgetPasswordScreen = "forgetPasswordScreen";
  static const String governorateScreen = "governorateScreen";
  static const String homeScreen = "homeScreen";
  static const String paymentScreen = "paymentScreen";
  static const String dashBoardScreen = "dashBoardCategoriesScreen";
}

class AppRouts {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.splashView:
        return MaterialPageRoute(builder: (context) {
          return const SplashView();
        });


      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case Routes.locationScreen:
        return MaterialPageRoute(builder: (context) {
          return ChangeNotifierProvider(create: (BuildContext context) {
            return LocationProvider(branchesDataSource: RemoteBranchesDataSource());
          },
          child: const LocationScreen());
        });

      case Routes.governorateScreen:
        return MaterialPageRoute(builder: (context) {
          return ChangeNotifierProvider(create: (BuildContext context) {
            return LocationProvider(branchesDataSource: RemoteBranchesDataSource());
          },
          child: const GovernorateScreen());
        });
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) {
          return LoginScreen();
        });
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) {
          return ChangeNotifierProvider(
              create: (BuildContext context) {
                return RegisterProvider(
                    registerDataSource: RemoteRegisterDataSource());
              },
              child: const RegisterScreen());
        });
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (context) {
          return ChangeNotifierProvider(create: (BuildContext context) {
            return ForgetPasswordProvider(
                forgetPasswordDataSource: RemoteForgetPasswordDataSource());
          },
              child: const ForgetPasswordScreen());
        });

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) {
          return MultiProvider(providers: [
            ChangeNotifierProvider (create: (BuildContext context) {
              return  HomeProvider(categoriesDataSource: RemoteCategoriesDataSource(),
                  medicineDataSource: RemoteMedicineDataSource(), cartDataSource: RemoteCartDataSource());
            },),
          ],
          child: const HomeScreen());
        });


      case Routes.dashBoardScreen:
        return MaterialPageRoute(builder: (context) {
          return ChangeNotifierProvider(create: (BuildContext context) {
            return HomeProvider(categoriesDataSource: RemoteCategoriesDataSource(), medicineDataSource: RemoteMedicineDataSource(), cartDataSource: RemoteCartDataSource());
          },
          child: const DashBoardCategoriesScreen());
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
