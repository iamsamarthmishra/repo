import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../consts/colors.dart';
import '../../consts/consts.dart';
import '../../widgets_common/normal_text.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: "Product Title", color: fontGrey),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VxSwiper.builder(
              autoPlay: true,
              height: 350,
              itemCount: 3,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              itemBuilder: (context, index) {
                //BorderRadius borderRadius = BorderRadius.zero;
                // Add your image widget here
                return Image.asset
                //network
                  (
                  imgProduct,
                  //data['p_img'][index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(
                    text: "Product Name",
                    color: fontGrey,
                    size: 20.0,
                  ).py8(),

                  10.heightBox,
                  Row(
                    children: [
                      boldText(text: "Category", color: fontGrey, size: 16.0),
                      10.widthBox,
                      boldText(text: "Sub Category", color: fontGrey, size: 16.0),
                    ],
                  ),

                  10.heightBox,
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                      ),
                    ],
                  ).py8(),
                  boldText(
                    text: "\$50", // Change to your product price
                    color: fontGrey,
                    size: 18.0,
                  ).py8(),
                  Row(
                    children: [
                      boldText(
                        text: "Quantity: ",
                        color: fontGrey,
                      ),
                      // Add your quantity widget here
                      Text("3", style: TextStyle(color: fontGrey)),
                    ],
                  ).py8(),
                  boldText(
                    text: "Description",
                    color: fontGrey,
                    size: 16.0,
                  ).py8(),
                  normalText(
                    text:
                    "Product Description", // Change to your product description
                    color: fontGrey,
                  ).py8(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
