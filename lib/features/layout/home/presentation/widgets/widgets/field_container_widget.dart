// ignore_for_file: must_be_immutable

import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldContainerWidget extends StatelessWidget {
  final String image;
  final String headText;
  final String subText;
  void Function()? onTap;
  void Function()? onTapInLogo;
  void Function()? onTapInAnyPlaceInCustomRecommendedCompany;

  FieldContainerWidget({
    Key? key,
    required this.image,
    required this.headText,
    required this.subText,
    required this.onTap,
    required this.onTapInLogo,
    required this.onTapInAnyPlaceInCustomRecommendedCompany,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapInAnyPlaceInCustomRecommendedCompany,
      child: Container(
        height: 70.h,
        margin: EdgeInsets.only(top: 0.h, bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.5.h),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: AppColors.white2Color,
              spreadRadius: 0.5,
              blurRadius: 0.5,
              offset: Offset(0, 1),
            ),
          ],
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: onTapInLogo,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: AppConstants.showNetworkImage(
                  image: image,
                  width: 45.h,
                  height: 45.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  headText,
                  style: AppFonts.bodyLargeBold,
                ),
                Text(
                  subText,
                  style: AppFonts.bodyDefault.copyWith(
                    color: AppColors.white3Color.withOpacity(0.80),
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 29.h,
                width: 53.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(300.r),
                ),
                child: Center(
                  child: Text(
                    'Join',
                    style: AppFonts.joinText.copyWith(
                      color: AppColors.whiteColor,
                      height: 1.1.h,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
