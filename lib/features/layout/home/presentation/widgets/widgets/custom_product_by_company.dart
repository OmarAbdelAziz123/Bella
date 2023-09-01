import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductByCompany extends StatelessWidget {
  String priceDecreasePercentage,
      imageLink,
      productName,
      productDescription,
      unit, campaign_type;

  double oldPrice, newPrice;

  void Function()? onTapInProduct;
  void Function()? onTapAddToCart;

  Widget widget;
  Color buttonColor;

  CustomProductByCompany({
    Key? key,
    required this.priceDecreasePercentage,
    required this.imageLink,
    required this.productName,
    required this.productDescription,
    required this.oldPrice,
    required this.newPrice,
    required this.unit,
    required this.campaign_type,
    required this.onTapInProduct,
    required this.onTapAddToCart,
    required this.widget,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapInProduct,
      child: Container(
        width: 170.w,
        height: 261.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 170.w,
              height: 180.h,
              decoration: BoxDecoration(
                // color: AppColors.whiteColor,
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10.h,
                    left: 10.5.w,
                    child: Container(
                      width: 77.25.w,
                      height: 18.h,
                      padding: EdgeInsets.symmetric(horizontal: 7.62.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.r),
                        color: AppColors.newColor,
                      ),
                      child: Center(
                        child: Text(
                          campaign_type,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.productTag,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    right: 9.75.w,
                    child: Container(
                      width: 42.25.w,
                      height: 18.h,
                      decoration: BoxDecoration(
                        color: AppColors.grey16Color,
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      child: Center(
                        child: Text(
                          // product.priceDecreasePercentage!,
                          priceDecreasePercentage,
                          style: AppFonts.productTag,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 28.h,
                    bottom: 27.h,
                    left: 23.w,
                    right: 22.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.r),
                      child: AppConstants.showNetworkImage(
                        // image: product.imageLink!,
                        image: imageLink,
                        width: 125.w,
                        height: 125.h,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10.2.w,
                    bottom: 5.2.h,
                    child: GestureDetector(
                      onTap: onTapAddToCart,
                      child: Container(
                        width: 35.6.w,
                        height: 35.6.h,
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
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 12.h),
              height: 48.h,
              width: 146.w,
              child: Column(
                children: [
                  Container(
                    width: 146.w,
                    // height: 31.h,
                    child: Text(
                      productName,
                      // product.name!,
                      overflow: TextOverflow.ellipsis,
                      style: AppFonts.productName.copyWith(
                        color: AppColors.black7Color,
                      ),
                    ),
                  ),
                  Container(
                    width: 146.w,
                    // height: 31.h,
                    child: Text(
                      productDescription,
                      // product.description!,
                      overflow: TextOverflow.ellipsis,
                      style: AppFonts.productName.copyWith(
                        color: AppColors.black7Color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 11.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // '${product.oldPrice!.price} ${product.oldPrice!.unit ?? 'kr'}',
                  '$oldPrice ${unit ?? 'kr'}',
                  style: AppFonts.strickedText.copyWith(
                    color: AppColors.grey9Color,
                    fontSize: 12.sp,
                    height: 1.h,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Text(
                      '$newPrice ${unit ?? 'kr'}',
                      style: AppFonts.productPrice.copyWith(
                        color: AppColors.error2Color,
                        height: 1.h,
                        letterSpacing: -1.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
