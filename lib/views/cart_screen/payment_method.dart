// import 'package:emart_app/consts/consts.dart';
// import 'package:emart_app/consts/lists.dart';
// import 'package:emart_app/controllers/cart_controller.dart';
// import 'package:emart_app/widgets_common/loading_indicator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
//
// import '../../widgets_common/our_button.dart';
// import '../home_screen/home.dart';
//
// class PaymentMethods extends StatelessWidget {
//   const PaymentMethods({Key? key}) : super(key:key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     var controller = Get.find<CartController>();
//
//     return Obx(()=>
//        Scaffold(
//         backgroundColor: royal,
//
//           bottomNavigationBar: SizedBox(
//             height: 60,
//             child: controller.placingOrder.value ? Center(
//               child: loadingIndicator(),
//             ): ourButton(
//               onPress: () async {
//                 await controller.placedMyOrder(
//                     orderPaymentMethod: paymentMethods[controller.paymentIndex.value],
//                     totalAmount: controller.totalP.value);
//
//                 await controller.clearCart();
//                 VxToast.show(context, msg: "Order Placed successfully");
//
//                 Get.offAll(const Home ());
//               },
//               Color: whiteColor,
//               textColor: black,
//               title: "Place My Order",
//             ),
//           ),
//
//
//         appBar: AppBar(
//           title: "Choose Payment Method".text.fontFamily(semibold).color(Colors.white).make(),
//         ),
//
//
//         body: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Obx(()=>
//             Column(
//               children: List.generate(paymentMethodsImg.length, (index){
//                 return GestureDetector(
//                   onTap: (){
//                     controller.changePaymentIndex(index);
//                   },
//                   child: Container(
//                     clipBehavior: Clip.antiAlias,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                         color: controller.paymentIndex.value == index ? cad : Colors.transparent,
//                           width: 4,
//                       )),
//
//                     margin: const EdgeInsets.only(bottom: 8),
//
//                     child: Stack(
//                       alignment: Alignment.topRight,
//                       children: [
//                     Image.asset(paymentMethodsImg[index], width: double.infinity, height: 120, fit: BoxFit.cover),
//
//                         controller.paymentIndex.value == index ? Transform.scale(
//                           scale: 1.3,
//                           child: Checkbox(
//                             activeColor: (Colors.green),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
//                             ),
//                             value: true, onChanged: (value) {},
//                           ),
//                         )
//                             :Container(),
//
//                         //"${paymentMethods[index]}".text.make(), //if add color cont with 40:00 pt8
//                       ],
//                   ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/cart_controller.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/widgets_common/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../widgets_common/our_button.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<CartController>();

    return Obx(
          ()=> Scaffold(
        backgroundColor: royal,

        bottomNavigationBar: SizedBox(
          height: 60,
          child: controller.placingOrder.value ? Center(
            child: loadingIndicator(),
          ): obrButton(
            onPress: () async {
              await controller.placedMyOrder(
                  orderPaymentMethod: paymentMethods[controller.paymentIndex.value],
                  totalAmount: controller.totalP.value);

              await controller.clearCart();

              VxToast.show(context, msg: "Order Placed Successfully");

              Get.offAll(const Home());
            },
            Color: whiteColor,
            textColor: black,
            title: "Place My Order",
          ),
        ),


        appBar: AppBar(
          title: "Choose Payment Method".text.fontFamily(semibold).color(Colors.white).make(),
        ),


        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Obx(()=>
              Column(
                children: List.generate(paymentMethodsImg.length, (index){
                  return GestureDetector(
                    onTap: (){
                      controller.changePaymentIndex(index);
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: controller.paymentIndex.value == index ? cad : Colors.transparent,
                            width: 4,
                          )),

                      margin: EdgeInsets.only(bottom: 8),

                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.asset(paymentMethodsImg[index], width: double.infinity, height: 120, fit: BoxFit.cover),

                          controller.paymentIndex.value == index ? Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              activeColor: (Colors.green),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),
                              ),
                              value: true, onChanged: (value) {},
                            ),
                          )
                              :Container(),

                          //"${paymentMethods[index]}".text.make(), //if add color cont with 40:00 pt8
                        ],
                      ),
                    ),
                  );
                }),
              ),
          ),
        ),
      ),
    );
  }
}








