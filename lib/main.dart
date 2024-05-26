import 'package:bloc/bloc.dart';
import 'package:farmacy_app/congfig/routes/routes.dart';
import 'package:farmacy_app/features/home/data/data_sources/cart_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/categories_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/medicien_data_source.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:farmacy_app/features/login_screen/data/data_sources/login_user_data_source.dart';
import 'package:farmacy_app/features/login_screen/presentation/manager/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

import 'core/utils/api_keys.dart';
import 'core/utils/observer.dart';

void main() {
  runApp(const MyApp());
  Stripe.publishableKey = ApiKys.stripePublishableKey;
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        initialRoute: Routes.splashView,
        onGenerateRoute: (settings) => AppRouts.onGenerateRoute(settings),
      ),
    );
  }
}
//admin@roshetta.net
// secretpassword
