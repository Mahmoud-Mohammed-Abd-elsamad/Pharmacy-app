import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../../../../congfig/routes/routes.dart';
import '../../../../../../../core/utils/app_styles.dart';
import 'custom_dropdown_menu_button.dart';

class LocationScreenHeader extends StatefulWidget {
   LocationScreenHeader({
    super.key,
  });
  String? governorate;

  @override
  State<LocationScreenHeader> createState() => _LocationScreenHeaderState();


}

class _LocationScreenHeaderState extends State<LocationScreenHeader> {
  @override
  Widget build(BuildContext context) {


    return Container(
      color: AppStyles.primaryColor,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(height: 60,),
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
                        onTap: (){
                          // Geolocator.requestPermission();
                          // Geolocator.getCurrentPosition();
                          MapUtils.openMap(30, 31);
                        },
                        child: Text(
                          "Select Location",
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
               CustomDropdownMenuButton(text: widget.governorate ??'Select Governorate', onTap: () async {
                 widget.governorate = await Navigator.pushNamed<dynamic>(context, Routes.governorateScreen);
                 setState(() {

                 });
                 print("${widget.governorate ??'Select Governorate'}");
               },),
              CustomDropdownMenuButton(text: 'Select City / Area', onTap: () {  },),


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