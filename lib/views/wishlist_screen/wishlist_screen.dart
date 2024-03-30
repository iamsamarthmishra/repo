import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/widgets_common/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "My Wishlist".text.color(Colors.white).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getWishlists(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: loadingIndicator(),
            );
          } else if(snapshot.data!.docs.isEmpty){
            return "No order Yet!".text.color(Colors.white).makeCentered();
          } else {
            return Container(
              //1:25:23 - 1:33:30 #9 part backend
            );
          }
        },
      ),
    );
  }
}
