import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors.dart';

class CustomButtons extends StatelessWidget {
  void Function()? onPressed;
  final String text;

  CustomButtons({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          ),
          backgroundColor: primaryColor,
          minimumSize: Size(double.infinity, 56.h)
        ),
        child: Text(text, style: TextStyle(fontSize: 18.sp, color: Colors.white),)
    );
  }
}
