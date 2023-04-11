import 'package:get/get.dart';

import '../controllers/textbox_controller.dart';

class TextboxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextboxController>(
      () => TextboxController(),
    );
  }
}
