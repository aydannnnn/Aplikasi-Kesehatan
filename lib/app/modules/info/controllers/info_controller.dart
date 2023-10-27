import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InfoController extends GetxController {
  //TODO: Implement InfoController

  final count = 0.obs;
  final imagePathProfile = ''.val('image');
  final data = [].val('storage');
  final tempData = [].obs;
  final inputInfo = TextEditingController();

  @override
  void onReady() {
    tempData.value = data.val;
    print('Data:: ${data.val}');
    super.onReady();
  }

  @override
  void onClose() {
    inputInfo.dispose();
    super.onClose();
  }

  void addData({
    required String imagePath,
    required String info,
  }) {
    tempData.add(
      {'imagePath': imagePath, 'inputInfo': info},
    );

    data.val = tempData;
  }
}
