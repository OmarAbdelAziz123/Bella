// ignore_for_file: must_be_immutable
import 'package:bella/features/layout/offers/data/get_all_personal_offers_by_user_model.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Template extends StatelessWidget {
  final Color bgColor;
  final String companyLogo, precentageNumber, title;
  final Widget widgetInCenter;
  void Function()? onCloseTap;
  PersonalOffer personalOffer;

  Template({
    Key? key,
    required this.bgColor,
    required this.companyLogo,
    required this.widgetInCenter,
    required this.precentageNumber,
    required this.title,
    required this.onCloseTap,
    required this.personalOffer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          SizedBox(height: 80.h),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 353.w,
                height: personalOffer.type == 'discount_code' ? 582.h : 495.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 30.w, right: 39.w, top: 41.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            AppAssets.arroww,
                            height: 24.h,
                            width: 24.w,
                          ),
                          Text(
                            personalOffer.company!.displayName!,
                            style: AppFonts.bodyLargeBold,
                          ),
                          SvgPicture.asset(
                            AppAssets.infoCircle4,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        // width: 81.w,
                        constraints: BoxConstraints(
                          maxWidth: 140.w,
                          minWidth: 81.w,
                        ),
                        height: 42.h,
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            personalOffer.title!,
                            style: AppFonts.titleScreen,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.center,
                      // child: widgetInCenter,
                      child: personalOffer.type == 'discount_code'
                          ? Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  AppConstants.showNetworkImage(
                                    image: personalOffer.barcodeLink!,
                                    height: 124.h,
                                    width: 126.w,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 20.h),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 10.5.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.bgColor,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Text(
                                      personalOffer.value!.code!,
                                      style: AppFonts.productName,
                                    ),
                                  ),
                                  SizedBox(height: 7.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        AppAssets.copyIcon,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                      SizedBox(width: 12.w),
                                      Text(
                                        'Copy Code',
                                        style: AppFonts.productName,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 287.w,
                                        child: Text(
                                          personalOffer.description!,
                                          overflow: TextOverflow.clip,
                                          style: AppFonts.bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Container(
                                    width: 313.w,
                                    height: 90.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: AppColors.grey4Color,
                                    ),
                                    padding: EdgeInsets.only(
                                        top: 20.h, left: 20.w, right: 12.w),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppAssets.home_smile,
                                              height: 20.h,
                                              width: 20.w,
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              'Redemption: ${personalOffer.restrictions!.parseLocation()}',
                                              style: AppFonts.bodySmallBold,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppAssets.calendar_check,
                                              height: 20.h,
                                              width: 20.w,
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              'Expiry date: ${personalOffer.validTo}',
                                              style: AppFonts.bodySmallBold,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : personalOffer.type == 'bonus_check'
                              ? Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      AppConstants.showNetworkImage(
                                        image: personalOffer.barcodeLink!,
                                        height: 124.h,
                                        width: 126.w,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 287.w,
                                            child: Text(
                                              personalOffer.description!,
                                              overflow: TextOverflow.clip,
                                              style: AppFonts.bodyLarge,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Container(
                                        width: 313.w,
                                        height: 90.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          color: AppColors.grey4Color,
                                        ),
                                        padding: EdgeInsets.only(
                                            top: 20.h, left: 20.w, right: 12.w),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  AppAssets.home_smile,
                                                  height: 20.h,
                                                  width: 20.w,
                                                ),
                                                SizedBox(width: 10.w),
                                                Text(
                                                  'Redemption: ${personalOffer.restrictions!.parseLocation()}',
                                                  style: AppFonts.bodySmallBold,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  AppAssets.calendar_check,
                                                  height: 20.h,
                                                  width: 20.w,
                                                ),
                                                SizedBox(width: 10.w),
                                                Text(
                                                  'Expiry date: ${personalOffer.validTo}',
                                                  style: AppFonts.bodySmallBold,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : personalOffer.type == 'gift_card'
                                  ? Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        AppConstants.showNetworkImage(
                                          image: personalOffer.barcodeLink!,
                                          height: 124.h,
                                          width: 126.w,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        SizedBox(height: 20.h),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 287.w,
                                              child: Text(
                                                personalOffer.description!,
                                                overflow: TextOverflow.clip,
                                                style: AppFonts.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Container(
                                          width: 313.w,
                                          height: 90.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.r),
                                            color: AppColors.grey4Color,
                                          ),
                                          padding: EdgeInsets.only(
                                              top: 20.h, left: 20.w, right: 12.w),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    AppAssets.home_smile,
                                                    height: 20.h,
                                                    width: 20.w,
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  Text(
                                                    'Redemption: ${personalOffer.restrictions!.parseLocation()}',
                                                    style: AppFonts.bodySmallBold,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    AppAssets.calendar_check,
                                                    height: 20.h,
                                                    width: 20.w,
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  Text(
                                                    'Expiry date: ${personalOffer.validTo}',
                                                    style: AppFonts.bodySmallBold,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  : Container(
                                      color: AppColors.primaryColor,
                                      height: 10.h,
                                      width: 10.w,
                                    ),
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
              Positioned(
                top: -35.h,
                left: 144.w,
                right: 144.w,
                child: SizedBox(
                  height: 65.h,
                  width: 65.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.r),
                    child: AppConstants.showNetworkImage(
                      image: personalOffer.company!.logo!,
                      height: 65.h,
                      width: 65.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: personalOffer.type == 'discount_code' ? 25.h : 120.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onCloseTap,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 28.w,
                    right: 24.h,
                    top: 24.h,
                    bottom: 24.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(300.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.15),
                        blurRadius: 14.r,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.close,
                        height: 12.h,
                        width: 12.w,
                        color: AppColors.blackColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Close',
                        style: AppFonts.bodyLargeBold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
