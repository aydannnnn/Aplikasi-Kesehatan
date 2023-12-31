import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylab/app/modules/home/views/home_view.dart';
import 'package:mylab/app/modules/login/controllers/client_controller.dart';
import 'package:mylab/app/modules/login/views/login_page.dart';

class AccountController extends ClientController {
  RxBool isLoading = false.obs;
  Account? account;
  @override
  void onInit() {
    super.onInit();
// appwrite
    account = Account(client);
  }

  void handleSyaratTap() {
    // Implement the behavior of the handleSyaratTap function
    print('Handling syarat tap');
    // Add any additional logic based on your requirements
  }

  Future createAccount(String email, String password, String name) async {
    try {
      isLoading.value = true;
      final result = await account!.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      Get.snackbar('Success', 'Registration Successful',
          backgroundColor: Colors.green);
      Get.off(LoginPage());
    } catch (error) {
      Get.snackbar('Error', 'Registration failer: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future createEmailSession(String email, String password) async {
    try {
      final result = await account!.createEmailSession(
        email: email,
        password: password,
      );
      print("AccountController:: createEmailSession $result");
      Get.off(HomeView());
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}
