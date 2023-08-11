import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors.dart';
import '../constant/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String name;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  bool enabled;
  void Function()? onTap;
  TextEditingController? controller;
  bool obscureText;
  Widget? suffixIcon;
  void Function(String?)? onChanged;

  CustomTextField({
    required this.labelText,
    required this.hintText,
    required this.name,
    required this.keyboardType,
    required this.validator,
    this.enabled = true,
    this.onTap,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.w),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: mediumWhite,width: 1.h)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   Text(labelText, style: TextStyles.labelTextStyle,),
                   Text(' *', style: TextStyles.starLabelTextStyle)
                ],
              ),
              FormBuilderTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: controller,
                obscureText: obscureText,
                name: name,
                onChanged: onChanged,
                textInputAction: TextInputAction.next,
                keyboardType:keyboardType,
                validator: validator,
                enabled: enabled,
                cursorColor: Colors.black,
                style: TextStyles.labelTextStyle,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 12.sp,
                    color: Colors.grey.withOpacity(0.8),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1
                  ),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
