import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/const/colors.dart';
import 'package:emart_seller/const/strings.dart';
import 'package:emart_seller/services/store_services.dart';
import 'package:emart_seller/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../const/firebase_const.dart';
import '../../widgets/normal_text.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: messages, size: 16.0, color: darkGrey),
      ),
      body: StreamBuilder(
        stream: StoreServices.getMessages(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    data.length,
                        (index){
                          var t = data[index]['created_on'] == null ? DateTime.now() : data[index]['created_on'].toDate();
                          var time = intl.DateFormat("h:mm").format(t);
                          return ListTile(
                            onTap: () {
                              Get.to(() => const ChatScreen());
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.purple,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            title: boldText(text: "${data[index]['sender_Id']}", color: fontGrey),
                            subtitle: normalText(text: "${data[index]['last_msg']}", color: darkGrey),
                            trailing: normalText(text: time, color: darkGrey),
                          );
                        }
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
