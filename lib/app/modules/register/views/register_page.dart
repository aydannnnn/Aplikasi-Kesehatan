import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylab/app/modules/login/controllers/auth_controller.dart';
import 'package:mylab/app/modules/register/views/register_appwrite.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController _authController = Get.put(AuthController());

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            SizedBox(
              height: 16,
            ),
            Obx(() {
              return ElevatedButton(
                onPressed: _authController.isLoading.value
                    ? null
                    : () {
                        _authController.registerUser(
                            _emailController.text, _passwordController.text);
                      },
                child: _authController.isLoading.value
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
            SizedBox(height: 16),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterAppwrite()),
                  );
                },
                child: const Text("Register via Appwrite")),
          ],
        ),
      ),
    );
  }
}
