import 'package:flutter/material.dart';
import '../../../const/colors.dart';
import '../../../widgets/normal_text.dart';

Widget orderPlaceDetails({required String title1, required String title2, required String d1, required String d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text: "$title1", color: fontGrey),
            boldText(text: "$d1", color: fontGrey),
            // "$title1".text.fontFamily(semibold).color(Colors.white).make(),
            // "$d1".text.color(cad).fontFamily(semibold).make()
          ],
        ),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text: "$title2", color: fontGrey),
              boldText(text: "$d2", color: fontGrey),
              // "$title2".text.fontFamily(semibold).color(Colors.white).make(),
              // "$d2".text.color(Colors.white).make(),
            ],
          ),
        ),
      ],
    ),
  );
}
