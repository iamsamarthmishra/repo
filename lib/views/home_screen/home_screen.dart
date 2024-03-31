import 'package:flutter/material.dart';
import 'package:emart_seller/const/const.dart';
import '../../const/images.dart';
import '../../widgets/dashboard_button.dart';
import '../../widgets/normal_text.dart';
import 'package:intl/intl.dart' as intl;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  // Function to print the user's name when user logs in
  void printNameOnLogin(String name) {
    print('User logged in with name: $name');
  }

  @override
  Widget build(BuildContext context) {
    // Call printNameOnLogin function when user logs in
    // For example, if you're using FirebaseAuth, you can call it in the login method

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable the back arrow
        title: boldText(text: dashboard, color: fontGrey, size: 22.0),
        actions: [
          Center(
            child: normalText(
              text: intl.DateFormat('EEE, M/d/y').format(DateTime.now()),
              color: fontGrey,
            ),
          ),
          12.widthBox,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(
                  context,
                  title: products,
                  count: "50",
                  icon: icProducts,
                ),
                dashboardButton(
                  context,
                  title: orders,
                  count: "50",
                  icon: icOrders,
                ),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(
                  context,
                  title: rating,
                  count: "50",
                  icon: icStar,
                ),
                dashboardButton(
                  context,
                  title: totalSales,
                  count: "50",
                  icon: icAdd,
                ),
              ],
            ),
            20.heightBox,
            const Divider(),
            10.heightBox,
            boldText(text: popular, color: fontGrey),
            20.heightBox,
            ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                3,
                    (index) => ListTile(
                  onTap: () {},
                  leading: Image.asset(
                    imgProduct,
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                  title: boldText(text: "Product title", color: fontGrey),
                  subtitle: normalText(text: "\$40.0", color: fontGrey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
