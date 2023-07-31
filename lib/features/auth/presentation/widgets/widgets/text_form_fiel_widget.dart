import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final String preffixText;
  const TextFormFieldWidget(this.hintText, this.preffixText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      style: AppFonts.bodyDefault.copyWith(
        color: AppColors.black2Color,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor.withOpacity(0.9),
        hintText: hintText,
        hintStyle: AppFonts.bodyDefault.copyWith(
          color: AppColors.black2Color,
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
