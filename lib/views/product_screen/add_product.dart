import 'dart:ffi';

import 'package:emart_seller/controller/product_controller.dart';
import 'package:emart_seller/widgets/loading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../const/const.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/normal_text.dart';
import 'components/product_dropdown.dart';
import 'components/product_images.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductsController>();

    return Scaffold(
      backgroundColor: darkGrey,
      appBar: AppBar(
        title: boldText(text: "Add Product", color: fontGrey, size: 16.0),
        actions: [
          Obx(
                () => controller.isloading.value
                ? loadingIndicator()
                : TextButton(
              onPressed: () async {
                controller.isloading(true);
                await controller.uploadImages();
                await controller.uploadProduct(context);
                Get.back();
              },
              child: boldText(text: save, color: black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              customTextField(hint: "eg. Nike", label: "Product Name", controller: controller.pnameController),
              const SizedBox(height: 10),
              customTextField(hint: "eg. Nike Product", label: "Short Description", sdes: true, controller: controller.psdesController),
              const SizedBox(height: 10),
              customTextField(hint: "eg. Nike Product", label: "Description", isDesc: true, controller: controller.pdescController),
              const SizedBox(height: 10),
              customTextField(hint: "eg. \$100", label: "Price", controller: controller.ppriceController),
              const SizedBox(height: 10),
              customTextField(hint: "eg. 20", label: "Quantity", controller: controller.pquantityController),
              const SizedBox(height: 15),
              productDropdown("Category", controller.categoryList, controller.categoryvalue, controller),
              const SizedBox(height: 15),
              productDropdown("SubCategory", controller.subcategoryList, controller.subcategoryvalue, controller),
              const SizedBox(height: 10),
              normalText(text: "Choose product images"),
              const SizedBox(height: 10),
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    3,
                        (index) => controller.pImagesList[index] != null
                        ? Image.file(controller.pImagesList[index], width: 100).onTap(() {
                      controller.pickImage(index, context);
                    })
                        : productImages(label: "${index + 1}").onTap(() {
                      controller.pickImage(index, context);
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              normalText(text: "First image will be your display image"),
            ],
          ),
        ),
      ),
    );
  }
}
