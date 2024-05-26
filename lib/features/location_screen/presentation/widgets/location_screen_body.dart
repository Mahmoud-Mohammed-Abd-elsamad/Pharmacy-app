import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../congfig/routes/routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';
import '../manager/locatin/provider.dart';

class LocationScreenBody extends StatelessWidget {
  const LocationScreenBody({
    super.key,
    required this.findBranches,
  });

  final bool findBranches;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocationProvider>(context, listen: true);
    var items = provider.branches;
    log("build branches ${items.length}");
    log("bool find pranch $findBranches");
    log("bool find pranch ${provider.placePackerAddress}");
    return findBranches
        ?  InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.homeScreen,);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(itemCount:items.length,itemBuilder: (context, index){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8,),
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color:AppStyles.secondaryColor, //  0xff618a9d
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Center(
                          child: Text(
                            items.isNotEmpty ? "delver to ${items[index].city}" : "delver to (Giza)",
                            style: AppStyles.medium17(context)
                                .copyWith(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Stack(
                      children:[ SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            Assets.pharmacyImage,
                            fit: BoxFit.fill,
                          )),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Text("Pharmacy'",style: AppStyles.regular20(context).copyWith(color: AppStyles.secondaryColor),),
                              SvgPicture.asset(Assets.appBarImage,height: 25,width: 25,)
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.phone,color: AppStyles.secondaryColor,),
                                SizedBox(width: 4,),
                                Text("${items[index].phoneNumber}",style: AppStyles.semiBold20(context).copyWith(color: AppStyles.secondaryColor),),
                               SizedBox(width: 4,)
                              ],
                            ),
                          ),
                        )
                    ])
                  ],
                );
              })
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "Sorry,No available branches for delivery, please select",
                style:
                    AppStyles.regular16(context).copyWith(color: Colors.grey),
              )),
              Center(
                  child: Text(
                "another location",
                style:
                    AppStyles.regular16(context).copyWith(color: Colors.grey),
              ))
            ],
          );
  }
}
