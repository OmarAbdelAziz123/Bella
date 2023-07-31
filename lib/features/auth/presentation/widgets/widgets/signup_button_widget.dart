// ignore_for_file: must_be_immutable

import 'package:bella/features/auth/presentation/widgets/check_view_body.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupButtonWidget extends StatelessWidget {
  void Function()? onTap;
  final String text;

  SignupButtonWidget({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.82,
        height: size.height / 15.4,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 0.5.w,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.darkerGrotesque(
                height: 0.11.h,
                color: AppColors.primaryColor,
                fontSize: 14.4.sp,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              textScaleFactor: ScaleSize.textScaleFactor(context),
            ),
          ],
        ),
      ),
    );
  }
}
