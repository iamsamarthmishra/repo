import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controller/orders_controller.dart';
import 'package:emart_seller/services/store_services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../widgets/loading.dart';
import '../../widgets/normal_text.dart';
import 'order_details.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrdersController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Disable the back arrow
        title: boldText(text: orders, color: fontGrey, size: 22.0),
      ),
      body: StreamBuilder(
        stream: StoreServices.getOrders(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    data.length,
                        (index) {
                          var time = data[index]['order_date'].toDate();
                      return ListTile(
                        onTap: () {
                          Get.to(() => OrderDetails(data: data[index]));
                        },
                        tileColor: textfieldGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: boldText(text: "${data[index]['order_code']}", color: darkGrey),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.calendar_month, color: fontGrey),
                                SizedBox(width: 10),
                                normalText(
                                  text: intl.DateFormat().add_yMd().format(time),
                                  color: darkGrey,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.payment, color: fontGrey),
                                SizedBox(width: 10),
                                boldText(text: unpaid, color: red),
                              ],
                            ),
                          ],
                        ),
                        trailing: boldText(text: "${data[index]['total_amount']}", color: purpleColor, size: 16.0),
                      ).box.margin(const EdgeInsets.only(bottom: 4.0)).make();
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
