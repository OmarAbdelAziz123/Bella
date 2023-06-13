import 'package:bella/utils/constants/app_assets.dart';
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

  FieldContainerWidget({
    Key? key,
    required this.image,
    required this.headText,
    required this.subText,
    required this.onTap,
    required this.onTapInLogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      margin: EdgeInsets.only(top: 0.h, bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.5.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 1),
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
              child: Image.network(
                image,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    AppAssets.notFound,
                    height: 45.h,
                    width: 45.w,
                    fit: BoxFit.cover,
                  );
                },
                height: 45.h,
                width: 45.w,
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
                style: GoogleFonts.darkerGrotesque(
                  height: 1.h,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: AppColors.black3Color,
                ),
              ),
              Text(
                subText,
                style: GoogleFonts.darkerGrotesque(
                  height: 1.h,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.grey2Color.withOpacity(0.6),
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 28.h,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.sp),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1.2.w,
                ),
              ),
              child: Center(
                child: Text(
                  'Join',
                  style: GoogleFonts.darkerGrotesque(
                    height: 1.h,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
