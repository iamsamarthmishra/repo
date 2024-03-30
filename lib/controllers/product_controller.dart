import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{

  var quantity = 0.obs;
  var totalPrice = 0.obs;

  var subcat = [];


  getSubCategories(title) async{

    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s = decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      subcat.add(e);
    }

  }
  increaseQuantity(totalQuantity){
    if (quantity.value<totalQuantity) {
      quantity.value++;
    }
  }
  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price) {
   totalPrice.value = price * quantity.value;

  }

  addToCart({
    title, img, sellername, qty, tprice, context, vendorID}) async{
    await firestore.collection(cartCollection).doc().set({
      'title':title,
      'img': img,
      'sellername': sellername,
      'qty': qty,
      'vendor_id': vendorID,
      'tprice': tprice,
      'added_by' : currentUser!.uid
    }).catchError((error){
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValue() {
    totalPrice.value = 0;
    quantity.value = 0;

  }

  addtoWishlist(docId) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));
  }

  removeFromWishlist(docId) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));
  }

}


