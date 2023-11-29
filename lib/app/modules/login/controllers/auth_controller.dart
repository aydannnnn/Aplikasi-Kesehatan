import 'package:appwrite/appwrite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylab/app/modules/login/controllers/account_controller.dart';
import 'package:mylab/app/modules/login/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final SharedPreferences _prefs = Get.find<SharedPreferences>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AccountController accountController = Get.put(AccountController());
  RxBool isLoading = false.obs; //observable boolean dari getx
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    // checkLoginStatus();
  }

  // Future<void> checkLoginStatus() async {
  //   isLoggedIn.value = _prefs.containsKey('user_token');
  // }

  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _prefs.setString(
          'user_token', _auth.currentUser!.uid); // Simpan token autentikasi
      Get.snackbar('Success', 'Login successful',
          backgroundColor: Colors.green);
      isLoggedIn.value = true; // Set status login menjadi true
      Get.offAllNamed(
          '/home'); // Navigate ke HomePage dan hapus semua halaman sebelumnya
    } catch (error) {
      Get.snackbar('Error', 'Login failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    // _prefs.remove('user_token'); // Hapus token autentikasi dari penyimpanan
    isLoggedIn.value = false; // Set status login menjadi false
    _auth.signOut(); // Sign out dari Firebase Authentication
    Get.offAllNamed('/login');
  }
}
