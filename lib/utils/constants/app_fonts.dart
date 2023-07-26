import 'dart:ui';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFonts {
  static final TextStyle display = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 50.sp,
    letterSpacing: -3.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle titleScreen = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 30.sp,
    letterSpacing: -2.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle titleSection = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 26.sp,
    letterSpacing: -1.5.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle titleSubsection = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 22.sp,
    letterSpacing: -1.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle titleBody = AppConstants.getTextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
    letterSpacing: -0.75.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle bodyLarge = AppConstants.getTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    letterSpacing: -0.5.sp,
    height: 1.5.h,
    color: AppColors.black3Color,
  );

  static final TextStyle bodyLargeBold = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    letterSpacing: 0.005.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle productName = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    letterSpacing: -0.03.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle bodyDefault = AppConstants.getTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    letterSpacing: 1.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle linkLarge = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 22.sp,
    letterSpacing: 0.125.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle linkDefault = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    letterSpacing: 0.125.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle strickedText = AppConstants.getTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    letterSpacing: -0.04.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle bodySmallBold = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
    letterSpacing: 0.01.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle date = AppConstants.getTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    letterSpacing: -0.0005.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle cardPrice = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 27.sp,
    letterSpacing: -2.sp,
    height: 1.h,
    color: AppColors.primaryColor,
  );

  static final TextStyle productPrice = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    letterSpacing: -4.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle capsolButton = AppConstants.getTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    letterSpacing: 0.sp,
    height: 0,
    color: AppColors.black3Color,
  );

  static final TextStyle textInPip = AppConstants.getTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24.sp,
    letterSpacing: 0.sp,
    height: 0.h,
    color: AppColors.blackColor,
  );

  static final TextStyle joinText = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13.sp,
    letterSpacing: 0.sp,
    height: 0.h,
    color: AppColors.blackColor,
  );

  static final TextStyle productTag = AppConstants.getTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11.sp,
    letterSpacing: 0.sp,
    height: 0.h,
    color: AppColors.blackColor,
  );

  static final TextStyle productNameBig = AppConstants.getTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    letterSpacing: 0.sp,
    height: 0.h,
    color: AppColors.blackColor,
  );

  static final TextStyle strickedTextBig = AppConstants.getTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    letterSpacing: 0.sp,
    height: 0.h,
    color: AppColors.blackColor,
  );

  static final TextStyle warningText = AppConstants.getTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    letterSpacing: 0.sp,
    height: 0.h,
    color: AppColors.blackColor,
  );

  static final TextStyle smallCapslook = AppConstants.getTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    letterSpacing: 0.sp,
    height: 0.h,
    color: AppColors.blackColor,
  );

  static final TextStyle cardNumber = AppConstants.getTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    letterSpacing: 0.sp,
    height: 0.h,
    color: AppColors.blackColor,
  );
}
