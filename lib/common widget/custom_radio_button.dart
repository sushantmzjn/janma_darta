import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validation/form_validation.dart';

import '../constant/colors.dart';
import '../constant/text_styles.dart';
class CustomRadioButton extends StatelessWidget {
  List<FormBuilderFieldOption<dynamic>> options;
  String name;
  String label;
  void Function(dynamic)? onChanged;

  CustomRadioButton({
    required this.options,
    required this.name,
    required this.label,
    this.onChanged
});


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        children: [
          FormBuilderRadioGroup(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            name: name,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                  color: labelColor,
                  fontFamily: 'ABeeZee'),
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            options: options,
            onChanged: onChanged,
            validator: (val){
              final validator = Validator(
                  validators: [
                    const RequiredValidator(),
                  ]
              );
              return validator.validate(
                label: 'This field',
                value: val,
              );
            },
          ),
        ],
      ),
    );
  }
}
