import 'package:emart_seller/controller/product_controller.dart';
import 'package:get/get.dart';

import '../../../const/const.dart';
import '../../../widgets/normal_text.dart';

Widget productDropdown(hint, List<String> list, dropvalue, ProductsController controller) {
  return Obx(
        () => DropdownButtonHideUnderline(
      child: DropdownButton(
        hint: normalText(text: "$hint", color: fontGrey),
        value: dropvalue == '' ? null : dropvalue.value,
        isExpanded: true,
        items: list.map((e) {
          return DropdownMenuItem(
            value: e,
            child: e.toString().text.make(),
          );
        }).toList(),
        onChanged: (newValue) {
          if (hint == "Category") {
            controller.subcategoryvalue.value = '';
            controller.populateSubcategoryList(newValue.toString());
          }
          dropvalue.value = newValue.toString();
        },
      ),
    ).box.white.padding(const EdgeInsets.symmetric(horizontal: 5)).roundedSM.make(),
  );
}
