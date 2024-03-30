import 'dart:io';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/images.dart';
import '../../widgets_common/normal_text.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;

  const EditProfileScreen({Key? key, this.username}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>{
  var controller = Get.find<ProfileController>();

  @override
  void initState() {
    if (widget.username != null) {
      controller.nameController.text = widget.username!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Obx(() => Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: boldText(text: editscreen, size: 16.0,color: white),
          actions: [TextButton(onPressed: () async {
            controller.isloading(true);

            if (controller.profileImgPath.value.isNotEmpty) {
              await controller.uploadProfileImage();
            } else {
              controller.profileImageLink = controller.snapshotData['imageUrl'];
            }

            // Verify old password before proceeding
            if (controller.snapshotData['password'] == controller.oldpassController.text) {
              try {
                // Change authentication password
                await controller.changeAuthPassword(
                  email: controller.snapshotData['email'],
                  password: controller.oldpassController.text,
                  newpassword: controller.newpassController.text,
                );

                // Update profile information
                await controller.updateProfile(
                  imgUrl: controller.profileImageLink,
                  name: controller.nameController.text,
                  password: controller.newpassController.text,
                );

                // Show success message
                VxToast.show(context, msg: "Updated");
              } catch (error) {
                // Handle password change error
                VxToast.show(context, msg: "Failed to update password: $error");
              }
            } else {
              // Incorrect old password entered
              VxToast.show(context, msg: "Please enter correct old password");
              controller.isloading(false);
            }
            },
              child: normalText(text: save, color: fontGrey))],
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                children: [
                  controller.snapshotData['imageUrl'] == '' && controller.profileImgPath.isEmpty ?
                  Image.asset(imgProduct, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
                      :
                  controller.snapshotData['imageUrl'] != '' && controller.profileImgPath.isEmpty?

                  Image.network(
                    controller.snapshotData['imageUrl'],
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                      :
                  Image.file(File(controller.profileImgPath.value),
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),

                  //Image.asset(imgProduct, width: 150).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.heightBox,
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(backgroundColor: black),
                    onPressed: () {
                      controller.changeImage(context);
                    }, child: normalText(text: changeImage, color: white),
                  ),
                  10.heightBox,
                  const Divider(color: black),
                  20.heightBox,
                  customTextField(
                      controller: controller.nameController,
                      hint: nameHint,
                      label: name
                  ),
                  20.heightBox,
                  customTextField(label: password, hint: passHint, controller: controller.oldpassController),
                  20.heightBox,
                  customTextField(label: conpass, hint: passHint, controller: controller.nameController),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
