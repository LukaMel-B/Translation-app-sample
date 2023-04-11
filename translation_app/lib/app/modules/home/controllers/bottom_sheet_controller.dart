import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translation_app/app/data/models/country_name_getter_model.dart';
import 'package:translation_app/app/data/models/languages_model.dart';
import 'package:translation_app/app/modules/home/controllers/home_controller.dart';

class BottomSheetController extends GetxController {
  final TextEditingController countrySearch = TextEditingController();
  String countryName = '';
  List<Language> languages = [];
  var sortedLanguages = [].obs;
  getCountryName(GetCountryName? country) {
    if (country != null) {
      countryName = country.name.common;
    }
  }

  RxString searchString = ''.obs;
  sortList(String search) {
    sortedLanguages.value = languages
        .where((list) =>
            (list.name.toString().toLowerCase().contains(search.toLowerCase())))
        .toList();
  }

  @override
  void onInit() {
    languages = Get.find<HomeController>().languages;
    super.onInit();
  }
}
