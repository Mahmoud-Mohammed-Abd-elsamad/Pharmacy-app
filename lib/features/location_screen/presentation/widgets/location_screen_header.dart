import 'dart:developer';

import 'package:farmacy_app/features/location_screen/presentation/manager/locatin/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoding/geocoding.dart';

import 'package:geolocator/geolocator.dart';
import '../../../../../../../congfig/routes/routes.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../pages/location.dart';
import 'custom_dropdown_menu_button.dart';

class LocationScreenHeader extends StatefulWidget {
  LocationScreenHeader({
    super.key,
  });

  String? governorate;
  Map<String, String?>? addressFromMapps;

  @override
  State<LocationScreenHeader> createState() => _LocationScreenHeaderState();
}

class _LocationScreenHeaderState extends State<LocationScreenHeader> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocationProvider>(context, listen: true);


    return Container(
      color: AppStyles.secondaryColor,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Text(
            "Select Branch",
            style: AppStyles.bold17(context).copyWith(color: Colors.white),
          ),
          Text(
            "For better service, please select the nearest branch",
            style: AppStyles.medium17(context).copyWith(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.only(top: 4, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.white)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () async {
                          widget.addressFromMapps = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectLocation(),
                              ));
                          if (widget.addressFromMapps != null) {
                            provider.haveLocation = true;
                            provider.address = widget.addressFromMapps;


                            log("enterd ${widget.addressFromMapps!["state"]}");
                            await provider.getBranchesByAddress(
                                stateName: widget.addressFromMapps!["state"]!
                                    .split(" ")[0]);
                            provider.haveLocation = true;
                            log("enterd ${provider.branches.length}");
                          }
                          setState(() {
                            log("Set state");

                          });
                        },
                        child: Text(
                          provider.haveLocation
                              ? "${provider.address!["state"]} - ${provider.address!["city"]}"
                              : "Select Location",
                          style: AppStyles.medium16(context)
                              .copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Text(
            "OR",
            style: AppStyles.medium17(context).copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomDropdownMenuButton(
                text: widget.governorate ?? 'Select Governorate',
                onTap: () async {
                  widget.governorate = await Navigator.pushNamed<dynamic>(
                      context, Routes.governorateScreen);
                  if(widget.governorate != null){
                   await provider.getBranchesByAddress(stateName: widget.governorate!);
                  }
                  setState(() {});
                  print("${widget.governorate ?? 'Select Governorate'}");
                },
              ),
              CustomDropdownMenuButton(
                text: 'Select City / Area',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

// if we need to use lat long we use the first function
class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
}
