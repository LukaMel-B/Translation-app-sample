import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translation_app/app/modules/home/controllers/home_controller.dart';

class LanguageSelectButton extends GetView<HomeController> {
  final String language;
  final VoidCallback onPressed;
  final String side;
  const LanguageSelectButton(
      {super.key,
      required this.language,
      required this.onPressed,
      required this.side});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextButton(
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size.square(43),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          backgroundColor: Colors.white10,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Obx(() {
              if (side == 'from' && controller.fromFlag.value != '') {
                return SvgPicture.network(
                  controller.fromFlag.value,
                  height: 25.h,
                );
              } else if (side == 'to' && controller.toFlag.value != '') {
                return SvgPicture.network(
                  controller.toFlag.value,
                  height: 25.h,
                );
              } else {
                return const SizedBox();
              }
            }),
            SizedBox(
              width: 10.w,
            ),
            Flexible(
              child: Text(
                language,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: const Color(0xDDFFFFFF),
                ),
              ),
            ),
            SizedBox(
              width: 13.w,
            )
          ],
        ),
      ),
    );
  }

  // Widget countryFlag() {
  //   final country =
  //       GetCountryNameProvider().getGetCountryName(language.toLowerCase());
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
