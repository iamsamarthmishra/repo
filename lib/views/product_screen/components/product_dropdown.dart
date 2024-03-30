

import 'package:emart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../consts/colors.dart';
import '../../../widgets_common/normal_text.dart';

Widget productDropdown() {
  return DropdownButtonHideUnderline(
      child:  DropdownButton<String>(
        hint: normalText(text: "Choose Category", color: fontGrey),
        value: null,
        isExpanded: true,
        items: const [],
        onChanged: (value) {},
      ),
  ).box.white.padding(const EdgeInsets.symmetric(horizontal: 5)).roundedSM.make();
}