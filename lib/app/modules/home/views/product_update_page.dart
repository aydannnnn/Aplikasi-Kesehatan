import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';
import 'package:mylab/app/modules/home/controllers/database_controller.dart';
import 'package:mylab/app/modules/home/views/dashboard_controller.dart';

class UpdateDatabasePage extends GetView<DashboardController> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final DatabaseController _databasecontroller = Get.put(DatabaseController());
  final TextEditingController _judul = TextEditingController();
  final TextEditingController _deskripsi = TextEditingController();

  final String product_id;
  // String getProductId() {
  //   final Map? arguments = Get.arguments;
  //   if (arguments != null && arguments.containsKey("product_id")) {
  //     return arguments["product_id"].toString();
  //   } else {
  //     // Handle the case where arguments is null or "product_id" is not present
  //     return ""; // or throw an exception or return a default value
  //   }
  // }

  UpdateDatabasePage({Key? key, required this.product_id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Data Terbaru'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   width: 200,
              //   height: 200,
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.grey),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Obx(
              //     () => controller.tempimagePath.value == ''
              //         ? Center(
              //             child: Text(
              //               'Pilih gambar dari kamera/galeri',
              //               style: TextStyle(
              //                 fontSize: 20,
              //                 color: Colors.grey,
              //               ),
              //             ),
              //           )
              //         : Image.file(File(controller.tempimagePath.value),
              //             fit: BoxFit.cover),
              //   ),
              // ),
              // SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {
              //         controller.getImageCamera2();
              //       },
              //       child: Text('Kamera'),
              //     ),
              //     SizedBox(width: 20),
              //     ElevatedButton(
              //       onPressed: () {
              //         controller.getImageGallery2();
              //       },
              //       child: Text('Galeri'),
              //     ),
              //   ],
              // ),
              Text('Received Book ID: $product_id'),
              SizedBox(height: 20),
              Container(
                width: 300,
                child: TextField(
                  controller: _judul,
                  decoration: InputDecoration(
                    labelText: 'Judul',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                child: TextField(
                  controller: _deskripsi,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final title = _judul.text;
                  final description = _deskripsi.text;

                  if (title.isNotEmpty && description.isNotEmpty) {
                    // controller.addBookWithInfo(
                    //     title, description, controller.tempimagePath.value);

                    // // Reset input fields
                    // titleController.clear();
                    // descriptionController.clear();
                    // controller.tempimagePath.value = '';

                    try {
                      await _databasecontroller.updateDocument(product_id, {
                        'title': title,
                        'description': description,
                      });
                      // Rest of the code...
                    } catch (e) {
                      print('Appwrite Exception: $e');
                      // Handle the exception, log it, or display an error message to the user.
                    }

                    // Inform user that the book was uploaded
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Data Terbaru berhasil diupload ke dalam daftar')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Silakan isi semua informasi terlebih dahulu')),
                    );
                  }
                },
                child: Text('Upload'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
