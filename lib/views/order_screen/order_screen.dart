import 'package:emart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart' as intl;
import '../../consts/colors.dart';
import '../../consts/strings.dart';
import '../../widgets_common/normal_text.dart';
import 'order_details.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false, // Disable the back arrow
          title: boldText(text: orders, color: fontGrey, size: 22.0)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
                  (index) => ListTile(
                onTap: () {
                  Get.to(() => OrderDetails());
                },
                tileColor: textfieldGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                title: boldText(text: "16464131646", color: darkGrey),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, color: fontGrey,),
                        10.widthBox,
                        normalText(text: intl.DateFormat().add_yMd().format(DateTime.now()), color: darkGrey),

                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.payment, color: fontGrey,),
                        10.widthBox,
                        boldText(text: unpaid, color: red),

                      ],
                    )
                  ],
                ),
                trailing: boldText(text: "\$40",color: purpleColor, size: 16.0),
              ).box.margin(const EdgeInsets.only(bottom: 4.0)).make(),
            ),
          ),
        ),
      ),
    );

  }
}
