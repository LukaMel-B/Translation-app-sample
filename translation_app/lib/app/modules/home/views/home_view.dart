import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:translation_app/app/modules/home/controllers/home_controller.dart';
import 'package:translation_app/app/modules/home/widgets/language_button.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                LanguageSelectButton(
                  onPressed: () {},
                  country: 'Germany',
                ),
                const RotatedBox(
                  quarterTurns: 5,
                  child: Icon(
                    Icons.import_export_rounded,
                    color: Colors.white60,
                  ),
                ),
                LanguageSelectButton(
                  onPressed: () {},
                  country: 'Italy',
                ),
              ],
            )
          ],
        ));
  }
}
