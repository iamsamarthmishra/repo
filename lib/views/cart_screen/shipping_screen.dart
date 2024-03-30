import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/cart_controller.dart';
import 'package:emart_app/views/cart_screen/payment_method.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: royal,
      appBar: AppBar(
        title: "shipping info".text.fontFamily(semibold).color(Colors.white).make(),
      ),
      bottomNavigationBar: SizedBox(
      height: 60,
      child: obrButton(
        onPress: () {
          if (controller.addressController.text.length > 1 ) {
            Get.to(()=> const PaymentMethods());
          }else {
            VxToast.show(context, msg: "Please fill the details");
          }
        },
        Color: whiteColor,
        textColor: black,
          title: "Continue",
      ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            cstomTextField(hint: "Address", isPass: false, title: "Address", controller: controller.addressController),
            cstomTextField(hint: "City", isPass: false, title: "City", controller: controller.cityController),
            cstomTextField(hint: "State", isPass: false, title: "State", controller: controller.stateController),
            cstomTextField(hint: "Postel Code", isPass: false, title: "Postal Code", controller: controller.postalController),
            cstomTextField(hint: "Phone", isPass: false, title: "Phone", controller: controller.phoneController),
          ],
        ),
      ),
    );
  }
}







