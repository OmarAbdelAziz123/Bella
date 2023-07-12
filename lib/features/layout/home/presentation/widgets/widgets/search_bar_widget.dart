import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  Widget? suffixIcon;

  SearchBarWidget({Key? key, required this.hintText, this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 353.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        style: AppFonts.titleSubsection.copyWith(
          color: AppColors.black3Color,
          fontSize: 15.sp,
          height: 1.2.h,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0.001.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(
              color: AppColors.whiteColor.withOpacity(0.9),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(
              color: AppColors.whiteColor.withOpacity(0.9),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(
              color: AppColors.whiteColor.withOpacity(0.9),
            ),
          ),
          filled: true,
          fillColor: AppColors.whiteColor.withOpacity(0.9),
          hintText: hintText,
          hintStyle: AppFonts.bodyLarge.copyWith(
            color: const Color(0xFF2C334F).withOpacity(0.6),
          ),
          prefixIcon: Container(
            padding: EdgeInsets.only(
              right: 11.w,
              left: 15.w,
              top: 15.h,
              bottom: 16.h,
            ),
            child: SvgPicture.asset(
              AppAssets.searchIcon,
              color: AppColors.grey10Color,
              width: 18.w,
              height: 18.h,
            ),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
