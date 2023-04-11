// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:translation_app/app/data/providers/country_name_getter_provider.dart';
import 'package:translation_app/app/modules/home/controllers/bottom_sheet_controller.dart';
import 'package:translation_app/app/modules/home/widgets/listview_widget.dart';
import 'package:translation_app/app/modules/home/widgets/text_span_widgets.dart';

class BottomSheetWidget extends GetView<BottomSheetController> {
  final String heading;
  BottomSheetWidget({Key? key, required this.heading}) : super(key: key);
  String country = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Color(0xff232527),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      ),
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 30.w),
      child: Wrap(
        runSpacing: 20.h,
        children: [
          Text(
            heading,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.white60,
            ),
          ),
          TextFormField(
            enableInteractiveSelection: true,
            controller: controller.countrySearch,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Colors.white54,
              ),
              fillColor: Colors.transparent,
              focusedErrorBorder: outputBorder(Colors.white38),
              errorBorder: outputBorder(Colors.white38),
              focusedBorder: outputBorder(Colors.white38),
              contentPadding: const EdgeInsets.all(19),
              enabledBorder: outputBorder(Colors.white38),
              hintText: 'Language',
              hintStyle: TextStyle(
                fontSize: 15.5.sp,
                color: const Color(0x88FFFFFF),
                fontFamily: 'Montserrat SemiBold',
              ),
            ),
            onChanged: (value) {
              controller.searchString.value = value;
              controller.sortList(value);
            },
            cursorColor: Colors.white60,
            style: TextStyle(fontSize: 15.sp, color: const Color(0xEDFFFFFF)),
          ),
          Text(
            'All Languages',
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 17.sp,
              color: const Color(0xD0FFFFFF),
            ),
          ),
          ListOfLangs(
            side: heading,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return (controller.searchString.isEmpty)
                    ? Flexible(
                        child: textSpanTotal(
                          controller.languages.length.toString(),
                        ),
                      )
                    : Flexible(
                        child: textSpanSort(
                          controller.sortedLanguages.length.toString(),
                          controller.searchString.value,
                        ),
                      );
              }),
            ],
          )
        ],
      ),
    );
  }

  findCountry(String language) async {
    country = await GetCountryNameProvider().getGetCountryName(language);
    return country;
  }

  OutlineInputBorder outputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: color, width: .8),
    );
  }
}
