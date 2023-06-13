import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final String preffixText;
  const TextFormFieldWidget(this.hintText, this.preffixText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      style: TextStyle(fontSize: 14.sp, color: AppColors.black3Color),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor.withOpacity(0.9),
        hintText: hintText,
        hintStyle: GoogleFonts.darkerGrotesque(
          color: AppColors.greyColor,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Text(preffixText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: AppColors.greyColor,
            width: 1.sp,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: AppColors.greyColor,
            width: 1.sp,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 1.sp,
          ),
        ),
      ),
    );
  }
}
