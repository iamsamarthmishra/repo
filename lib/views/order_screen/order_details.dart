import 'package:emart_app/consts/consts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../consts/colors.dart';
import '../../widgets_common/normal_text.dart';
import '../../widgets_common/our_button.dart';
import 'components/order_placed.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: "Order Details", color: fontGrey, size: 16.0),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: ourButton(
            color: green,
            onPress: () {},
            title: "Confirm Order"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  Visibility(
                    child: Column(
                      children: [
                        boldText(text: "Order Status", color: fontGrey),
                      ],
                    ),
                  ), // Added closing bracket for Visibility widget
                  const Divider(),
                  //order delivery
                  SwitchListTile(
                    activeColor: green,
                    value: false,
                    onChanged: (value) {},
                    title: boldText(text: "Placed", color: fontGrey),
                  ),
                  SwitchListTile(
                    activeColor: green,
                    value: false,
                    onChanged: (value) {},
                    title: boldText(text: "Confirmed", color: fontGrey),
                  ),
                  SwitchListTile(
                    activeColor: green,
                    value: false,
                    onChanged: (value) {},
                    title: boldText(text: "On Delivery", color: fontGrey),
                  ),
                  SwitchListTile(
                    activeColor: green,
                    value: false,
                    onChanged: (value) {},
                    title: boldText(text: "Delivered", color: fontGrey),
                  ),
                  const Divider(),
                  //order
                  Column(
                    children: [
                      orderPlaceDetails(
                          d1: "data['order_code']",
                          d2: "data['shipping_method']",
                          title1: "order Code",
                          title2: "Shipping Method"
                      ),
                      orderPlaceDetails(
                        d1: "DateTime.now()",
                        //d1: intl.DateFormat().add_yMd().format((data['order_date'].toDate())),
                        d2: "data['payment_method']",
                        title1: "Order date",
                        title2: "Payment Method",
                      ),
                      orderPlaceDetails(
                        d1: "Unpaid",
                        d2: "Order Placed",
                        title1: "Payment Status",
                        title2: "Delivery Status",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //"Shipping Address".text.fontFamily(semibold).color(cad).make(),
                                boldText(text: "Shipping Address", color: fontGrey),
                                "{data['order_by_name']}".text.make(),
                                "{data['order_by_email']}".text.make(),
                                "{data['order_by_address']}".text.make(),
                                "{data['order_by_city']}".text.make(),
                                "{data['order_by_state']}".text.make(),
                                "{data['order_by_phone']}".text.make(),
                                "{data['order_by_postalcode']}".text.make(),
                              ],
                            ),
                            SizedBox(
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  boldText(text: "Total Amount", color: white),
                                  boldText(text: "\$300.0", color: darkGrey),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).box.outerShadowMd.white.make(),
                  const Divider(),
                  10.heightBox,
                  boldText(text: "order Product", color: darkGrey),
                  // "Order Product".text.size(15) .fontFamily(semibold).makeCentered(),
                  10.heightBox,
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      //data['orders'].length
                      3, (index) {
                      return Column(
                        children: [
                          orderPlaceDetails(
                              title1: "data['orders'][index]['title']",
                              title2: "data['orders'][index]['tprice']",
                              d1: "{data['orders'][index]['qty']}",
                              d2: "refundable"
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              width: 30,
                              height: 20,
                              color: darkGrey,
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    },
                    ).toList(),
                  ).box.outerShadowMd.white.margin(const EdgeInsets.only(bottom: 4)).make(),
                  20.heightBox,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
