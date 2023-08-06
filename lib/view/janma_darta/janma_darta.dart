import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validation/form_validation.dart';
import 'package:janma_darta/common%20widget/custom_textfield.dart';

import '../../common widget/custom_search_dropdown.dart';
import '../../constant/text_styles.dart';
class JanmaDarta extends StatefulWidget {
  const JanmaDarta({super.key});

  @override
  State<JanmaDarta> createState() => _JanmaDartaState();
}

class _JanmaDartaState extends State<JanmaDarta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('जन्मको बिवरण', style: TextStyles.labelStyle1,),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        children: [
          CustomTextField(
            labelText: 'पुरा नाम',
            hintText: 'पुरा नाम',
            name: '',
            keyboardType: TextInputType.text,
            validator: (val){
              final validator = Validator(
                  validators: [ const RequiredValidator() ]
              );
              return validator.validate(
                label: 'This field',
                value: val,
              );
            },
          ),
          CustomSearchDropDown(
            labelText: 'जन्म स्थान',
            hintText: 'जन्म स्थान',
            items: ['House', 'Hospital', 'Others',],
            validator: (item) {
              if (item == null) {
                return "This field is required";
              } else {
                return null;
              }
            },
          ),
          CustomSearchDropDown(
            labelText: 'जन्म साहायक',
            hintText: 'जन्म साहायक',
            items: ['Family', 'Nurse', 'Worker', 'Doctor', 'Other'],
            validator: (item) {
              if (item == null) {
                return "This field is required";
              } else {
                return null;
              }
            },
          ),
          CustomSearchDropDown(
            labelText: 'लिङ्ग',
            hintText: 'लिङ्ग',
            items: ['Male', 'Female', 'Other',],
            validator: (item) {
              if (item == null) {
                return "This field is required";
              } else {
                return null;
              }
            },
          ),
          CustomSearchDropDown(
            labelText: 'जन्म प्रकार',
            hintText: 'जन्म प्रकार',
            items: ['Male', 'Female', 'Other',],
            validator: (item) {
              if (item == null) {
                return "This field is required";
              } else {
                return null;
              }
            },
          )
        ],
      )
    );
  }
}
