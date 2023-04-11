import 'dart:developer';
import 'package:get/get.dart';
import 'package:translation_app/app/data/models/languages_model.dart';
import 'package:translation_app/app/modules/home/controllers/home_controller.dart';
import 'package:translation_app/app/modules/textbox/controllers/textbox_controller.dart';

class LanguagesProvider extends GetConnect {
  getAllLanguages() async {
    try {
      final response = await get(
          'https://google-translate1.p.rapidapi.com/language/translate/v2/languages?target=en',
          headers: {
            'Accept-Encoding': 'application/gzip',
            'X-RapidAPI-Key':
                'e609792965mshef57ddbeef92d94p18e125jsn086c22ddb301',
            'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
          });
      if (response.statusCode == 200) {
        final language = languagesFromJson(response.bodyString!);
        Get.find<HomeController>().languages = language.data.languages;
      } else {
        log('failed');
      }
    } catch (e) {
      log(e.toString());
      log('here lang');
    }
  }
}
