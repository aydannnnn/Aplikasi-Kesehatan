// import 'dart:io';

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import '../controllers/profile_controller.dart';

// import 'package:google_fonts/google_fonts.dart';

// class Profile extends GetView<ProfileController> {
//    Profile({super.key});

// List<RxString> imagePath = List.generate(99, (index) => ''.obs);

// //   Future getImageCamera(int index) async{
// //     final ImagePicker picker = ImagePicker();
// //     final image = await picker.pickImage(source: ImageSource.camera);
// //     if(image != null) {
// //       imagePath[index].value = image.path.toString();
// //     }

// //     print('Data:: $imagePath[index]');
// //   }

// //   Future getImageGallery(int index) async{
// //     final ImagePicker picker = ImagePicker();
// //     final image = await picker.pickImage(source: ImageSource.gallery);
// //     if(image != null) {
// //       imagePath[index].value = image.path.toString();
// //     }

// //     print('Data:: $imagePath[index]');
// // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff13131b),
//         title: Text(
//           'User Profile',
//           style: GoogleFonts.roboto(color: Colors.white),
//         ),
//       ),
//       // body: Center(
//       //   child: ListView(
//       //     children: <Widget>[
//       //       Container(
//       //         padding: EdgeInsets.symmetric(vertical: 24),
//       //         color: Color(0xff13131b),
//       //         child: CircleAvatar(
//       //           radius: 100,
//       //           child: Obx(() {
//       //             if (controller.imagePath[98].isNotEmpty) {
//       //               return CircleAvatar(
//       //                 backgroundImage:
//       //                     FileImage(File(controller.imagePath[98].value)),
//       //                 radius: 100,
//       //               );
//       //             }
//       //             return CircleAvatar(
//       //               backgroundImage: AssetImage('assets/logo/daffaa.jpeg'),
//       //               radius: 100,
//       //             );
//       //           }),
//       //         ),
//       //       ),
//       //       GestureDetector(
//       //         onTap: () {
//       //           showModalBottomSheet<void>(
//       //             context: context,
//       //             builder: (BuildContext context) {
//       //               return Container(
//       //                 height: 120,
//       //                 color: Colors.white,
//       //                 child: Center(
//       //                   child: Column(
//       //                     mainAxisAlignment: MainAxisAlignment.center,
//       //                     children: <Widget>[
//       //                       ElevatedButton(
//       //                         child: const Text('Continue Using Camera'),
//       //                         onPressed: () => controller.getImageCamera(98),
//       //                       ),
//       //                       ElevatedButton(
//       //                         child: const Text('Continue Using Gallery'),
//       //                         onPressed: () => controller.getImageGallery(98),
//       //                       ),
//       //                     ],
//       //                   ),
//       //                 ),
//       //               );
//       //             },
//       //           );
//       //         },
//       //         child: Text(
//       //           'Change Image',
//       //           style: GoogleFonts.roboto(
//       //             color: Colors.blue,
//       //           ),
//       //           textAlign: TextAlign.center,
//       //         ),
//       //       ),
//       //       SizedBox(height: 20),
//       //       Text(
//       //         'User',
//       //         style: GoogleFonts.roboto(
//       //           color: Colors.white,
//       //           fontSize: 24,
//       //           fontWeight: FontWeight.bold,
//       //         ),
//       //         textAlign: TextAlign.center,
//       //       ),
//       //       SizedBox(height: 10),
//       //       Text(
//       //         'email@gmail.com',
//       //         style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
//       //         textAlign: TextAlign.center,
//       //       ),
//       //       SizedBox(height: 10),
//       //       Text(
//       //         'Indonesia',
//       //         style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),
//       //         textAlign: TextAlign.center,
//       //       ),
//       //     ],
//       //   ),
//       // ),

//       body: Obx((){
//         return Padding(
//           padding: EdgeInsets.only(left: 30, right: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//                 SizedBox(height: 20,),
//             Center(
//               child:
//               CircleAvatar(
//                 radius: 100,
//                 backgroundImage: controller.imagePath.isNotEmpty ?
//                 FileImage(File(controller.imagePath.toString())) :
//                   null
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 20,),
//                 TextButton(onPressed: (){
//               controller.getImageFromGallery();
//             }, child: Text('Pilih foto'),),
//             TextButton(onPressed: (){
//               controller.getImagesFromCamera();
//             }, child: Text('Ambil foto'),),
//               ],
//             ),

//     );
//   }
// }

import 'dart:io';
import 'package:mylab/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mylab/app/modules/register/views/register_view.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mylab/app/routes/app_pages.dart';

import '../../info/controllers/info_controller.dart';
import '../../info/views/info_view.dart';

class imagePickerController extends GetxController {
  RxString imagePath = ''.obs;
  final infoController = Get.put(InfoController());

  @override
  void onClose() {
    super.onClose();
  }

  Future getImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Get.snackbar("Profile", "Sukses");
      imagePath.value = image.path.toString();
      infoController.imagePathProfile.val = imagePath.value;
    }
  }

  Future getImagesFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      Get.snackbar("Profile", "Sukses");
      imagePath.value = image.path.toString();
      infoController.imagePathProfile.val = imagePath.value;
    }
  }
}

class profile extends StatelessWidget {
  imagePickerController controller = Get.put(imagePickerController());
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: IconButton(onPressed: (){
      //     Navigator.push(context, MaterialPageRoute(builder: (context){
      //                 return RegisterView();
      //               }));
      //   }, icon: const Icon(Icons.arrow_back), color: Colors.black,),
      //   title: Text('Profile'),

      //   // actions: [
      //   //   Container(
      //   //     margin: const EdgeInsets.only(right: 16),
      //   //     child: Icon(Icons.notifications, color: Color(0xffff9900),),
      //   //   )
      //   // ],
      // ),

      body: Obx(() {
        return Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child:
                    //       // CircleAvatar(
                    //       //   radius: 100,
                    //       //   backgroundImage: controller.imagePath.isNotEmpty ?
                    //       // FileImage(File(controller.imagePath.toString())) :
                    //       //   null
                    //       // ),
                    Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(controller.imagePath.toString())),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(padding: EdgeInsets.only(top: 100)),
                  ElevatedButton(
                      onPressed: () {
                        controller.getImageFromGallery();
                      },
                      child: Text('Pilih foto')),
                  Padding(padding: EdgeInsets.only(right: 50)),
                  ElevatedButton(
                    onPressed: () {
                      controller.getImagesFromCamera();
                    },
                    child: Text(
                      'Ambil foto',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Get.offAllNamed(Routes.INFO),
                child: Text(
                  "Upload",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[100]),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey, fixedSize: Size(150, 50)),
              ),
              // TextField(
              //   controller: myController,
              // ),
              // TextButton(onPressed: () {
              //   box.write('key', myController.text);
              //   Get.toNamed('/info');
              // },
              // child: Text("Move to Info"),
              // ),
            ],
          ),
        );
      }),
    );
  }
}
