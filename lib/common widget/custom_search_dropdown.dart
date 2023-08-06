import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/colors.dart';
import '../constant/text_styles.dart';


class CustomSearchDropDown<T> extends StatelessWidget {
  final String labelText;
  final String hintText;
  void Function(T?)? onChanged;
  String Function(T)? itemAsString;
  Future<List<T>> Function(String)? asyncItems;
  String? Function(T?)? validator;
  bool enabled;
  List<T>? items;

  CustomSearchDropDown({
    required this.labelText,
    required this.hintText,
    this.asyncItems,
    this.onChanged,
    this.itemAsString,
    this.validator,
    this.enabled = true,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: mediumWhite, width: 1.h)
        ),
        child: DropdownSearch<T>(
          enabled: enabled,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: TextStyles.labelTextStyle,
              dropdownSearchDecoration: InputDecoration(
                border: InputBorder.none,
                errorStyle: TextStyle(height: 2),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                labelText: labelText,
                hintText: hintText,
                labelStyle: TextStyles.labelTextStyle,
                hintStyle: TextStyles.labelTextStyle,
              )),
          asyncItems: asyncItems,
          onChanged: onChanged,
          itemAsString: itemAsString,
          validator: validator,
          items: items!,
        ),
      ),
    );
  }
}
