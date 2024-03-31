import 'package:emart_seller/const/const.dart';
import 'package:flutter/cupertino.dart';
import '../../const/colors.dart';

import 'normal_text.dart';


Widget dashboardButton( context, {title, count, icon}) {
  var size = MediaQuery.of(context).size;
  return Row(
    children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            normalText(text: title, size: 16.0, color: white), // Apply fontGrey color here
            normalText(text: count, size: 20.0, color: white), // Apply fontGrey color here
          ],
        ),
      ),
      Image.asset(icon, width: 40.0, color: Colors.white),
    ],
  ).box.color(fontGrey).rounded.size(size.width * 0.4, 80.0).padding(
    const EdgeInsets.all(8),
  ).make();
}
