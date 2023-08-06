import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:janma_darta/common%20widget/custom_button.dart';
import 'package:janma_darta/constant/colors.dart';
import 'package:janma_darta/constant/text_styles.dart';

import 'janma_darta.dart';
import 'janma_darta_info_model/Janma_darta_info.dart';
class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('जन्म दर्ता', style: TextStyle(color: primaryColor,)),
        centerTitle: true,
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(height: 18.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
            child: Text('आवश्यक कागजातहरू',style: TextStyles.labelTextStyle,),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
              itemCount: info.length,
              itemBuilder: (ctx,index){
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 2.w,horizontal: 12.w),
                    child: Row(
                      children: [
                        Text('${index + 1}. ', style: TextStyles.labelTextStyle,),
                        Text(info[index].title, style: TextStyles.labelTextStyle),
                      ],
                    ));
          }),
          Table(
            border: TableBorder.all(),
            children: [

            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.w,horizontal: 10.w),
            child: CustomButtons(onPressed: (){Get.to(()=> JanmaDarta());}, text: 'जन्म दर्ता फारममा जानुहोस'),
          )
        ],
      )
    );
  }
}
