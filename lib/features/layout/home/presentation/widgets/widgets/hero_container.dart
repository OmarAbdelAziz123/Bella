// ignore_for_file: must_be_immutable
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeroContainer extends StatelessWidget {
  Widget logoWidget;
  String dateText, displayName;
  HeroContainer({Key? key, required this.logoWidget, required this.dateText, required this.displayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 353.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 12.w,
                top: 14.h,
                bottom: 14.h,
                right: 4.w),
            child: GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: logoWidget,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Padding(
            padding:
            EdgeInsets.symmetric(vertical: 8.5.h),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dateText,
                  style: AppFonts.date,
                ),
                Text(
                  displayName,
                  style: AppFonts.bodyLargeBold,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              right: 12.w,
              top: 17.h,
              bottom: 17.h,
            ),
            child: SvgPicture.asset(AppAssets.checkRight),
          ),
        ],
      ),
    );
  }
}
