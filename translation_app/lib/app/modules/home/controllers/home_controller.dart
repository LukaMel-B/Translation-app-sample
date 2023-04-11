import 'package:get/get.dart';
import 'package:translation_app/app/data/models/languages_model.dart';
import 'package:translation_app/app/data/providers/languages_provider.dart';

class HomeController extends GetxController {
  List<Language> languages = [];
  RxString toLang = 'German'.obs;
  RxString fromLang = 'English'.obs;
  RxString fromFlag =
      'https://hatscripts.github.io/circle-flags/flags/us.svg'.obs;
  RxString toFlag =
      'https://hatscripts.github.io/circle-flags/flags/de.svg'.obs;
  RxString toLangCode = 'de'.obs;
  RxString fromLangCode = 'en'.obs;

  @override
  void onInit() {
    LanguagesProvider().getAllLanguages();
    super.onInit();
  }
}
