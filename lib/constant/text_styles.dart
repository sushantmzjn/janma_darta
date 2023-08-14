import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';
import 'font_styles.dart';



class FontSizes {
  static final s10 = 10.sp;
  static final s12 = 12.7.sp;
  static final s13 = 13.sp;
  static final s14 = 14.sp;
  static final s15 = 15.sp;
  static final s16 = 16.sp;
  static final s17 = 17.sp;
  static final s18 = 18.sp;
  static final s19 = 19.sp;
  static final s20 = 20.sp;
}

class TextStyles {

  static TextStyle appBarStyle =  TextStyle(
  color: primaryColor,
  fontFamily: FontStyles.roboto,
  fontSize: FontSizes.s18,
  fontWeight: FontStyles.bold900,
  );

  static TextStyle tabBarStyle = TextStyle(
      color: whiteColor,
      fontFamily: FontStyles.poppins,
      fontWeight: FontStyles.medium400,
      fontSize: FontSizes.s14);

  static TextStyle tabBarStyle1 = TextStyle(
      color: tabBarColor,
      fontFamily: FontStyles.poppins,
      fontWeight: FontStyles.medium400,
      fontSize: FontSizes.s14);

  static TextStyle drawerStyle = TextStyle(
      color: whiteColor,
      fontFamily: FontStyles.roboto,
      fontWeight: FontStyles.mediumBold,
      fontSize: FontSizes.s16);

  static  TextStyle labelStyle1 = TextStyle(
      color: darkGrey,
      fontFamily: FontStyles.roboto,
      fontWeight: FontStyles.mediumBold,
      fontSize: FontSizes.s19);

  static TextStyle drawerStyle1 = TextStyle(
      color: blackColor,
      fontFamily: FontStyles.poppins,
      fontSize: FontSizes.s14);

  static TextStyle jStyle = TextStyle(
    color: greyColor,
    fontFamily: FontStyles.poppins,
    fontSize: FontSizes.s12,
     overflow: FontStyles.overFlow,
    fontWeight: FontStyles.mediumBold,
  );



  static TextStyle subTitleStyle =  TextStyle(
  fontSize: FontSizes.s12,
  fontFamily: FontStyles.poppins,
  fontWeight:  FontStyles.mediumBold,
  color: primaryColor,
  );


  static TextStyle accTextStyle = TextStyle(
      fontFamily: FontStyles.poppins,
      color: labelGrey,
      fontWeight: FontStyles.mediumBold,
      fontSize: FontSizes.s14
  );

  static TextStyle labelTextStyle = TextStyle(
      fontSize: FontSizes.s15,
      color: labelGrey.withOpacity(0.8),
      fontFamily: FontStyles.poppins,
      fontWeight: FontStyles.medium600
  );

  static TextStyle headTextStyle =
      TextStyle(fontFamily: FontStyles.roboto, fontWeight: FontStyles.bold900);
  static TextStyle headTextStyle1 =
  TextStyle(fontFamily: FontStyles.roboto, fontWeight: FontStyles.medium400);

  static TextStyle starLabelTextStyle = TextStyle(
    fontSize:FontSizes.s14,
    color: const Color(0xFFDA1414).withOpacity(0.8),
    fontFamily: FontStyles.source,
  );

  static TextStyle textFormStyle = TextStyle(
      fontWeight: FontStyles.medium600,
      fontFamily: FontStyles.poppins,
      color: labelBlack.withOpacity(0.8));

  static TextStyle hintStyle = TextStyle(
    fontSize: FontSizes.s14,
      fontFamily: FontStyles.poppins, color: labelBlack.withOpacity(0.8));

  static TextStyle timeStyle = TextStyle(
      fontFamily: FontStyles.poppins,
      fontWeight: FontStyles.medium400,
      fontSize: FontSizes.s13,
      color: lightGreyColor
  );
  static TextStyle infoStyle = TextStyle(
      fontFamily: FontStyles.poppins,
      fontWeight: FontStyles.medium400,
      fontSize: FontSizes.s14,
      color: lightGreyColor
  );

  static TextStyle detailStyle = TextStyle(
      fontFamily: FontStyles.poppins,
      fontWeight: FontStyles.medium600,
      fontSize: FontSizes.s16,
  color: labelBlack
  );

 static TextStyle tileTitle = TextStyle(
     color: textBlack,
     fontFamily: FontStyles.poppins,
  fontWeight: FontStyles.medium400,
  fontSize: FontSizes.s17
 );

}
