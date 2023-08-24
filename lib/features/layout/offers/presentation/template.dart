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
                height: 600.h,
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
                    SizedBox(height: 37.h),
                    Align(
                      alignment: Alignment.center,
                      // child: widgetInCenter,
                      child: personalOffer.type == 'discount_code'
                          ? Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  // Image.asset(
                                  //   AppAssets.copy,
                                  //   height: 69.h,
                                  //   width: 269.w,
                                  // ),
                                  AppConstants.showNetworkImage(
                                    image: personalOffer.barcodeLink!,
                                    height: 69.h,
                                    width: 269.w,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  SizedBox(height: 10.h),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w, vertical: 8.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.bgColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Text(personalOffer.value!.code!)),
                                  SizedBox(height: 20.h),
                                  Text(
                                    // 'Förfalle Om 2 dagar',
                                    'Expiry Date',
                                    style: AppFonts.bodySmallBold,
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    personalOffer.validTo!,
                                    style: AppFonts.bodySmallBold,
                                  ),
                                  SizedBox(height: 20.h),
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
                                        height: 69.h,
                                        width: 269.w,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      SizedBox(height: 20.h),
                                      Text(
                                        'Expiry Date',
                                        style: AppFonts.bodySmallBold,
                                      ),
                                      SizedBox(height: 20.h),
                                      Text(
                                        personalOffer.validTo!,
                                        style: AppFonts.bodySmallBold,
                                      ),
                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                )
                              : personalOffer.type == 'gift_card'
                                  ? Padding(
                                      padding: EdgeInsets.only(bottom: 26.h),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            AppConstants.showNetworkImage(
                                              image: personalOffer.barcodeLink!,
                                              height: 69.h,
                                              width: 269.w,
                                              fit: BoxFit.scaleDown,
                                            ),
                                            SizedBox(height: 20.h),
                                            Text(
                                              'Expiry Date',
                                              style: AppFonts.bodySmallBold,
                                            ),
                                            SizedBox(height: 20.h),
                                            Text(
                                              personalOffer.validTo!,
                                              style: AppFonts.bodySmallBold,
                                            ),
                                            SizedBox(height: 20.h),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      color: AppColors.primaryColor,
                                      height: 10.h,
                                      width: 10.w,
                                    ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        // width: 81.w,
                        constraints: BoxConstraints(
                          maxWidth: 150.w,
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
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 287.w,
                          child: Text(
                            personalOffer.description!,
                            overflow: TextOverflow.clip,
                            style: AppFonts.titleSubsection,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
              Positioned(
                top: -35.h,
                left: 50.5,
                right: 50,
                // child: ClipRRect(
                //   borderRadius: BorderRadius.circular(40.r),
                //   child: AppConstants.showNetworkImage(
                //     image: personalOffer.company!.logo!,
                //     width: 64.h,
                //     height: 64.h,
                //     fit: BoxFit.scaleDown,
                //   ),
                // ),
                child: CircleAvatar(
                  radius: 40.r,
                  // child: ,
                  backgroundImage: NetworkImage(
                    personalOffer.company!.logo!,
                    // fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
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
