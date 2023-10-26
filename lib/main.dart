import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mylab/app/modules/profile/views/profile_view.dart';

import 'app/routes/app_pages.dart';

import 'app/widget/splash.dart';

void main() async{
  await GetStorage.init();
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return SplashScreen();
        } else {
          return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Application",
          initialRoute: Routes.LOGIN,
          getPages: AppPages.routes,
          home: profile(),
        );
        }
        
      }
    );
  }
}
