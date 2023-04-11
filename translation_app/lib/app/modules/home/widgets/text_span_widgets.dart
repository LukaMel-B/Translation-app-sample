import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget textSpanTotal(String totalLang) {
  return Text.rich(
    TextSpan(
      text: '',
      children: <InlineSpan>[
        TextSpan(
          text: 'There are total',
          style: TextStyle(fontSize: 11.sp, color: Colors.white54),
        ),
        TextSpan(
          text: ' $totalLang Languages ',
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
      ],
    ),
    textAlign: TextAlign.center,
  );
}

Widget textSpanSort(String no, String letters) {
  return Text.rich(
    TextSpan(
      text: '',
      children: <InlineSpan>[
        TextSpan(
          text: 'There are',
          style: TextStyle(fontSize: 11.sp, color: Colors.white54),
        ),
        TextSpan(
          text: ' $no Languages ',
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        TextSpan(
          text: 'with the ',
          style: TextStyle(fontSize: 11.sp, color: Colors.white54),
        ),
        TextSpan(
          text: 'Letter $letters',
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
      ],
    ),
    textAlign: TextAlign.center,
  );
}
