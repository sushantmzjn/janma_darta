import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validation/form_validation.dart';

import '../constant/text_styles.dart';
class CustomsDropDowns extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final String? errorText;
  final String hint;
  final String name;
  final void Function(String?)? onChanged;


  CustomsDropDowns({
    required this.items,
    this.errorText,
    required this.hint,
    required this.name,
    this.onChanged,


  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 8.w),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12),
          child: FormBuilderDropdown<String>(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            valueTransformer: (val)=> val?.toString(),
            name: name,
            style: TextStyles.labelTextStyle,
            decoration: InputDecoration(
              isDense: true,
              hintText: hint,
              hintStyle: TextStyles.labelTextStyle,
              border: InputBorder.none
            ),
            validator: (value) {
              final validator = Validator(
                  validators: [
                    const RequiredValidator(),
                  ]
              );
              return validator.validate(
                label: 'This field',
                value: value,
              );
            },
            items: items,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
