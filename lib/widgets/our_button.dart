import 'package:flutter/material.dart'; // Changed import to Material library

import '../const/colors.dart';
import 'normal_text.dart';

Widget ourButton({title, color = black, onPress}) { // Added explicit types
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color, // Set the primary color
      padding: const EdgeInsets.all(12.0),
    ),
    onPressed: onPress,
    child: boldText(text: title ?? '', size: 16.0), // Added null check for title
  );
}
