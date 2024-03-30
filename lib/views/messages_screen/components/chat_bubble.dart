import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets_common/normal_text.dart';

Widget chatBuddle() {
  return Directionality(
    //textDirection: data['uid'] == currentUserUID ? TextDirection.rtl : TextDirection.ltr,
    textDirection: TextDirection.ltr,
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        //color: data['uid'] == currentUser!.uid ? redColor : darkFontGrey,
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //"${data['msg']}".text.white.size(16).make(),
          normalText(text: "Your Message here..."),
          10.heightBox,
          normalText(text: "10:45 Pm")
          //const SizedBox(height: 10),
          //time.text.color(whiteColor.withOpacity(0.5)).make(),
        ],
      ),
    ),
  );
}