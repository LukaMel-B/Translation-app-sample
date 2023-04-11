import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:translation_app/app/modules/home/controllers/home_controller.dart';
import 'package:translation_app/app/modules/textbox/controllers/textbox_controller.dart';

class TextboxToView extends GetView<TextboxController> {
  const TextboxToView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20.h,
      children: [
        Obx(() {
          return Text(
            'Translate To (${Get.find<HomeController>().toLang.value})',
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.white60,
            ),
          );
        }),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Column(
            children: [
              GetBuilder<TextboxController>(builder: (controllerBuilder) {
                return TextFormField(
                  controller: controller.toLangController,
                  decoration: const InputDecoration(
                      hintText: 'Translate',
                      hintStyle: TextStyle(color: Colors.white70),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white24,
                          width: .8,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white24, width: .8),
                      ),
                      counterStyle: TextStyle(color: Colors.white54)),
                  cursorColor: Colors.grey,
                  style: const TextStyle(color: Colors.white70),
                  maxLength: 400,
                  maxLines: 5,
                );
              })
            ],
          ),
        )
      ],
    );
  }
}
