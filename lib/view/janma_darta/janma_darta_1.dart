import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validation/form_validation.dart';
import 'package:intl/intl.dart';
import 'package:janma_darta/common%20widget/custom_button.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;
import '../../common widget/custom_search_dropdown.dart';
import '../../common widget/custom_textfield.dart';
import '../../common widget/toast_alert.dart';
import '../../constant/text_styles.dart';
class JanmaDarta1 extends StatefulWidget {
  const JanmaDarta1({super.key});

  @override
  State<JanmaDarta1> createState() => _JanmaDarta1State();
}

class _JanmaDarta1State extends State<JanmaDarta1> {
  final _formKey = GlobalKey<FormBuilderState>();

  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('साक्षीको विवरण', style: TextStyles.labelStyle1),
      ),
      body: FormBuilder(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
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
              labelText: 'वडा न.',
              hintText: 'वडा न.',
              items: ['1', '2', '3', '4', '5','6','7','8'],
              validator: (item) {
                if (item == null) {
                  return "This field is required";
                } else {
                  return null;
                }
              },
            ),
            CustomTextField(
              labelText: 'सडक मार्ग',
              hintText: 'सडक मार्ग',
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
            CustomTextField(
              labelText: 'गाउँ/टोल',
              hintText: 'गाउँ/टोल',
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
            CustomTextField(
              labelText: 'घर न.',
              hintText: 'घर न.',
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
            CustomTextField(
              labelText: 'जन्मेको देश',
              hintText: 'जन्मेको देश',
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
            CustomTextField(
              labelText: 'नागरिता देश',
              hintText: 'नागरिता देश',
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
            CustomTextField(
              labelText: 'नागरिता न.',
              hintText: 'नागरिता न.',
              name: '',
              keyboardType: TextInputType.number,
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
            CustomTextField(
              controller: dateController,
              labelText: 'जारी मिति',
              hintText: 'yyyy-MM-dd',
              enabled: false,
              name: 'applied_date',
              keyboardType: TextInputType.text,
              onTap:()async {
                picker.NepaliDateTime? _selectedDateTime = await picker.showMaterialDatePicker(
                  context: context,
                  initialDate: NepaliDateTime.now(),
                  firstDate: NepaliDateTime(1999),
                  lastDate: NepaliDateTime(2100),
                  initialDatePickerMode: DatePickerMode.day,
                );
                if(_selectedDateTime!=null){
                  dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDateTime);
                }
              },
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
            CustomButtons(
                onPressed: () {
                  _formKey.currentState!.save();
                  FocusScope.of(context).unfocus();
                  if(_formKey.currentState!.saveAndValidate()){
                    print('validated');
                  }else{
                    Toasts.showFormFailure('केही फिल्डहरू भरिएका छैनन्');
                  }
                },
                text: 'Submit')
          ],
        ),
      ),
    );
  }
}
