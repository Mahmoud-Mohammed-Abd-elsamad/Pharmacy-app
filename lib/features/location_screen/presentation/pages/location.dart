
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class SelectLocation extends StatelessWidget {
   SelectLocation({super.key});

  List<Placemark>? placePackerAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpenStreetMapSearchAndPick(
        buttonTextStyle:
        const TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
        buttonColor: Colors.blue,
        buttonText: 'Set Current Location',
        onPicked: (pickedData)async {
          print("latitude :"+pickedData.latLong.latitude.toString());
          print("longitude : "+pickedData.latLong.longitude.toString());
          print(pickedData.address);
          print(pickedData.addressName);
            log("in try");
            placePackerAddress =
                await placemarkFromCoordinates(
                    pickedData.latLong.latitude,
                    pickedData.latLong.longitude);
            log("in try done $placePackerAddress");
            Future.delayed(const Duration(seconds: 3), () {
              log("placeMaker ${placePackerAddress![0].administrativeArea}");
              Navigator.pop(context,{"state":placePackerAddress![0].administrativeArea,"city":placePackerAddress![0].subAdministrativeArea});

            });

        }

      ),
    );
  }
}
