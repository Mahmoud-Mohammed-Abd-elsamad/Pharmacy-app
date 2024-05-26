import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manager/locatin/provider.dart';
import '../widgets/location_screen_body.dart';
import '../widgets/location_screen_header.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          children: [
             LocationScreenHeader(),
          //  const Expanded(child: SizedBox()),
            Expanded(flex: 3,child: LocationScreenBody(findBranches: Provider.of<LocationProvider>(context, listen: true).branches.isNotEmpty  ? true : false,)),
            const Expanded(child: SizedBox()),


          ],
        ));
  }
}


