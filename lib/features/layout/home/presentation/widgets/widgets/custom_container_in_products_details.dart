import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerInProductDetails extends StatelessWidget {
  const CustomContainerInProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77.25.w,
      height: 18.h,
      decoration: BoxDecoration(
        color: AppColors.newColor,
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Center(
        child: Text(
          '2 for 200 kr',
          style: AppFonts.productTag.copyWith(
            color: AppColors.grey13Color,
          ),
        ),
      ),
    );
  }
}
