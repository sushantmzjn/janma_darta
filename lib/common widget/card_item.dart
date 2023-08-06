
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/text_styles.dart';

class CardItem extends StatelessWidget {
  final String text;
  Widget cardImage;
  void Function()? onTap;

  CardItem({required this.text, required this.cardImage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          alignment: Alignment.center,
          height: 120.h,
          width: 155.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cardImage,
              SizedBox(height: 10.h,),
              Text(text, textAlign: TextAlign.center, style: TextStyles.labelTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}

