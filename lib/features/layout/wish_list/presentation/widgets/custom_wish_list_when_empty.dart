import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWishListWhenEmpty extends StatelessWidget {
  const CustomWishListWhenEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 38.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 38.h),
              child: Text(
                'Wishlist',
                style: AppFonts.titleScreen.copyWith(
                  height: 1.h,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 229.w,
                height: 229.h,
                margin: EdgeInsets.only(top: 41.h, bottom: 24.h),
                child: Image.asset(
                  AppAssets.icon2,
                  height: 229.h,
                  width: 229.w,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Text(
                'No Item found yet',
                textAlign: TextAlign.center,
                style: AppFonts.titleSection.copyWith(
                  color: AppColors.blackColor,
                  height: 1.h,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: Text(
                'You can find all item you added here',
                textAlign: TextAlign.center,
                style: AppFonts.bodyLarge.copyWith(
                  color: AppColors.blackColor,
                  height: 1.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
