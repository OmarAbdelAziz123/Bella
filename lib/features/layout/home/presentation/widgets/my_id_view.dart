import 'package:bella/features/layout/home/presentation/profie_view.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyIDView extends StatelessWidget {
  const MyIDView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 54.h),
              Container(
                height: 560,
                width: 353,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Column(
                      children: [
                        Image.asset(
                          AppAssets.qrCode2,
                          width: 228.w,
                          height: 226.h,
                        ),
                        SizedBox(height: 18.h),
                        Text(
                          'Mark AL-Jumaily',
                          style: AppFonts.titleSubsection.copyWith(
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            AppAssets.arroww,
                            height: 24.h,
                            width: 24.w,
                          ),
                          SvgPicture.asset(
                            AppAssets.infoCircle4,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      navigatePop(context);
                    },
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
        ),
      ),
    );
  }

  void navigatePop(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const ProfileView(),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}
