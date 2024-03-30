import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget exitDialog(BuildContext context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Confirm",
          style: TextStyle(
            fontFamily: bold,
            fontSize: 18,
            color: darkFontGrey,
          ),
        ),
        Divider(),
        SizedBox(height: 10),
        Text(
          "Are you sure you want to exit ?",
          style: TextStyle(
            fontSize: 16,
            color: darkFontGrey,
          ),
        ),
        SizedBox(height: 10),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     ourButton(
        //       Color: redColor,
        //       onPress: () {
        //         SystemNavigator.pop();
        //       },
        //       textColor: whiteColor,
        //       title: "Yes",
        //     ),
        //     ourButton(
        //       Color: redColor,
        //       onPress: () {
        //         Navigator.pop(context);
        //       },
        //       textColor: whiteColor,
        //       title: "No",
        //     ),
        //   ],
        // ).box.color(lightGrey).padding(const EdgeInsets.all(12)).rounded.make(),
      ],
    ),
  );
}
