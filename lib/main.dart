
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:farmacy_app/congfig/routes/routes.dart';
import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/features/home/data/data_sources/cart_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/categories_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/medicien_data_source.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:farmacy_app/features/login_screen/data/data_sources/login_user_data_source.dart';
import 'package:farmacy_app/features/login_screen/presentation/manager/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'core/utils/api_keys.dart';
import 'core/utils/cach_helper.dart';
import 'core/utils/observer.dart';

void main() async{

  await Hive.initFlutter();
  await CachHelper.init();
  Stripe.publishableKey = ApiKys.stripePublishableKey;
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var initialRoute = Routes.splashView;
  @override
  void initState() {

    if( CachHelper.getUserId() == null){
      initialRoute = Routes.splashView;
      log(">>>>>>>>>getUserId ${CachHelper.getUserId()}");
    }else{
      log(">>>>>>>>> getUserId ${CachHelper.getUserId()}");
      if(CachHelper.getAdmin() != null && CachHelper.getAdmin() == true){
        initialRoute = Routes.dashBoardScreen;
        log(">>>>>>>>> is Admin true ");
      } else{
        log(">>>>>>>>> is Admin false ");
        initialRoute = Routes.homeScreen;

      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(categoriesDataSource: RemoteCategoriesDataSource(), medicineDataSource: RemoteMedicineDataSource(), cartDataSource: RemoteCartDataSource()),
        ),ChangeNotifierProvider(
          create: (context) => LoginProvider(loginUserDataSource: RemoteLoginUserDataSource())
        ),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: (settings) => AppRouts.onGenerateRoute(settings),
      ),
    );
  }
}
//admin@roshetta.net
// secretpassword
