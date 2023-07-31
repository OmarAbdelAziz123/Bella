// ignore_for_file: must_be_immutable
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRecommendedProducts extends StatelessWidget {
  final dynamic logoOfCompany, imageOfProduct, title, description, currency;
  final dynamic regularPrice, salePrice;
  void Function()? onTap;
  Widget customMemberOnly;
  void Function()? onTapAddToCart;
  Widget widget;
  Color buttonColor;

  CustomRecommendedProducts({
    Key? key,
    required this.logoOfCompany,
    required this.imageOfProduct,
    required this.title,
    required this.description,
    required this.currency,
    required this.regularPrice,
    required this.salePrice,
    required this.onTap,
    required this.customMemberOnly,
    required this.onTapAddToCart,
    required this.widget,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 281.h,
        width: 170.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.08),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(1, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 170.w,
              height: 180.h,
              decoration: BoxDecoration(
                color: AppColors.bg2Color,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 2.h,
                    right: 44.75.w,
                    left: 45.w,
                    child: customMemberOnly,
                  ),
                  Positioned(
                    top: 19.h,
                    // bottom: 19.h,
                    right: 14.w,
                    left: 14.w,
                    child: AppConstants.showNetworkImage(
                      image: imageOfProduct,
                      width: 142.h,
                      height: 142.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 5.h,
                    right: 5.w,
                    child: Container(
                      width: 35.h,
                      height: 35.h,
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
                        child: AppConstants.showNetworkImage(
                          image: logoOfCompany,
                          width: 35.w,
                          height: 35.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Positioned(
                  bottom: 10.2.h,
                  right: 10.2.w,
                  child: GestureDetector(
                    onTap: onTapAddToCart,
                    child: Container(
                      width: 30.18,
                      height: 30.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.sp),
                        color: buttonColor,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x4D8367F4),
                            offset: const Offset(1, 1),
                            blurRadius: 5.sp,
                            spreadRadius: 1.2,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 8.4.w,
                      ),
                      child: widget,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 12.h,
                    left: 12.w,
                    right: 12.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 146.w,
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.productName.copyWith(
                            color: AppColors.black7Color,
                            height: 1.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: 146.w,
                        child: Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.productName.copyWith(
                            color: AppColors.black7Color,
                            height: 1.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 11.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$regularPrice $currency',
                            style: AppFonts.strickedText.copyWith(
                              color: AppColors.grey9Color,
                              fontSize: 12.sp,
                              height: 1.h,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '$salePrice $currency',
                            style: AppFonts.productPrice.copyWith(
                              color: AppColors.black7Color,
                              height: 1.h,
                              letterSpacing: -1.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
