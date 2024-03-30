import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget detailsCard({
  required double width,
  required String count,
  required String title,
}) {
  return Column(
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),
    ],
  ).box.white.rounded.width(width).height(80).padding(const EdgeInsets.all(4)).make();
}