import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationAnEmailWidget extends StatelessWidget {
  const VerificationAnEmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCache.getBoolean(key: CacheKeys.emailVerified, defaultValue: true) == true ? Container() : Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.w),
          width: 353.w,
          height: 34.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            border: Border.all(
              width: 1.4.w,
              color: AppColors.primaryColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.checkVerifiedIcon),
              SizedBox(width: 5.w),
              Text(
                'Verify your E-mail',
                style: GoogleFonts.darkerGrotesque(
                  color: AppColors.primaryColor,
                  height: 1.h,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 18.h),
      ],
    );
  }
}
