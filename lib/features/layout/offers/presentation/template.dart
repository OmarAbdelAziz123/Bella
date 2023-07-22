import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Template extends StatelessWidget {
  final Color bgColor;
  final String companyLogo, precentageNumber, title;
  final Widget widgetInCenter;
  void Function()? onCloseTap;

  Template({
    Key? key,
    required this.bgColor,
    required this.companyLogo,
    required this.widgetInCenter,
    required this.precentageNumber,
    required this.title,
    required this.onCloseTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          SizedBox(height: 80.h),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 353.w,
                height: 600.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.w, right: 39.w, top: 41.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            AppAssets.arroww,
                            height: 24.h,
                            width: 24.w,
                          ),
                          Text(
                            'Starbucks',
                            style: AppFonts.bodyLargeBold,
                          ),
                          SvgPicture.asset(
                            AppAssets.infoCircle4,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 37.h),
                    Align(
                      alignment: Alignment.center,
                      child: widgetInCenter,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 81.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            precentageNumber,
                            style: AppFonts.titleScreen,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: AppFonts.titleSubsection,
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
              Positioned(
                top: -35.h,
                left: 50.5,
                right: 50,
                child: Image.asset(
                  companyLogo,
                  height: 64.h,
                  width: 64.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onCloseTap,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 28.w,
                    right: 24.h,
                    top: 24.h,
                    bottom: 24.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(300.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.close,
                        height: 12.h,
                        width: 12.w,
                        color: AppColors.blackColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Close',
                        style: AppFonts.bodyLargeBold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
