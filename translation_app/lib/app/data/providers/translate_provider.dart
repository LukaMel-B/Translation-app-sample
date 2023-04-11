import 'dart:developer';
import 'package:get/get.dart';
import 'package:translation_app/app/data/models/translate_model.dart';
import 'package:translation_app/app/modules/textbox/controllers/textbox_controller.dart';

class TranslateProvider extends GetConnect {
  translate(String target, String source, String query) async {
    try {
      final body = 'q=$query&target=$target&source=$source';
      final response = await post(
        'https://google-translate1.p.rapidapi.com/language/translate/v2',
        body,
        headers: {
          'content-type': 'application/x-www-form-urlencoded',
          'Accept-Encoding': 'application/gzip',
          'X-RapidAPI-Key':
              'e609792965mshef57ddbeef92d94p18e125jsn086c22ddb301',
          'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
        },
      );
      log(response.body.toString());
      if (response.statusCode == 200) {
        var translation = translateFromJson(response.bodyString!);
        Get.find<TextboxController>().toLangController.text =
            translation.data.translations[0].translatedText;
        Get.find<TextboxController>().update();
      } else {
        log('failed');
      }
    } catch (e) {
      log(e.toString());
      log('here lang');
    }
  }
}
