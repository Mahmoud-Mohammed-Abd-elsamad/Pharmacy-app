import 'package:farmacy_app/core/utils/app_styles.dart';
import 'package:farmacy_app/features/home/presentation/pages/cart_tap.dart';
import 'package:farmacy_app/features/home/presentation/pages/home_tap.dart';
import 'package:farmacy_app/features/home/presentation/pages/profile_tap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(

        body: screens[currentIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
        );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(

         selectedItemColor: Color(0xff407CE2),
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          elevation: 0,
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

