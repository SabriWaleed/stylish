import 'package:ecommerce_project/Core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyle {
  static TextStyle montserratExtraBold24w800 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.secondaryColor,
  );
  static TextStyle montserratSemiBold14w600 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );
  static TextStyle montserratSemiBold18w600 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
  static TextStyle montserrat12w400 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );
  static TextStyle montserratRegular14w400 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
  static TextStyle montserratMedium12w500 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textMuted,
  );
  static TextStyle montserratSemiBold20w600 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static TextStyle montserratHintTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textHint,
  );
}
