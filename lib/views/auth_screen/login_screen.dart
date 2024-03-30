import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/auth_screen/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/colors.dart';
import '../../consts/lists.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';
import '../home_screen/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller =  Get.put(AuthController());
    return bgWidget(
      // decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(imgBackground), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: royal,
        resizeToAvoidBottomInset: false,
        body:
        Center(
          child: Column(
            children: [
              100.heightBox,
              (context.screenHeight * 0.001).heightBox,
              applogoWidget(),
              10.heightBox,
              "Login to $appname".text.fontFamily(bold).white.size(18).make(),
              20.heightBox,
              Obx(()=> Column(
                children: [
                  cstomTextField(hint: emailHint, title: email, isPass: false,  controller: controller.emailController),
                  cstomTextField(hint: passwordHint, title: password, isPass: true, controller: controller.passwordController),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){}, child: forgetPass.text.color(cad).make())),
                  5.heightBox,
                  controller.isloading.value ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(royal),
                  ):

                  //ourButton().box.width(context.screenWidth - 50).make(),

                  obrButton(Color: cad, title: login, textColor: whiteColor,
                    onPress: () async {
                      controller.isloading(true);
                      await controller.loginMethod(context: context).then((value) {
                        if(value != null)
                        {
                          VxToast.show(context, msg: loggedin);
                          Get.offAll(() => const Home());
                        }else {
                          controller.isloading(false);
                        }
                      });
                    },
                    // Get.to(() => const Home());

                  ).box
                      .width(context.screenWidth - 50)
                      .make(),

                  5.heightBox,
                  createNewAccount.text.color(Colors.white).make(),

                  5.heightBox,
                  obrButton(Color: golden, title: signup, textColor: redColor, onPress: () {
                    Get.to(()=>const SignupScreen());
                  })
                      .box
                      .width(context.screenWidth - 50)
                      .make(),

                  10.heightBox,
                  loginWith.text.color(Colors.white).make(),

                  5.heightBox,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3,
                              (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(socialIconList[index],
                                width: 30,
                              ),
                            ),
                          ))
                  ),
                ],
              ).box.color(buton).rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),
              ),
            ],
          ),
        ),
      ),
      color: Colors.red,
    );
  }
}

