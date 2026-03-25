import 'package:flutter/material.dart';
import 'package:ride_sharing/constant/app_constant.dart';

import '../constant/app_colors.dart';

class CommonTextStyle {

  static TextStyle commonTextStyle({double? fontSize, FontWeight? fontWeight, Color? color}) => TextStyle(
    color: color??AppColors.instance.textColor,
    fontSize: fontSize??16,
    fontWeight: fontWeight??FontWeight.w400,
    fontFamily: AppConstant.instance.font
  );
}