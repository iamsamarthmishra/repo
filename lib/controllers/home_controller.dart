import 'package:emart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getUsername();
    super.onInit();
  }


  var navIndex = 0.obs;

  var featuredList = [];

  var username = '';
  var searchController = TextEditingController();

  getUsername() async {
    var n = await firestore
        .collection(vendorCollection)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['name'];
      }
    });

    username = n;
  }
}
