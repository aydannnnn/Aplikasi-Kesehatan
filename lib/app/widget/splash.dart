import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
        child: Container(
          child: Image.asset("assets/logo/logo-splash.png"),
        ),
      ),
      ) 
      
    );
  }
}