import 'package:bloc/bloc.dart';
import 'package:farmacy_app/congfig/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      onGenerateRoute: (settings) => AppRouts.onGenerateRoute(settings),
    );
  }
}
