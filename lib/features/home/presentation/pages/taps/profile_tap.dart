import 'package:farmacy_app/congfig/routes/routes.dart';
import 'package:farmacy_app/features/login_screen/presentation/manager/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';

class MoreTap extends StatelessWidget {
  const MoreTap({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * (0.25),
          width: double.infinity,
          child: Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: Icon(
                Icons.person,
                size: 55,
                color: Colors.black,
              ),
            ),
          ),
          decoration: const BoxDecoration(
              color: AppStyles.secondaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
        ),
        Transform.translate(
          offset: Offset(0, -20),
          child: Card(
            borderOnForeground: true,
            elevation: 1,
            child: Column(
              children: [
                CustomItem(
                  icon: Icons.person,
                  text: provider.userInfo.fullName ?? " null ",
                  onTapIcon: () {},
                  topLeftRadius: 15,
                  topRightRadius: 15,
                ),
                CustomItem(
                  icon: Icons.email_outlined,
                  text: provider.userInfo.email ?? " null ",
                  onTapIcon: () {},
                ),
                CustomItem(
                  icon: Icons.phone,
                  text: provider.userInfo.phoneNumber.toString() ?? " null ",
                  onTapIcon: () {},
                ),
                CustomItem(
                  icon: Icons.settings,
                  text: "Setting",
                  onTapIcon: () {},
                ),
                CustomLogoutItem(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem(
      {super.key,
      required this.icon,
      this.onTapIcon,
      required this.text,
      this.topLeftRadius,
      this.bottomLeftRadius,
      this.topRightRadius,
      this.bottomRightRadius});

  final IconData icon;
  final String text;
  final void Function()? onTapIcon;
  final double? topLeftRadius;
  final double? bottomLeftRadius;
  final double? topRightRadius;
  final double? bottomRightRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .88,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftRadius ?? 0),
            topRight: Radius.circular(topRightRadius ?? 0),
            bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
            bottomRight: Radius.circular(bottomRightRadius ?? 0)),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
                onTap: onTapIcon,
                child: Icon(icon, color: AppStyles.secondaryColor)),
            SizedBox(
              width: 20,
            ),
            Flexible(
              child: Text(
                text,
                style:
                    AppStyles.semiBold20(context).copyWith(color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomLogoutItem extends StatelessWidget {
  const CustomLogoutItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .88,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.splashScreen, (route) => false);
                },
                child: Transform.rotate(
                    angle: 1.5708 * 2,
                    child: Icon(Icons.logout, color: Colors.red))),
            SizedBox(
              width: 20,
            ),
            Text(
              "Logout",
              style: AppStyles.semiBold20(context).copyWith(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
