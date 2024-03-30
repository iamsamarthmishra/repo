import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/home_controller.dart';
import 'package:emart_app/views/home_screen/home_screen.dart';
import 'package:emart_app/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../order_screen/order_screen.dart';
import '../product_screen/product_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());

    var navScreens = [const
    HomeScreen(),
      const ProductScreen(),
      const OrderScreen(),
      const ProfileScreen(),
    ];


    var bottomNavbar = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home, size: 25, color: fontGrey), // Customize icon size and color
        label: 'Home', // Set an empty label to avoid text
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icProducts,
          width: 25, // Set the width of the image
          height: 25, // Set the height of the image
          color: fontGrey, // Set the color of the image
        ),
        label: 'Products',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.list, size: 27, color: fontGrey), // Customize icon size and color
        label: 'orders', // Set an empty label to avoid text
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icGeneralSettings,
          width: 20,
          height: 20,
          color: fontGrey,
        ),
        label: 'Settings',
      ),
    ];


    return Scaffold(
      bottomNavigationBar: Obx(() =>
          BottomNavigationBar(
            onTap: (index) {
              controller.navIndex.value = index;
            },
            currentIndex: controller.navIndex.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: fontGrey,
            items: bottomNavbar,
          ),
      ),
      body: Obx(() =>
          Column(
            children: [
              Expanded(child: navScreens.elementAt(controller.navIndex.value)),
            ],
          ),
      ),
    );
  }
}
