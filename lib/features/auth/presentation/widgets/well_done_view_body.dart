import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WellDoneViewBody extends StatelessWidget {
  const WellDoneViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 88.h),
        Image.asset(
          AppAssets.hand,
          height: 286.h,
          width: 286.w,
        ),
        SizedBox(height: 57.h),
        SizedBox(
          width: 351.w,
          height: 158.h,
          child: Column(
            children: [
              Text(
                'Well done!\n You are ready'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Futura LT Condensed Extra Bold',
                  color: AppColors.black3Color,
                  fontWeight: FontWeight.w700,
                  fontSize: 50.sp,
                  letterSpacing: -2.sp,
                  height: 1.16.h,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 166.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'layout-screen'),
              child: Container(
                width: 353.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(50.sp),
                ),
                child: Center(
                  child: Text(
                    'Take me Home',
                    style: AppFonts.bodyLargeBold.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
