import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMemberOnly extends StatelessWidget {
  const CustomMemberOnly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.25.w,
      height: 18.h,
      decoration: BoxDecoration(
        color: AppColors.mint2GreenColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(7.w),
          topLeft: Radius.circular(7.w),
        ),
      ),
      child: Center(
        child: Text(
          'Medlem pris',
          style: GoogleFonts.inter(
            color: AppColors.black8Color,
            height: 1.h,
            fontWeight: FontWeight.w500,
            fontSize: 11.sp,
          ),
        ),
      ),
    );
  }
}
