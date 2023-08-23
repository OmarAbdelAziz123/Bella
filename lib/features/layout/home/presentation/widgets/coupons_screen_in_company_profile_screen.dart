import 'package:bella/features/layout/home/presentation/widgets/receipts_screen.dart';
import 'package:bella/features/layout/offers/presentation/offers_view.dart';
import 'package:bella/features/layout/offers/presentation/template.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CouponsScreenInCompanyProfileScreen extends StatefulWidget {
  const CouponsScreenInCompanyProfileScreen({Key? key}) : super(key: key);

  @override
  State<CouponsScreenInCompanyProfileScreen> createState() => _CouponsScreenInCompanyProfileScreenState();
}

class _CouponsScreenInCompanyProfileScreenState extends State<CouponsScreenInCompanyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppAssets.back),
        ),
        centerTitle: true,
        title: Image.asset(AppAssets.starbucks, width: 31.w),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 27.w),
            width: 20.w,
            height: 16.h,
            child: SvgPicture.asset(AppAssets.more),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  Text('Coupons', style: AppFonts.titleScreen),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.gift,
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(width: 8.17.w),
                  Text(
                    'Presents (1)',
                    style: AppFonts.titleBody,
                  )
                ],
              ),
            ),
            SizedBox(height: 9.81.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  Container(
                    height: 150.h,
                    width: 280.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(1.14, 2.28),
                          blurRadius: 4.57.r,
                          spreadRadius: 0,
                          color: AppColors.whiteColor.withOpacity(0.08),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // navigateToTemplate(
                        //   bgColor: AppColors.new2Color,
                        //   companyLogo: AppAssets.starbucks,
                        //   widgetInCenter: Padding(
                        //     padding: EdgeInsets.only(bottom: 26.h),
                        //     child: Align(
                        //       alignment: Alignment.center,
                        //       child: Column(
                        //         children: [
                        //           Image.asset(
                        //             AppAssets.barcode,
                        //             height: 124.h,
                        //             width: 126.w,
                        //           ),
                        //           SizedBox(height: 5.h),
                        //           Text(
                        //             'Förfalle Om 2 dagar',
                        //             style: AppFonts.bodySmallBold,
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        //   precentageNumber: '200:-',
                        //   title: 'På varfritt meny',
                        //   onCloseTap: () {
                        //     // navigatePop(context);
                        //     Navigator.pop(context);
                        //   },
                        // );
                        navigateToReceiptsScreen();
                      },
                      child: Container(
                        width: 280.w,
                        height: 150.h,
                        padding: EdgeInsets.only(
                          top: 18.h,
                          left: 16.w,
                          bottom: 14.h,
                          right: 20.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          image: const DecorationImage(
                            image: AssetImage(AppAssets.gava),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(1.14, 2.28),
                              blurRadius: 4.57.r,
                              spreadRadius: 0,
                              color: AppColors.whiteColor.withOpacity(0.08),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '400 kr',
                                  style: AppFonts.cardPrice.copyWith(
                                    color: AppColors.newColor,
                                  ),
                                ),
                                Container(
                                  width: 24,
                                  height: 24.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.w,
                                    vertical: 3.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(78.82.r),
                                  ),
                                  child: SvgPicture.asset(
                                    AppAssets.arrow,
                                    color: AppColors.newColor,
                                    height: 18.h,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'SEPHORA',
                                  style: AppFonts.bodyLargeBold.copyWith(
                                    color: AppColors.newColor,
                                  ),
                                ),
                                Image.asset(
                                  AppAssets.present2,
                                  width: 92.w,
                                  height: 86.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                    height: 18.h,
                    width: 18.w,
                  ),
                  SizedBox(width: 8.17.w),
                  Text(
                    'Bonus Checks (3)',
                    style: AppFonts.titleBody,
                  )
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 150.h,
              width: 379.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 2),
                    blurRadius: 4.r,
                    spreadRadius: 0,
                    color: AppColors.whiteColor.withOpacity(0.08),
                  ),
                ],
              ),
              child: ListView.builder(
                padding: EdgeInsets.only(left: 12.w),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // navigateToTemplate(
                      //   bgColor: AppColors.newColor,
                      //   companyLogo: AppAssets.starbucks,
                      //   widgetInCenter: Align(
                      //     alignment: Alignment.center,
                      //     child: Column(
                      //       children: [
                      //         Image.asset(
                      //           AppAssets.barcode2,
                      //           height: 69.h,
                      //           width: 269.w,
                      //         ),
                      //         SizedBox(height: 49.h),
                      //         Text(
                      //           'Förfalle Om 2 dagar',
                      //           style: AppFonts.bodySmallBold,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   precentageNumber: '50%',
                      //   title: 'På varfritt meny',
                      //   onCloseTap: () {
                      //     // navigatePop(context);
                      //     Navigator.pop(context);
                      //   },
                      // );
                      navigateToReceiptsScreen();
                    },
                    child: Container(
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
                        color: AppColors.newColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '20 kr',
                                style: AppFonts.cardPrice.copyWith(
                                  color: AppColors.black3Color,
                                ),
                              ),
                              Container(
                                width: 24,
                                height: 24.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 3.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor.withOpacity(0.20),
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
                          Row(
                            children: [
                              Text(
                                'Köp 2 få 20:- rabatt',
                                style: AppFonts.productName,
                              ),
                            ],
                          ),
                          Row(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Apotea.se',
                                style: AppFonts.bodyLargeBold.copyWith(
                                  color: AppColors.grey13Color,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Förfaller',
                                    style: AppFonts.date,
                                  ),
                                  Text(
                                    'Om 2 dagar',
                                    style: AppFonts.date,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24.19.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.discount,
                    height: 18.h,
                    width: 18.w,
                  ),
                  SizedBox(width: 8.17.w),
                  Text(
                    'Discount Codes (3)',
                    style: AppFonts.titleBody,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 150.h,
              width: 379.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 2),
                    blurRadius: 4.r,
                    spreadRadius: 0,
                    color: AppColors.whiteColor.withOpacity(0.08),
                  ),
                ],
              ),
              child: ListView.builder(
                padding: EdgeInsets.only(left: 12.w),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {

                      // navigateToTemplate(
                      //   bgColor: AppColors.mintGreen2Color,
                      //   companyLogo: AppAssets.starbucks,
                      //   widgetInCenter: Align(
                      //     alignment: Alignment.center,
                      //     child: Column(
                      //       children: [
                      //         Image.asset(
                      //           AppAssets.copy,
                      //           height: 69.h,
                      //           width: 269.w,
                      //         ),
                      //         SizedBox(height: 49.h),
                      //         Text(
                      //           'Förfalle Om 2 dagar',
                      //           style: AppFonts.bodySmallBold,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   precentageNumber: '50%',
                      //   title: 'På varfritt meny',
                      //   onCloseTap: () {
                      //     // navigatePop(context);
                      //     Navigator.pop(context);
                      //   },
                      // );
                    },
                    child: Container(
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
                                '50%',
                                style: AppFonts.cardPrice
                                    .copyWith(color: AppColors.black3Color),
                              ),
                              Container(
                                width: 24,
                                height: 24.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 3.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor.withOpacity(0.20),
                                  borderRadius: BorderRadius.circular(69.r),
                                ),
                                child: SvgPicture.asset(
                                  AppAssets.arrow,
                                  color: AppColors.blackColor,
                                  height: 8.h,
                                  width: 4.w,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Köp 2 få 20:- rabatt',
                                style: AppFonts.productName,
                              ),
                            ],
                          ),
                          Row(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Mc Donald\'s',
                                style: AppFonts.bodyLargeBold,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Expiry date',
                                    style: AppFonts.date,
                                  ),
                                  Text(
                                    '30-04-2023',
                                    style: AppFonts.date,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
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
                    height: 16.07.h,
                    width: 16.07.w,
                  ),
                  SizedBox(width: 8.17.w),
                  Text(
                    'Coupons (5)',
                    style: AppFonts.titleBody,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 180.h,
              width: 340.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 2),
                    blurRadius: 4.r,
                    spreadRadius: 0,
                    color: AppColors.whiteColor.withOpacity(0.08),
                  ),
                ],
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // navigateToTemplate(
                      //   bgColor: AppColors.bgColor,
                      //   companyLogo: AppAssets.starbucks,
                      //   widgetInCenter: Align(
                      //     alignment: Alignment.center,
                      //     child: Column(
                      //       children: [
                      //         Image.asset(
                      //           AppAssets.barcode,
                      //           height: 124.h,
                      //           width: 126.w,
                      //         ),
                      //         SizedBox(height: 5.h),
                      //         Text(
                      //           'Förfalle Om 2 dagar',
                      //           style: AppFonts.bodySmallBold,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   precentageNumber: 'Gåva',
                      //   title: 'På varfritt meny',
                      //   onCloseTap: () {
                      //     // navigatePop(context);
                      //     Navigator.pop(context);
                      //   },
                      // );
                      navigateToReceiptsScreen();
                    },
                    child: Container(
                      height: 170.h,
                      width: 360.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColors.whiteColor,
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  topLeft: Radius.circular(15.r),
                                ),
                                child: Image.asset(
                                  AppAssets.img_offer,
                                  width: 169.w,
                                  height: 170.h,
                                ),
                              ),
                              Positioned(
                                bottom: 18.h,
                                left: 16.w,
                                child: Text(
                                  'Rituals',
                                  style: AppFonts.bodyDefault.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.w, right: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  EdgeInsets.only(right: 15.w, top: 15.h),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 118.w,
                                        child: Text(
                                          '20 kr',
                                          style: AppFonts.cardPrice.copyWith(
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 24,
                                        height: 24.h,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5.w,
                                          vertical: 3.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.blackColor
                                              .withOpacity(0.03),
                                          borderRadius:
                                          BorderRadius.circular(69.r),
                                        ),
                                        child: SvgPicture.asset(
                                          AppAssets.arrow,
                                          color: AppColors.blackColor,
                                          height: 8.h,
                                          width: 4.w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Discount',
                                  style: AppFonts.date,
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  'Buy 2 and get 20 kr',
                                  style: AppFonts.productName,
                                ),
                                Text(
                                  'discount',
                                  style: AppFonts.productName,
                                ),
                                SizedBox(height: 12.h),
                                Row(
                                  children: [
                                    Text(
                                      'Förfaller om 2 dagar',
                                      style: AppFonts.date,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.h),
                                Container(
                                  height: 28.h,
                                  width: 141.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(45.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Collect',
                                      style: AppFonts.linkDefault.copyWith(
                                        color: AppColors.whiteColor,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  void navigateToReceiptsScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => ReceiptsScreen(),
        transitionsBuilder:
            (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  void navigatePop(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const CouponsScreenInCompanyProfileScreen(),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}
