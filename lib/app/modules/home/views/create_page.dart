import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';
import 'package:mylab/app/modules/home/controllers/database_controller.dart';
import 'package:mylab/app/modules/home/views/dashboard_controller.dart';

class CreatePage extends GetView<DashboardController> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final DatabaseController _databasecontroller = Get.put(DatabaseController());
  final TextEditingController _judul = TextEditingController();
  final TextEditingController _deskripsi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Data Terbaru'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                width: 300,
                child: TextField(
                  controller: _judul,
                  decoration: InputDecoration(
                    labelText: 'Title ',
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
                    try {
                      await _databasecontroller.createDocument({
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
                              'Data Terbaru berhasil didibuat ke dalam daftar')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Silakan isi semua informasi terlebih dahulu')),
                    );
                  }
                },
                child: Text('Create'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
