import 'package:emart_app/consts/consts.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 26,),
        10.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make()
      ],
  ).box.rounded.white.size(width, height).make(); //shadowSm (if use shadow for boxs)
}