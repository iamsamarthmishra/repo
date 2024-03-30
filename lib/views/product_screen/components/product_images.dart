import 'package:emart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';

import '../../../consts/colors.dart';

Widget productImages({required label, onPress, }) {
  return "$label".text.bold.color(fontGrey).size(16.0).makeCentered().box.color(white).size(100, 100).roundedSM.make();
}