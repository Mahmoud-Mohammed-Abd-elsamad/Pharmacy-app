import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../congfig/routes/routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/assets.dart';

class LocationScreenBody extends StatelessWidget {
  const LocationScreenBody({
    super.key,
    required this.findBranches,
  });

  final bool findBranches;

  @override
  Widget build(BuildContext context) {
    return findBranches
        ? InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.homeScreen);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xff618a9d),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Center(
                        child: Text(
                      "delver to (Giza)",
                      style: AppStyles.regular16(context)
                          .copyWith(color: Colors.white),
                    )),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        Assets.pharmacyImage,
                        fit: BoxFit.fill,
                      ))
                ],
              ),
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
