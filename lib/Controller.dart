import 'package:get/get.dart';
import 'package:flashcard_app/BackEnd/Menu.dart';

class Controller extends GetxController {
  static Controller get to=>  Get.find();

  final Menu _model = Menu();
  Menu get model => _model;
}