import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/colors.dart';
import '../../consts/strings.dart';
import '../../widgets_common/normal_text.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: messages, size: 16.0, color: darkGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
                  (index) => ListTile(
                    onTap: () {
                      Get.to(() => const ChatScreen());
                    },
                leading: const CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: boldText(text: "Username", color: fontGrey),
                    subtitle: normalText(text: "Last Message", color: darkGrey),
                    trailing: normalText(text: "10:45Pm", color: darkGrey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
