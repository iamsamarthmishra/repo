import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool? isCheck =false;
  var controller = Get.put(AuthController());

  //Text Controllers

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
    // decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(imgBackground), fit: BoxFit.fill)),
      color: royal,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Join the $appname".text.fontFamily(bold).white.size(20).make(),
              15.heightBox,
              Column(
                children: [
                  cstomTextField(hint: nameHint, title: name, controller: nameController, isPass: false),
                  cstomTextField(hint: emailHint, title: email, controller: emailController, isPass: false),
                  cstomTextField(hint: passwordHint, title: password, controller: passwordController, isPass: true),
                  cstomTextField(hint: retypePassword, title: retypePassword, controller: passwordRetypeController, isPass: true),
                  Align(
                    alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){}, child: forgetPass.text.make())),
                  5.heightBox,

                  //ourButton().box.width(context.screenWidth - 50).make(),
                  // Button Not use (if you want to use do some changes in button.dart file)
                  // NOT FOR USE
                  // EXTRA CODE FOR BUTTON & TEXT

                  // 5.heightBox,
                  // createNewAccount.text.color(fontGrey).make(),

                  // 5.heightBox,
                  // ourButton(Color: golden, title: signup, textColor: redColor, onPress: () {})
                  // .box
                  // .width(context.screenWidth - 50)
                  // .make(),


                  // 10.heightBox,
                  // loginWith.text.color(fontGrey).make(),

                  // 5.heightBox,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: List.generate(3,
                  //   (index) => Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //   child: CircleAvatar(
                  //     backgroundColor: lightGrey,
                  //     radius: 25,
                  //     child: Image.asset(socialIconList[index],
                  //     width: 30,
                  //     ),
                  //   ),
                  //   ))
                  //  ),

                  Row(
                    children: [
                      Checkbox(checkColor: redColor,
                      value: isCheck,
                      onChanged: (newValue) {
                        setState(() {
                          isCheck = newValue;
                        });
                      }
                      ),
                      10.widthBox,
                      Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children:[
                           TextSpan(
                          text: "I agree to the ",
                          style: TextStyle(
                           fontFamily: regular,
                           color: cad,

                      )),
                      TextSpan(
                          text: termsAndCond,
                          style: TextStyle(
                           fontFamily: regular,
                           color: cad,
                          )),
                          TextSpan(
                          text: " & ",
                          style: TextStyle(
                           fontFamily: regular,
                           color: cad,
                          )),
                          TextSpan(
                          text: privacyPolicy,
                          style: TextStyle(
                           fontFamily: regular,
                           color: cad,
                          )),
                      ],
                    )),
                      ),
                    ],
                  ),

                  5.heightBox,
                  obrButton(Color: isCheck ==true? royal : lightGrey, title: signup, textColor: buton, onPress: () async {
                    if(isCheck !=false){
                      try {
                        await controller.signupMethod(context: context, email: emailController.text, password: passwordController.text).then((value){
                          return controller.storeUserData(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                          );
                        }).then((value){
                          VxToast.show(context, msg: loggedin);
                          Get.offAll(()=>const Home());
                        });
                      } catch (e) {
                        auth.signOut();
                        VxToast.show(context, msg: e.toString());
                      }
                    }
                  },
                  )
                  .box
                  .width(context.screenWidth - 30)
                  .make(),

                  10.heightBox,
                  //wrapped into gesture detector of velocity x
                  RichText(
                    text: const TextSpan(
                      children: [
                      TextSpan(
                       text: alreadyHaveAccount,
                       style: TextStyle(fontFamily: bold, color: Colors.white),
                      ),
                      TextSpan(
                       text: login,
                       style: TextStyle(fontFamily: bold, color: cad),
                      ),
                      ],
                    ),
                    ).onTap(() {
                    Get.offAll(() => const LoginScreen());
                     }),
                ],
              ).box.color(buton).rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),
            ],
          ),
        ),
      ),
  );
  }
}