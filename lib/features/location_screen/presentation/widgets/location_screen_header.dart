import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Text(
            "Select Branch",
            style: AppStyles.medium17(context).copyWith(color: Colors.white),
          ),
          Text(
            "For better service, please select the nearest branch",
            style: AppStyles.regular14(context).copyWith(color: Colors.white),
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
                      Text(
                        "Select Location",
                        style: AppStyles.regular12(context)
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Text(
            "OR",
            style: AppStyles.regular12(context).copyWith(color: Colors.white),
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

