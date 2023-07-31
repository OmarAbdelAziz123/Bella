import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidgetInSeeAllScreen extends StatelessWidget {
  const SearchBarWidgetInSeeAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.8,
            blurRadius: 10,
            offset: const Offset(0.8, 0.8),
          ),
        ],
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        style: GoogleFonts.darkerGrotesque(
            fontSize: 15.sp,
            height: 1.2,
            color: AppColors.black3Color,
            fontWeight: FontWeight.w600),
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
          hintText: 'Search product or store',
          hintStyle: GoogleFonts.darkerGrotesque(
            height: 1.h,
            color: const Color(0xFF2C334F).withOpacity(0.6),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(vertical: 13.h),
            child: SvgPicture.asset(AppAssets.searchIcon, width:18.w, height: 18.h, ),
          ),
        ),
      ),
    );
  }
}