import 'package:get/get.dart';
import 'package:mylab/app/modules/info/controllers/info_controller.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  final infoController = Get.find<InfoController>();

  get imagePath => ''.obs;
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
    infoController.imagePathProfile.val = imagePath();  
    super.onClose();
  }

  void increment() => count.value++;

  getImageCamera(int i) {}

  getImageGallery(int i) {}
}
