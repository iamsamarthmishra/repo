import 'package:emart_seller/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../const/firebase_const.dart';

class AuthController extends GetxController {
  var isloading = false.obs;

  //textcontrollers

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //login method

  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // Future<UserCredential?> loginMethod({context}) async {
  //   UserCredential? userCredential;
  //
  //   try {
  //     userCredential =
  //     await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
  //   } on FirebaseAuthException catch (e) {
  //     VxToast.show(context, msg: e.toString());
  //   }
  //   return userCredential;
  // }


  //signup Method
  // Future<UserCredential?> signupMethod({email, password, context}) async {
  //   UserCredential? userCredential;
  //
  //   try {
  //     await auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     VxToast.show(context, msg: e.toString());
  //   }
  //   return userCredential;
  // }

  // storing data method

  // storeUserData({name, password, email}) async {
  //   DocumentReference store = firestore.collection(sellerCollection).doc(
  //       currentUser?.uid);
  //   store.set({
  //     'name': name,
  //     'password': password,
  //     'email': email,
  //     'imageUrl': '',
  //     'id': currentUser!.uid,
  //     'cart_count': "00",
  //     'wishlist_count': "02",
  //     'order_count': "00",
  //   });
  //
  // }

  //signout method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}