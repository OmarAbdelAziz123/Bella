import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OffersViewBody extends StatelessWidget {
  const OffersViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 60.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  'My Offers',
                  style: GoogleFonts.darkerGrotesque(
                    fontWeight: FontWeight.bold,
                    height: 1.h,
                    color: AppColors.black3Color,
                    fontSize: 28.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 23.w),
                child: SvgPicture.asset(
                  AppAssets.layersIcon,
                  height: 1.5.h,
                  width: 20.25.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SearchBarWidget(hintText: 'Search for brands'),
          SizedBox(height: 23.h),
          SizedBox(
            height: 111.h,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 20.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.bgColor.withOpacity(0.8),
                            spreadRadius: 0.1,
                            blurRadius: 1,
                            offset: const Offset(
                                0.5, 0.5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.asset(
                        AppAssets.starbucks,
                        width: 70.w,
                        height: 70.h,
                      ),
                    ),
                    // SizedBox(height: .h),
                    Text(
                      'Starbucks',
                      style: GoogleFonts.darkerGrotesque(
                        height: 1.h,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                );
              },
              itemCount: 8,
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.gift,
                  height: 16.67.h,
                  width: 16.67.w,
                ),
                SizedBox(width: 8.17.w),
                Text(
                  'Gåva (1)',
                  style: GoogleFonts.darkerGrotesque(
                    height: 1.h,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black3Color,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 9.81.h),
          SizedBox(
            height: 150.h,
            width: 379.w,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 12.w),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: 280.w,
                  height: 150.h,
                  margin: EdgeInsets.only(right: 12.w),
                  padding: EdgeInsets.only(
                    top: 18.h,
                    left: 16.w,
                    bottom: 15.h,
                    right: 23.18.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: AppColors.black3Color,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '400:-',
                            style: GoogleFonts.darkerGrotesque(
                              color: AppColors.mintGreenColor,
                              height: 1.h,
                              fontWeight: FontWeight.w500,
                              fontSize: 35.sp,
                            ),
                          ),
                          SvgPicture.asset(AppAssets.present),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(AppAssets.image4,
                                  height: 35.h, width: 35.w),
                              SizedBox(width: 10.w),
                              Text(
                                'SEPHORA',
                                style: GoogleFonts.darkerGrotesque(
                                  color: AppColors.bgColor,
                                  height: 1.h,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 24,
                            height: 24.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 3.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.black5Color,
                              borderRadius: BorderRadius.circular(78.82.r),
                            ),
                            child: SvgPicture.asset(
                              AppAssets.arrow,
                              color: AppColors.mintGreenColor,
                              height: 18.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.personalOffers,
                  height: 16.67.h,
                  width: 16.67.w,
                ),
                SizedBox(width: 8.17.w),
                Text(
                  'Bonus Checks (3)',
                  style: GoogleFonts.darkerGrotesque(
                    height: 1.h,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black3Color,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 9.81.h),
          SizedBox(
            height: 150.h,
            width: 379.w,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 12.w),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: 280.w,
                  height: 150.h,
                  margin: EdgeInsets.only(right: 12.w),
                  padding: EdgeInsets.only(
                    top: 18.h,
                    left: 16.w,
                    bottom: 15.h,
                    right: 23.18.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: AppColors.mintGreen3Color,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '20:-',
                            style: GoogleFonts.darkerGrotesque(
                              color: AppColors.blackColor,
                              height: 1.h,
                              fontWeight: FontWeight.w500,
                              fontSize: 35.sp,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Förfaller',
                                style: GoogleFonts.darkerGrotesque(
                                  color: AppColors.blackColor,
                                  height: 1.h,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                'Om 2 dagar',
                                style: GoogleFonts.darkerGrotesque(
                                  color: AppColors.blackColor,
                                  height: 1.h,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Köp 2 få 20:- rabatt',
                            style: GoogleFonts.darkerGrotesque(
                              color: AppColors.blackColor,
                              height: 1.h,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(AppAssets.kintaky,
                                  height: 35.h, width: 35.w),
                              SizedBox(width: 10.w),
                              Text(
                                'KFC',
                                style: GoogleFonts.darkerGrotesque(
                                  color: AppColors.blackColor,
                                  height: 1.h,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.13.sp,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 24,
                            height: 24.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 3.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.mintGreen4Color,
                              borderRadius: BorderRadius.circular(78.82.r),
                            ),
                            child: SvgPicture.asset(
                              AppAssets.arrow,
                              color: AppColors.blackColor,
                              height: 18.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.discount,
                  height: 16.67.h,
                  width: 16.67.w,
                ),
                SizedBox(width: 8.17.w),
                Text(
                  'Discount Codes (3)',
                  style: GoogleFonts.darkerGrotesque(
                    height: 1.h,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black3Color,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 9.81.h),
          SizedBox(
            height: 150.h,
            width: 379.w,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 12.w),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: 280.w,
                  height: 150.h,
                  margin: EdgeInsets.only(right: 12.w),
                  padding: EdgeInsets.only(
                    top: 18.h,
                    left: 16.w,
                    bottom: 15.h,
                    right: 23.18.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: AppColors.mintGreen2Color,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '20:-',
                            style: GoogleFonts.darkerGrotesque(
                              color: AppColors.blackColor,
                              height: 1.h,
                              fontWeight: FontWeight.w500,
                              fontSize: 35.sp,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Expiry date',
                                style: GoogleFonts.darkerGrotesque(
                                  color: AppColors.blackColor,
                                  height: 1.h,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                '30-04-2023',
                                style: GoogleFonts.darkerGrotesque(
                                  color: AppColors.blackColor,
                                  height: 1.h,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Köp 2 få 20:- rabatt',
                            style: GoogleFonts.darkerGrotesque(
                              color: AppColors.blackColor,
                              height: 1.h,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppAssets.mac,
                                height: 35.h,
                                width: 35.w,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                'Mc Donalds',
                                style: GoogleFonts.darkerGrotesque(
                                  color: AppColors.blackColor,
                                  height: 1.h,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.13.sp,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 24,
                            height: 24.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 3.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.mintGreen5Color,
                              borderRadius: BorderRadius.circular(78.82.r),
                            ),
                            child: SvgPicture.asset(
                              AppAssets.arrow,
                              color: AppColors.blackColor,
                              height: 18.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.offersIcon,
                  color: AppColors.blackColor,
                  height: 16.67.h,
                  width: 16.67.w,
                ),
                SizedBox(width: 8.17.w),
                Text(
                  'Discount Codes (3)',
                  style: GoogleFonts.darkerGrotesque(
                    height: 1.h,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black3Color,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9.81.h),
          SizedBox(
            height: 170.h,
            width: 340.w,
            child: ListView.builder(
              // padding: EdgeInsets.only(left: 12.w),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  height: 170.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: AppColors.whiteColor,
                  ),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset(AppAssets.img_offer),
                          Positioned(
                            top: 5.h,
                            left: 5.w,
                            child: Image.asset(
                              AppAssets.offer20,
                              width: 54.w,
                              height: 54.h,
                            ),
                          ),
                          Positioned(
                            bottom: 12.h,
                            left: 12.w,
                            right: 14.w,
                            child: Image.asset(AppAssets.frame),
                          ),
                        ],
                      ),
                      // padding: EdgeInsets.only(left: 15.h, right: 15.w, bottom: 9.h, top: 15.32.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 24,
                                height: 24.h,
                                margin:
                                    EdgeInsets.only(left: 132.h, top: 15.32.h),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 3.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.grey5Color,
                                  borderRadius: BorderRadius.circular(78.82.r),
                                ),
                                child: SvgPicture.asset(
                                  AppAssets.arrow,
                                  color: AppColors.blackColor,
                                  height: 18.h,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 28.68.h),
                          Padding(
                            padding: EdgeInsets.only(left: 14.w),
                            child: Row(
                              children: [
                                Text(
                                  'Buy 2 and get 20 kr',
                                  style: GoogleFonts.darkerGrotesque(
                                    fontSize: 16.sp,
                                    height: 1.h,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.w),
                            child: Row(
                              children: [
                                Text(
                                  'discount',
                                  style: GoogleFonts.darkerGrotesque(
                                    fontSize: 16.sp,
                                    height: 1.h,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 14.h),
                          Padding(
                            padding: EdgeInsets.only(left: 14.w),
                            child: Row(
                              children: [
                                Text(
                                  'Förfaller om 2 dagar',
                                  style: GoogleFonts.darkerGrotesque(
                                    fontSize: 14.sp,
                                    height: 1.h,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 13.h),
                          Container(
                            height: 28.h,
                            width: 141.w,
                            margin: EdgeInsets.symmetric(horizontal: 13.3.w),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(45.r),
                            ),
                            child: Center(
                              child: Text(
                                'Collect',
                                style: GoogleFonts.darkerGrotesque(
                                  fontWeight: FontWeight.bold,
                                  height: 1.h,
                                  fontSize: 14.sp,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}
