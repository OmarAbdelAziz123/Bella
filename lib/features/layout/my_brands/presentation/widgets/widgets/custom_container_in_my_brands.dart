// ignore_for_file: must_be_immutable
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerInMyBrands extends StatelessWidget {
  final String image, text;
  void Function()? onTap;

  CustomContainerInMyBrands({
    Key? key,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: 110.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.08),
              spreadRadius: 0,
              blurRadius: 4.r,
              offset: const Offset(1, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 45.h,
              height: 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.r,
                    color: AppColors.blackColor.withOpacity(0.14),
                    offset: const Offset(0, 0.66),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
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
            SizedBox(height: 12.h),
            SizedBox(
              width: 96.w,
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppFonts.capsolButton.copyWith(
                  letterSpacing: -0.2,
                  height: 1.h,
                ),
              ),
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
