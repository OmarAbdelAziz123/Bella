// ignore_for_file: must_be_immutable

import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  void Function()? onTap;
  final double width;
  final Widget widget;

  CustomButton(
      {Key? key,
      required this.widget,
      required this.width,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(50.sp),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget,
          ],
        ),
      ),
    );
  }
}

class CustomButtonOutlined extends StatelessWidget {
  void Function()? onTap;
  final double width;
  final Widget widget;
  final Color color;

  CustomButtonOutlined({
    Key? key,
    required this.widget,
    required this.width,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 50.h,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2.5.w,
          ),
          borderRadius: BorderRadius.circular(50.sp),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget,
          ],
        ),
      ),
    );
  }
}
