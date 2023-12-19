import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylab/app/modules/register/views/register_page.dart';
import 'package:mylab/app/modules/login/controllers/account_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final AuthController _authController = Get.put(AuthController());
  final AccountController _accountController = Get.put(AccountController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void handleSyaratTap() {
    // Implement the behavior of the handleSyaratTap function
    print('Handling syarat tap');
    // Add any additional logic based on your requirements
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              height: 200,
              child: Image.asset(
                "assets/logo/logo-login.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Silahkan login terlebih dahulu",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              "Email",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: "Saya menyetujui ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("klik syarat");
                            },
                          text: "syarat",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: ",",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("klik ketentuan");
                            },
                          text: " ketentuan",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: ", dan",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("klik privasi");
                            },
                          text: " privasi",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: " MyLab",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Obx(
              () {
                return ElevatedButton(
                  onPressed: _accountController.isLoading.value
                      ? null
                      : () {
                          _accountController.createEmailSession(
                            _emailController.text,
                            _passwordController.text,
                          );
                        },
                  child: _accountController.isLoading.value
                      ? CircularProgressIndicator()
                      : Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                  style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text(
                "Daftar",
                style: TextStyle(fontSize: 15, color: Colors.blue[900]),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text("Atau masuk menggunakan"),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo/icons/fb.png"),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Facebook",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff3B5998),
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: Color(0xff3B5998),
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo/icons/x.png"),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Twitter",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff1DA1F2),
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        color: Color(0xff1DA1F2),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     TextField(
        //       controller: _emailController,
        //       decoration: InputDecoration(labelText: 'Email'),
        //     ),
        //     TextField(
        //       controller: _passwordController,
        //       obscureText: true,
        //       decoration: InputDecoration(labelText: 'Password'),
        //     ),
        //     SizedBox(height: 16),
        //     Obx(() {
        //       return ElevatedButton(
        //         onPressed: _authController.isLoading.value
        //             ? null
        //             : () {
        //                 _authController.loginUser(
        //                   _emailController.text,
        //                   _passwordController.text,
        //                 );
        //               },
        //         child: _authController.isLoading.value
        //             ? CircularProgressIndicator()
        //             : Text('Login'),
        //       );
        //     }),
        //   ],
        // ),
      ),
    );
  }
}
