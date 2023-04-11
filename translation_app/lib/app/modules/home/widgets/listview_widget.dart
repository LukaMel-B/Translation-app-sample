import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:translation_app/app/modules/home/controllers/bottom_sheet_controller.dart';
import 'package:translation_app/app/modules/home/widgets/language_tile_card.dart';

class ListOfLangs extends GetView<BottomSheetController> {
  final String side;
  const ListOfLangs({super.key, required this.side});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.43,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, index) {
            return (controller.languages.isEmpty)
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.39,
                    child: Center(
                      child: Text(
                        'Oops! No countries, Refresh to find some.',
                        style:
                            TextStyle(fontSize: 11.sp, color: Colors.white54),
                      ),
                    ))
                : (controller.searchString.isNotEmpty &&
                        controller.sortedLanguages.isEmpty)
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.39,
                        child: Center(
                          child: Text(
                            'Oops! No countries found',
                            style: TextStyle(
                                fontSize: 11.sp, color: Colors.white54),
                          ),
                        ))
                    : LanguageTile(
                        title: (controller.searchString.isEmpty)
                            ? controller.languages[index].name
                            : controller.sortedLanguages[index].name,
                        side: side,
                        code: (controller.searchString.isEmpty)
                            ? controller.languages[index].language
                            : controller.sortedLanguages[index].language,
                      );
          },
          itemCount: (controller.searchString.isEmpty)
              ? (controller.languages.isNotEmpty)
                  ? controller.languages.length
                  : 1
              : (controller.searchString.isNotEmpty &&
                      controller.sortedLanguages.isEmpty)
                  ? 1
                  : controller.sortedLanguages.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 15.h,
            );
          },
        ),
      );
    });
  }
}
