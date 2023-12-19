import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mylab/app/modules/home/controllers/database_controller.dart';
import 'package:mylab/app/modules/home/views/dashboard_controller.dart';
import 'package:mylab/app/modules/home/views/product_update_page.dart';
import 'package:mylab/app/routes/app_pages.dart';

class ProductsPage extends GetView<DashboardController> {
  final DatabaseController _databasecontroller = Get.put(DatabaseController());
  final String product_id;

  ProductsPage({Key? key, required this.product_id}) : super(key: key);

  @override
  // void onInit() {
  //   // Initialize DashboardController here
  //   Get.put(DashboardController());
  //   super.onInit();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Data'),
      ),
      body: ListView.builder(
        itemCount: controller.databaseController.productData.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Id " +
                        controller.databaseController.productData[index].$id,
                    style: TextStyle(color: Colors.grey)),
                Text(
                  controller
                      .databaseController.productData[index].data['title'],
                  style: TextStyle(fontSize: 30, color: Colors.orange),
                ),
                Text(
                  "Deskripsi : " +
                      controller.databaseController.productData[index]
                          .data['description'],
                  style: TextStyle(color: Colors.black54),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final document_id = controller
                              .databaseController.productData[index].$id;
                          await _databasecontroller.deleteDocument(document_id);
                        },
                        child: Text("Delete")),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          String product_id = controller
                              .databaseController.productData[index].$id;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UpdateDatabasePage(product_id: product_id),
                            ),
                          );
                        },
                        child: Text("Update")),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
