import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translation_app/app/data/lists/country_code.dart';

class LanguageSelectButton extends StatelessWidget {
  final String country;
  final VoidCallback onPressed;
  const LanguageSelectButton(
      {super.key, required this.country, required this.onPressed});

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
            countryFlag(),
            SizedBox(
              width: 10.w,
            ),
            Flexible(
              child: Text(
                country,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 12.sp,
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

  Widget countryFlag() {
    final code = CountryCodes().countryCodes.keys.firstWhere(
        (k) => CountryCodes().countryCodes[k] == country,
        orElse: () => null);
    return (code != null)
        ? SvgPicture.network(
            'https://hatscripts.github.io/circle-flags/flags/$code.svg',
            height: 25.h,
          )
        : const SizedBox();
  }
}
