import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/controller/home_controller.dart';
import 'package:path/path.dart';
import 'package:emart_seller/const/const.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/category_model.dart';

class ProductsController extends GetxController{
  var isloading = false.obs;

  //text field controller

  var pnameController = TextEditingController();
  var psdesController = TextEditingController();
  var pdescController = TextEditingController();
  var ppriceController = TextEditingController();
  var pquantityController = TextEditingController();

  var categoryList = <String>[].obs;
  var subcategoryList = <String>[].obs;
  List<Category> category = [];
  var pImagesLink = [];
  var pImagesList = RxList<dynamic>.generate(3, (index) => null);

  var categoryvalue = ''.obs;
  var subcategoryvalue = ''.obs;

  getCategory() async {
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var cat = categoryModelFromJson(data);
    category = cat.categories;
  }

  populateCategoryList() {
    categoryList.clear();

    for (var item in category) {
      categoryList.add(item.name);
    }
  }

  populateSubcategoryList(cat) {
    subcategoryList.clear();

    var data = category.where((element) => element.name == cat).toList();

    for (var i = 0; i < data.first.subcategory.length; i++) {
      subcategoryList.add(data.first.subcategory[i]);
    }
  }

  pickImage(int index, BuildContext context) async {
    try {
      final img = await ImagePicker().pickImage(
          source: ImageSource.gallery, imageQuality: 80);
      if (img == null) {
        return;
      } else {
        pImagesList[index] = File(img.path);
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadImages() async {
    pImagesLink.clear();
    for (var item in pImagesList) {
      if(item!=null) {
        var filename = basename(item.path);
        var destination = 'images/vendors/${currentUser!.uid}/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n = await ref.getDownloadURL();
        pImagesLink.add(n); // Change pImagesList to pImagesLink
      }
    }
  }

  uploadProduct(context) async {
    var store = firestore.collection(productsCollection).doc();
    await store.set({
      'is_featured' : false,
      'p_category': categoryvalue.value,
      'p_des': pdescController.text,
      'p_name' : pnameController.text,
      'p_img': FieldValue.arrayUnion(pImagesLink),
      'p_price': ppriceController.text,
      'p_quantity': pquantityController.text,
      'p_sdes': psdesController.text,
      'p_seller': Get.find<HomeController>().username,
      'p_subcategory': subcategoryvalue.value,
      'vendor_id': currentUser!.uid,
      'featured_id': '',
      'p_rating': "5.0"

    });
    isloading(false);

    VxToast.show(context, msg: "Product uploadded");
  }

}