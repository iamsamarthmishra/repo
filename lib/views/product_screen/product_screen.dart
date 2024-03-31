import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/const.dart';
import '../../const/images.dart';
import '../../services/store_services.dart';
import '../../widgets/loading.dart';
import '../../widgets/normal_text.dart';
import 'add_product.dart';
import 'product_details.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ProductsController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          controller.getCategory();
          controller.populateCategoryList();
          Get.to(() => const AddProduct());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable the back arrow
        title: boldText(text: products, color: fontGrey, size: 22.0),
      ),
      body: StreamBuilder(
        stream: StoreServices.getProducts(currentUser!.uid),
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
                        (index) => Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(() => ProductDetails(data: data[index]));
                        },
                        leading: Image.network(
                          data[index]['p_img'][0],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: boldText(text: "${data[index]['p_name']}", color: fontGrey),
                        subtitle: normalText(text: "${data[index]['p_price']}", color: fontGrey),
                        trailing: VxPopupMenu(
                          arrowSize: 0.0,
                          child: Icon(Icons.more_vert_rounded),
                          menuBuilder: () => Column(
                            children: List.generate(
                              popupMenuTitles.length,
                                  (index) => Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Icon(popupmenuIcons[index]),
                                    10.widthBox,
                                    normalText(text: popupMenuTitles[index], color: darkGrey),
                                  ],
                                ).onTap(() {}),
                              ),
                            ),
                          ).box.white.rounded.width(200).make(),
                          clickType: VxClickType.singleClick,
                        ),
                      ),
                    ),
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
