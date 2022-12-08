import 'package:get/instance_manager.dart';
import 'package:yogafx/controller/controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(AppController(), permanent: true);
  }
}