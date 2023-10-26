import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mylab/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
            "Silahkan masuk dengan nomor anda",
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold,
              ),
          ),
            SizedBox(height: 30),
          Text(
            "Nomor Telpon",
             style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              ),
          ),
           SizedBox(height: 10),
          TextField(
            controller: controller.emailC,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "cth. 081xxxxxx"),
          ),
            SizedBox(height: 10),
          Row(       
            children: [
             Obx(
              () => Checkbox(
                value: controller.checkC.value,
                onChanged: (value)=> controller.checkC.toggle(),
              ),
            ),  
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
              )
            ],
          ),
            SizedBox(height: 30),
          ElevatedButton(onPressed: ()=> Get.offAllNamed(Routes.HOME),
          child: Text(
            "MASUK", 
          style: TextStyle(
            color: Colors.grey,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey[300],
            fixedSize: Size(150, 50)
          ),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: ()=> Get.offAllNamed(Routes.REGISTER), 
            child: Text(
              "Daftar",
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue[900]),
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
              OutlinedButton(onPressed: (){}, 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo/icons/fb.png"),
              SizedBox(width: 7,),
              Text("Facebook", 
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff3B5998),
                ),
              ),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size(150, 50),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
              OutlinedButton(onPressed: (){}, 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo/icons/x.png"),
              SizedBox(width: 7,),
              Text("Twitter", 
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff1DA1F2),
                ),
              ),
            ],
          ),
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
              Size(150, 50),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
        ),
      );
  }
}
