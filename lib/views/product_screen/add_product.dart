
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../consts/colors.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/normal_text.dart';
import 'components/product_dropdown.dart';
import 'components/product_images.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      appBar: AppBar(
        title: boldText(text: "Add Product", color: fontGrey, size: 16.0),
        actions: [TextButton(onPressed: (){}, child: boldText(text: save, color: black))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              customTextField(hint: "eg. Nike", label: "Product Name"),
              10.heightBox,
              customTextField(hint: "eg. Nike Product", label: "Description", isDesc: true),
              10.heightBox,
              customTextField(hint: "eg. \$100", label: "Price"),
              10.heightBox,
              customTextField(hint: "eg. 20", label: "Quantity"),
              15.heightBox,
              productDropdown(),
              15.heightBox,
              productDropdown(),
              15.heightBox,
              normalText(text: "Choose product images"),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(3, (index) => productImages(label: "${index + 1}"),
                ),
              ),
              10.heightBox,
              normalText(text: "First image will be your display image"),
            ],
          ),
        ),
      ),
    );
  }
}
