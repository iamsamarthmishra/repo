import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/const/images.dart';
import 'package:emart_seller/controller/auth_controller.dart';
import 'package:emart_seller/widgets/normal_text.dart';
import 'package:emart_seller/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../widgets/loading.dart';
import '../home_screen/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: fontGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox,
              normalText(text: welcome, size: 18.0),
              20.heightBox,
              Row(
                children: [
                  Image.asset(iclogo, width: 70,
                    height: 70,
                  ).box.border(color: white).rounded.padding(const EdgeInsets.all(8)).make(),
                  10.widthBox,
                  boldText(text: appname, size: 20.0)
                ],
              ),
              20.heightBox,
              Obx(() => Column(

                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email, color: fontGrey),
                        border: InputBorder.none,
                        hintText: emailHint,
                      ),
                    ),
                    20.heightBox,
                    TextFormField(
                      controller: controller.passwordController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_clock_outlined, color: fontGrey),
                        border: InputBorder.none,
                        hintText: passHint,
                      ),
                    ),
                    30.heightBox,
                    SizedBox(
                      width: context.screenWidth -100,
                      child: controller.isloading.value ? loadingIndicator() : ourButton(
                        title: login,
                        onPress: () async {
                        //Get.to(() => Home());

                          controller.isloading(true);

                          await controller.loginMethod(context: context).then((value) {
                            if(value != null) {
                              VxToast.show(context, msg: loggedin);
                              controller.isloading(false);
                              Get.offAll(()=> const Home());
                            } else {
                              controller.isloading(false);
                            }
                          });

                        },
                      ),
                    ),
                    10.heightBox,
                  ],

                ).box.white.rounded.outerShadowMd.padding(const EdgeInsets.all(8.0)).make(),
              ),
              10.heightBox,
              Center(child: normalText(text: anyProblem)),
              5.heightBox,
              Center(child: boldText(text: contact)),
            ],
          ),
        
        ),
      ),
    );
  }
}
