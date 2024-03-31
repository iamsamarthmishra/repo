import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/const/images.dart';
import 'package:emart_seller/controller/auth_controller.dart';
import 'package:emart_seller/services/store_services.dart';
import 'package:emart_seller/views/profile_screen/edit_profile.dart';
import 'package:emart_seller/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/loading.dart';
import '../messages_screen/messages_screen.dart';
import '../shop_screen/shop_settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: boldText(text: settings, size: 22.0, color: black),
        actions: [
          IconButton(onPressed: (){
            Get.to(() => EditProfileScreen());
          }, icon: const Icon(Icons.edit)),
          TextButton(onPressed: () async {
            await Get.find<AuthController>().signoutMethod(context);
            Get.offAll(()=> logout);

          }, child: normalText(text: logout, color: black) ),
        ],
      ),

      body: FutureBuilder(
        future: StoreServices.getProfile(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs[0];
            return Column(
              children: [
                ListTile(
                  leading: Image.asset(imgProduct).box.roundedFull.clip(Clip.antiAlias).make(),
                  title: boldText(text: "${data['name']}", color: black),
                  subtitle: boldText(text: "${data['email']}", color: black),
                ),

                const Divider(),
                10.heightBox,
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
                        title: normalText(
                            text: profileButtonTitles[index], color: darkGrey),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}








// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:emart_seller/const/const.dart';
// import 'package:emart_seller/const/images.dart';
// import 'package:emart_seller/controller/auth_controller.dart';
// import 'package:emart_seller/services/store_services.dart';
// import 'package:emart_seller/views/profile_screen/edit_profile.dart';
// import 'package:emart_seller/widgets/loading.dart';
// import 'package:emart_seller/widgets/normal_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../messages_screen/messages_screen.dart';
// import '../shop_screen/shop_settings_screen.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   void printUidOnLogin(String uid) {
//     print('User logged in with UID: $uid');
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: boldText(text: 'Settings', size: 22.0, color: Colors.black),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.to(() => EditProfileScreen());
//             },
//             icon: const Icon(Icons.edit),
//           ),
//           TextButton(
//             onPressed: () async {
//               await Get.find<AuthController>().signoutMethod(context);
//               Get.offAll(() => logout);
//             },
//             child: normalText(text: 'Logout', color: Colors.black),
//           ),
//         ],
//       ),
//       body: FutureBuilder<QuerySnapshot>(
//         future: StoreServices.getProfile(currentUser!.uid),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return loadingIndicator();
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(
//               child: Text('No data available'),
//             );
//           } else {
//             var data = snapshot.data!.docs[0].data() as Map<String, dynamic>;
//             return Column(
//               children: [
//                 ListTile(
//                   leading: Image.asset(imgProduct).box.roundedFull.clip(Clip.antiAlias).make(),
//                   title: boldText(text: data['name'], color: Colors.black),
//                   subtitle: boldText(text: data['email'], color: Colors.black),
//                 ),
//                 const Divider(),
//                 SizedBox(height: 10.0),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: List.generate(
//                       profileButtonIcons.length,
//                           (index) => ListTile(
//                         onTap: () {
//                           switch (index) {
//                             case 0:
//                               Get.to(() => const ShopSettingsScreen());
//                               break;
//                             case 1:
//                               Get.to(() => const MessagesScreen());
//                               break;
//                             default:
//                               break;
//                           }
//                         },
//                         leading: Icon(profileButtonIcons[index]),
//                         title: normalText(text: profileButtonTitles[index], color: darkGrey),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }
