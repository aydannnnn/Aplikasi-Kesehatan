import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  int index = 0;

  final count = 0.obs;
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

  void changeIndex(int index) {
    this.index = index;
  }
}
