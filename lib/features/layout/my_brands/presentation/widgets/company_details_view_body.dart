import 'package:bella/features/layout/home/presentation/widgets/products_in_company_screen.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_member_only.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_recommended_products.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/hero_container.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanyDetailsViewBody extends StatefulWidget {
  const CompanyDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<CompanyDetailsViewBody> createState() => _CompanyDetailsViewBodyState();
}

class _CompanyDetailsViewBodyState extends State<CompanyDetailsViewBody> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 23.w),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: Image.asset(
                  AppAssets.starbucks,
                  height: 64.h,
                  width: 64.w,
                ),
              ),
              SizedBox(width: 146.w),
              Image.asset(AppAssets.drop2, width: 135.w, height: 32.h),
            ],
          ),
        ),
        SizedBox(width: 19.w),
        Image.asset(
          AppAssets.reward,
          height: 177.h,
          width: 393.w,
        ),
        SizedBox(height: 25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomContainerInProductsInCompanyScreen(
              text: 'Personal \n Offers',
              icon: AppAssets.personalOffers,
              borderColor: selectedItem == 0
                  ? AppColors.primaryColor
                  : AppColors.grey3Color,
              onTap: () {
                setState(() {
                  selectedItem = 0;
                });
              },
            ),
            SizedBox(width: 12.w),
            CustomContainerInProductsInCompanyScreen(
              text: 'Coupons',
              icon: AppAssets.cupones,
              borderColor: selectedItem == 1
                  ? AppColors.primaryColor
                  : AppColors.grey3Color,
              onTap: () {
                setState(() {
                  selectedItem = 1;
                });
              },
            ),
            SizedBox(width: 12.w),
            CustomContainerInProductsInCompanyScreen(
              text: 'Rewards',
              icon: AppAssets.reward,
              borderColor: selectedItem == 2
                  ? AppColors.primaryColor
                  : AppColors.grey3Color,
              onTap: () {
                setState(() {
                  selectedItem = 2;
                });
              },
            ),
            SizedBox(width: 12.w),
            CustomContainerInProductsInCompanyScreen(
              text: 'Receipts',
              icon: AppAssets.personalOffers,
              borderColor: selectedItem == 3
                  ? AppColors.primaryColor
                  : AppColors.grey3Color,
              onTap: () {
                setState(() {
                  selectedItem = 3;
                });
              },
            ),
          ],
        ),
        // CustomRecommendedProducts(
        //   logoOfCompany: AppAssets.starbucks,
        //   imageOfProduct: AppAssets.img1,
        //   title: 'Holiday Blend',
        //   description: 'Roast',
        //   currency: 'kr',
        //   regularPrice: 170,
        //   salePrice: 120,
        //   onTap: () {},
        //   customMemberOnly: const CustomMemberOnly(),
        //   onTapAddToCart: () {},
        //   widget: SvgPicture.asset(
        //     AppAssets.add,
        //     width: 12.46.w,
        //     height: 12.46.h,
        //     color: AppColors.primaryColor,
        //   ),
        //   buttonColor: AppColors.whiteColor,
        // ),
        Container(
          height: 284.h,
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
                      child: const CustomMemberOnly(),
                    ),
                    Positioned(
                      top: 19.h,
                      // bottom: 19.h,
                      right: 14.w,
                      left: 14.w,
                      child: Image.asset(
                        AppAssets.starbucks,
                        width: 142.h,
                        height: 142.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 5.h,
                      right: 5.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.r),
                        child: Image.asset(
                          AppAssets.img1,
                          width: 35.h,
                          height: 35.h,
                          fit: BoxFit.cover,
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
                      onTap: () {},
                      child: Container(
                        width: 30.18,
                        height: 30.18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.sp),
                          color: AppColors.primaryColor,
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
                          // horizontal: 7.w,
                          vertical: 8.4.w,
                        ),
                        child: widget,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 12.h,
                        // bottom: 2.h,
                        left: 12.w,
                        right: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 146.w,
                          child: Text(
                            'Holiday Blend',
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
                            'Roast',
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
                              '170 kr',
                              // style: GoogleFonts.inter(
                              //   color: AppColors.grey9Color,
                              //   decoration: TextDecoration.lineThrough,
                              //   height: 1.h,
                              //   fontWeight: FontWeight.w400,
                              //   fontSize: 12.sp,
                              // ),
                              style: AppFonts.strickedText.copyWith(
                                color: AppColors.grey9Color,
                                fontSize: 12.sp,
                                height: 1.h,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              '120 kr',
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
      ],
    );
  }
}
