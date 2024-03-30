import 'package:emart_app/views/messages_screen/messages_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets_common/normal_text.dart';
import '../shop_screen/shop_settings_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    FirestoreServices.getCounts();
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: boldText(text: settings, size: 22.0, color: black),
        actions: [
          IconButton(onPressed: (){
            Get.to(() =>  EditProfileScreen(
              username: controller.snapshotData['name'],
            ));
          }, icon: const Icon(Icons.edit)),
          TextButton(onPressed: () async {
            await Get.find<AuthController>().signoutMethod(context);
            Get.offAll(()=> logout);

          }, child: normalText(text: logout, color: black) ),
        ],
      ),
      body: Container(
        color: Colors.white, // Set the background color here
        child: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              controller.snapshotData = snapshot.data!.docs[0];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20), // Adjust the spacing as needed
                  ListTile(
                    leading: Image.asset(imgProduct).box.roundedFull.clip(Clip.antiAlias).make(),
                    title: boldText(text: "${controller.snapshotData['name']}", color: black),
                    subtitle: boldText(text: "${controller.snapshotData['email']}", color: black),
                  ),
                  const Divider(),
                  SizedBox(height: 20), // Adjust the spacing as needed
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                        profileButtonIcons.length,
                            (index) => ListTile(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Get.to(() => const ShopSettingsScreen());
                                break;
                              case 1:
                                Get.to(() => const MessagesScreen());
                                break;
                              default:
                            }
                          },
                          leading: Icon(profileButtonIcons[index]),
                          title: normalText(text: profileButtonTitles[index], color: darkGrey),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
