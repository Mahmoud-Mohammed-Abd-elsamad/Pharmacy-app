import 'dart:developer';

import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/core/utils/assets.dart';
import 'package:farmacy_app/features/home/presentation/manager/home_provider/provider.dart';
import 'package:farmacy_app/features/home/presentation/pages/taps/cart_tap.dart';
import 'package:farmacy_app/features/home/presentation/pages/taps/home_tap.dart';
import 'package:farmacy_app/features/home/presentation/pages/taps/profile_tap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../congfig/routes/routes.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List screens = [
    HomeTap(),
    const CartTap(),
    const MoreTap(),
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: false);
    if (currentIndex == 0) {
      provider.getAllCategories();
      log(" home cartItems ${provider.cartItems.length}");
      if (Provider
          .of<HomeProvider>(context, listen: false)
          .cartItems
          .isEmpty) {
        log(" home allAddedItemsToCartWithCartIdList ${provider
            .allAddedItemsToCartWithMedicineIdList.length}");
        provider.allAddedItemsToCartWithMedicineIdList.clear();
        provider.allAddedItemsToCartWithCartIdList.clear();
        log(" home allAddedItemsToCartWithCartIdList2 ${provider
            .allAddedItemsToCartWithCartIdList.length}");
      }
    }
    return Scaffold(
      appBar: currentIndex == 2 ? AppBar(
        backgroundColor: AppStyles.secondaryColor,
        title: Text("Profile",
          style: AppStyles.bold25(context).copyWith(color: Colors.white),),
        actions: [
          IconButton(onPressed: () {},
              icon: Icon(FontAwesomeIcons.edit, color: Colors.white, size: 21,))
        ],
      ) : CustomAppBar(
        onPressed: () {},
      ),
      body:  screens[currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),

        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

        floatingActionButton: _buildFloatingActionButton(),
    );
  }
  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.chatBot);
      },
      shape: const StadiumBorder(),
      backgroundColor: AppStyles.secondaryColor,
      child: SvgPicture.asset(Assets.iconChatBoatChat),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: AppStyles.secondaryColor,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      elevation: 0,
      selectedIconTheme: IconThemeData(color: AppStyles.secondaryColor),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart_sharp,
          ),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
