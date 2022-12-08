import 'package:get/get.dart';
import 'package:yogafx/model/model.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();

  String bodyType = 'Muscler Body';
  String bodyView = 'Front Side';
  String anatomyImage = AssetPath.muscleFront;

  //LOADING IMAGE BAED ON USER SELECTION
  imageAssetString() {
    if (bodyType == 'Muscler Body') {
      if (bodyView == 'Front Side') {
        anatomyImage = AssetPath.muscleFront;
        update();
      } else {
        anatomyImage = AssetPath.muscleBack;
        update();
      }
    } else {
      if (bodyView == 'Front Side') {
        anatomyImage = AssetPath.skeltonFront;
        update();
      } else {
        anatomyImage = AssetPath.skeltonBack;
        update();
      }
    }
  }
}
