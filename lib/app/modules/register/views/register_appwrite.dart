import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylab/app/modules/login/controllers/account_controller.dart';
import 'package:mylab/app/modules/login/controllers/auth_controller.dart';

class RegisterAppwrite extends StatefulWidget {
  @override
  State<RegisterAppwrite> createState() => _RegisterAppwriteState();
}

class _RegisterAppwriteState extends State<RegisterAppwrite> {
  final AccountController _appwriterController = Get.put(AccountController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Container(
              width: 100,
              height: 100,
              child: Image.asset("assets/logo/ikon1-logo.png"),
            ),
            SizedBox(height: 30),
            Text(
              "Silahkan daftar terlebih dahulu",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Email"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nameController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Name"),
            ),
            SizedBox(
              height: 16,
            ),
            Obx(() {
              return ElevatedButton(
                onPressed: _appwriterController.isLoading.value
                    ? null
                    : () {
                        _appwriterController.createAccount(
                            _emailController.text, _passwordController.text, _nameController.text);
                      },
                child: _appwriterController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text(
                        "Submit",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white),
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
