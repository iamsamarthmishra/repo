import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/controllers/cart_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/cart_screen/shipping_screen.dart';
import 'package:emart_app/widgets_common/loading_indicator.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});



  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: royal,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Shopping Cart".text.color(Colors.white).fontFamily(semibold).make(),
      ),


      body: StreamBuilder(
        stream: FirestoreServices.getCart(currentUser!.uid),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
            child: loadingIndicator(),
            );
          } else if(snapshot.data!.docs.isEmpty) {
            return Center(
              child: "Cart is Empty".text.color(whiteColor).make(),
            );
          } else {
            var data = snapshot.data!.docs;
            controller.calculate(data);
            controller.productSnapshot = data;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.network("${data[index]['img']}",
                            // width: 90,
                            // height: 210,
                            fit: BoxFit.cover),
                            title: "${data[index]['title']} (x ${data[index]['qty']})"
                                .text.fontFamily(semibold).color(Colors.white).size(16).make(),
                            subtitle: "${data[index]['tprice']}".numCurrency.text.color(Colors.white).fontFamily(semibold).make(),


                            trailing: const Icon(
                              Icons.delete,
                              color: redColor,
                            ).onTap(() {
                              FirestoreServices.deleteDocument(data[index].id);
                            }),
                          );
                        }
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Total price".text.fontFamily(semibold).make(),
                      Obx(() => "${controller.totalP.value}".numCurrency.text.fontFamily(bold).color(Colors.white).make()
                      ),
                    ],
                  ).box.padding(EdgeInsets.all(12)).color(golden).width(context.screenWidth -30).roundedSM.make(),

                  10.heightBox,

                  SizedBox( width: context.screenWidth -140,
                      child: obrButton(
                        Color: redColor,
                        onPress: () {
                          Get.to(()=> const ShippingDetails());
                        },
                        textColor: whiteColor,
                        title: "Proceed to Pay",

                      )),

                ],
              ),
            );
          }
        },
      ),
    );
  }
}

















