import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InfoController extends GetxController {
  //TODO: Implement InfoController

  final count = 0.obs;
  final imagePathProfile = ''.val('profile');
  final data = [].val('storage');
  TextEditingController _myData = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
