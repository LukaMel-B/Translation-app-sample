import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:translation_app/app/data/lists/country_code.dart';
import 'package:translation_app/app/data/providers/country_name_getter_provider.dart';
import 'package:translation_app/app/modules/home/controllers/home_controller.dart';

class LanguageTile extends GetView {
  final String title;
  final String code;
  final String side;
  const LanguageTile(
      {super.key, required this.title, required this.side, required this.code});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (side == 'From') {
          Get.find<HomeController>().fromLang.value = title;
          Get.find<HomeController>().fromLangCode.value = this.code;
          Get.back();
          var code = await findCode();
          Get.find<HomeController>().fromFlag.value =
              'https://hatscripts.github.io/circle-flags/flags/$code.svg';
        } else {
          Get.find<HomeController>().toLang.value = title;
          Get.find<HomeController>().toLangCode.value = this.code;
          Get.back();
          var code = await findCode();
          Get.find<HomeController>().toFlag.value = (code != '')
              ? 'https://hatscripts.github.io/circle-flags/flags/$code.svg'
              : '';
        }
      },
      child: Container(
        height: 50.h,
        decoration: const BoxDecoration(
          color: Color(0xff121416),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white60,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> findCode() async {
    final country =
        await GetCountryNameProvider().getGetCountryName(title.toLowerCase());
    final code = CountryCodes().countryCodes.keys.firstWhere(
        (k) => CountryCodes().countryCodes[k] == country,
        orElse: () => '');
    return code;
  }

  // Widget countryFlag() {
  //   final code = CountryCodes().countryCodes.keys.firstWhere(
  //       (k) => CountryCodes().countryCodes[k] == country,
  //       orElse: () => null);
  //   return (code != null)
  //       ? SvgPicture.network(
  //           'https://hatscripts.github.io/circle-flags/flags/$code.svg',
  //           height: 25.h,
  //         )
  //       : const SizedBox();
  // }
}
