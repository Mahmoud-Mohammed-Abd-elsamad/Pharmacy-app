import 'package:farmacy_app/features/home/presentation/pages/cart_screen.dart';
import 'package:farmacy_app/features/home/presentation/pages/home_screen.dart';
import 'package:farmacy_app/features/home/presentation/pages/more_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  int curentIndex = 0;
  List screens = [
    const HomeScreen(),
    const CartScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[curentIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
        );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(

         selectedItemColor: Color(0xff407CE2),
          currentIndex: curentIndex,
          onTap: (index) => setState(() => curentIndex = index),
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
