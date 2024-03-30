import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

import '../consts/colors.dart';
import 'normal_text.dart';

Widget customTextField({label, hint, controller, isDesc = false}){
  return TextFormField(
    style: const TextStyle(color: white),
    maxLines: isDesc ? 4 : 1,
    decoration: InputDecoration(
      isDense: true,
      label: normalText(text: label),
      enabledBorder:
      OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: black,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: black,
          )),
      hintText: hint,
      hintStyle: const TextStyle(color: darkGrey),
    ),
  );
}

Widget cstomTextField({String? title, String? hint, controller, isPass}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(cad).fontFamily(semibold).size(16).make(),
      5.heightBox,
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Adjust the radius as per your preference
          color: lightGrey,
        ),
        child: TextFormField(
          obscureText: isPass,
          controller: controller,
          decoration: InputDecoration(
            hintStyle: const TextStyle(
                fontFamily: semibold,
                color: textfieldGrey
            ),
            hintText: hint,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Adjust padding as needed
            border: InputBorder.none,
          ),
        ),
      ),
    ],
  );
}