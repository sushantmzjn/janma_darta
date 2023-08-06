import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ChartIndicator extends StatelessWidget {
  String text;
  Color color;

  ChartIndicator({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 25.w,
            height: 10.h,
            color: color,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
