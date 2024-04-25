import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/location_screen_header.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          color: Colors.red,
          child: Column(
            children: [
               LocationScreenHeader(),
              const Expanded(child: SizedBox()),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("Sorry,No available branches for delivery, please select",style: AppStyles.regular16(context).copyWith(color: Colors.grey),)),
                  Center(child: Text("another location",style: AppStyles.regular16(context).copyWith(color: Colors.grey),))
                ],
              ),
              const Expanded(child: SizedBox()),


            ],
          ),
        ));
  }
}

