import 'package:emart_seller/const/const.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

   @override
   void onInit() {
      super.onInit();
      Username();

   }

   var navIndex = 0.obs;
   var  username = '';

   Username() async {
      var n = await firestore
          .collection(vendorsCollection)
          .where('id', isEqualTo: currentUser!.uid)
          .get()
          .then((value){
             if(value.docs.isNotEmpty) {
                return value.docs.single['name'];
             }
      });

      username = n;
      print(username);
   }
}