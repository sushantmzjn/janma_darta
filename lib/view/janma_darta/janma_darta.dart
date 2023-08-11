import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validation/form_validation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:janma_darta/api.dart';
import 'package:janma_darta/common%20widget/custom_button.dart';
import 'package:janma_darta/common%20widget/custom_radio_button.dart';
import 'package:janma_darta/common%20widget/custom_textfield.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;
import '../../common widget/custom_search_dropdown.dart';
import '../../constant/text_styles.dart';
import '../../model/all_district_model/all_districts.dart';
import 'janma_darta_1.dart';
class JanmaDarta extends StatefulWidget {
  const JanmaDarta({super.key});

  @override
  State<JanmaDarta> createState() => _JanmaDartaState();
}

class _JanmaDartaState extends State<JanmaDarta> {
  TextEditingController dateController = TextEditingController();

  int? selectedDistrictId;
  int? selectedDistrictId1;
  final isDisableList = ['छ', 'छैन'];
  bool? isDisable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('जन्मको बिवरण', style: TextStyles.labelStyle1,),
      ),
      body: ListView(
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
            items: ['One', 'Twins', 'More than two',],
            validator: (item) {
              if (item == null) {
                return "This field is required";
              } else {
                return null;
              }
            },
          ),

          CustomSearchDropDown<Districts>(
              labelText: 'बाबु जारी जिल्ला',
              hintText: 'बाबु जारी जिल्ला',
            asyncItems: (String? filter) async {
              var response = await Dio().get(Api.getAllDistricts);
              var models = (response.data as List).map((e) => Districts.fromJson(e)).toList();
              return models;
            },
            itemAsString: (Districts? districts) => districts?.np_name ?? "",
            validator: (Districts? item) {
              if (item == null) {
                return "This field is required";
              } else {
                return null;
              }
            },
            onChanged: (Districts? district) {
              setState(() {
                selectedDistrictId = district!.id;
                print(selectedDistrictId);
              });
            },
            items: [],
          ),

          CustomSearchDropDown<Districts>(
              labelText: 'आमा जारी जिल्ला',
              hintText: 'आमा जारी जिल्ला',
            asyncItems: (String? filter) async {
              var response = await Dio().get(Api.getAllDistricts);
              var models = (response.data as List).map((e) => Districts.fromJson(e)).toList();
              return models;
            },
            itemAsString: (Districts? districts) => districts?.np_name ?? "",
            validator: (Districts? item) {
              if (item == null) {
                return "This field is required";
              } else {
                return null;
              }
            },
            onChanged: (Districts? district) {
              setState(() {
                selectedDistrictId1 = district!.id;
                print(selectedDistrictId1);
              });
            },
            items: [],
          ),
          CustomTextField(
            controller: dateController,
            labelText: 'जन्म मिति',
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
          CustomSearchDropDown(
            labelText: 'जातीय समूह',
            hintText: 'जातीय समूह',
            items: ['छेत्री', 'ब्रहामन्न', 'मगर', 'थारु', 'नेवार', 'तामाङ', 'यादव', 'राई', 'गुरुङ', 'ठकुरी', 'लिम्बु', 'अन्य' ],
            validator: (item) {
              if (item == null) {
                return "This field is required";
              } else {
                return null;
              }
            },
          ),
          CustomRadioButton(
            options: isDisableList.map((e) => FormBuilderFieldOption(
              value: e,
              child: Text(e),
            )).toList(),
            name: 'is disable',
            label: 'असक्षम',
            onChanged: (val){
              val = val == 'छ' ? true : val == 'छैन' ? false : val;
              isDisable = val;
              // print(isDisable);
            },
          ),
          CustomTextField(
            labelText: 'बिदेशी ठेगाना',
            hintText: 'बिदेशी ठेगाना',
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
            labelText: 'हजुर बुवाको नाम',
            hintText: 'हजुर बुवाको नाम',
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
            labelText: 'बुवाको नाम',
            hintText: 'बुवाको नाम',
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
            labelText: 'बुवाको नागरिकता न.',
            hintText: 'बुवाको नागरिकता न.',
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
            labelText: 'आमाको नाम',
            hintText: 'आमाको नाम',
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
            labelText: 'आमाको नागरिकता न.',
            hintText: 'आमाको नागरिकता न.',
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
          CustomButtons(onPressed: () {Get.to(()=> JanmaDarta1());}, text: 'Next',)
        ],
      )
    );
  }
}
