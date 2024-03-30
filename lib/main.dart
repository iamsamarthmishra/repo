
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'consts/consts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

  class _MyAppState extends State<MyApp> {
  var isLoggedin = false;

  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      setState(() {
        isLoggedin = user != null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    //using getx need to change this material app into get material app 
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(

          //to set app bar icon color
            iconTheme: IconThemeData(
                color: darkFontGrey
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent),
      ),
      home: isLoggedin ? const Home() : const LoginScreen(),
    );
  }
}
