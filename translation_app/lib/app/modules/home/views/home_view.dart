import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:translation_app/app/modules/home/controllers/bottom_sheet_controller.dart';
import 'package:translation_app/app/modules/home/controllers/home_controller.dart';
import 'package:translation_app/app/modules/home/widgets/bottom_sheet.dart';
import 'package:translation_app/app/modules/home/widgets/language_button.dart';
import 'package:translation_app/app/modules/textbox/views/textbox_from_view.dart';
import 'package:translation_app/app/modules/textbox/views/textbox_to_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // log(controller.languages.length.toString());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff141618),
          elevation: 0,
        ),
        backgroundColor: const Color(0xff141618),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            Text(
              'Text Translation',
              style: TextStyle(
                fontSize: 20.sp,
                color: const Color(0xDDFFFFFF),
              ),
            ),
            Divider(
              color: Colors.white30,
              height: 50.h,
              thickness: .7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return LanguageSelectButton(
                    side: 'from',
                    onPressed: () {
                      Get.lazyPut<BottomSheetController>(
                        () => BottomSheetController(),
                      );
                      Get.bottomSheet(BottomSheetWidget(heading: 'From'),
                          isScrollControlled: true);
                      Get.find<BottomSheetController>().languages =
                          controller.languages;
                    },
                    language: controller.fromLang.value,
                  );
                }),
                const RotatedBox(
                  quarterTurns: 5,
                  child: Icon(
                    Icons.import_export_rounded,
                    color: Colors.white60,
                  ),
                ),
                Obx(() {
                  return LanguageSelectButton(
                    side: 'to',
                    onPressed: () {
                      Get.lazyPut<BottomSheetController>(
                        () => BottomSheetController(),
                      );
                      Get.bottomSheet(BottomSheetWidget(heading: 'To'),
                          isScrollControlled: true);
                      Get.find<BottomSheetController>().languages =
                          controller.languages;
                    },
                    language: controller.toLang.value,
                  );
                }),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            const TextboxFromView(),
            SizedBox(
              height: 20.h,
            ),
            const TextboxToView()
          ],
        ));
  }
}
