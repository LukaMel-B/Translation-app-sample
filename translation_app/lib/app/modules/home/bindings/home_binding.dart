import 'package:get/get.dart';
import 'package:translation_app/app/modules/home/controllers/home_controller.dart';
import 'package:translation_app/app/modules/textbox/controllers/textbox_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<TextboxController>(
      () => TextboxController(),
    );
  }
}
