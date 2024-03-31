import 'package:emart_seller/widgets/loading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../const/const.dart';
import '../../controller/profile_controller.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/normal_text.dart';

class ShopSettingsScreen extends StatelessWidget {
  const ShopSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
        backgroundColor: fontGrey,
        appBar: AppBar(
          title: boldText(text: shops, size: 16.0,color: darkGrey),
          actions: [
            controller.isloading.value ?
                loadingIndicator() :
            TextButton(onPressed: () async {
              controller.isloading(true);
             await controller.updateShop(
              shopname: controller.shopnameController.text,
              shopaddress: controller.shopAddressController.text,
              shopmobile: controller.shopmobileController.text,
              shopdesc: controller.shopdescController.text,
            );
             VxToast.show(context, msg: "Kaam ho gaya");
          }, child: normalText(text: save, color: white))],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              10.heightBox,
              customTextField(
                label: shops, hint: nameHint,
                controller: controller.shopnameController
              ),
              5.heightBox,
              customTextField(
                label: address, hint: shopAddressHint,
                controller: controller.shopAddressController
              ),
              5.heightBox,
              customTextField(
                label: mobile, hint: shopMobileHint,
                controller: controller.shopmobileController
              ),
              5.heightBox,
              customTextField(
                isDesc: true,
                label: description, hint: shopDescHint,
                controller: controller.shopdescController
              ),
            ],
          ),
        ),
      );
  }
}
