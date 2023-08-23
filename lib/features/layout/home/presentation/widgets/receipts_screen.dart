import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ReceiptsScreen extends StatelessWidget {
  const ReceiptsScreen({Key? key}) : super(key: key);

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
            SizedBox(height: 14.h),
            Center(
              child: Text('Starbucks', style: AppFonts.titleSubsection),
            ),
            SizedBox(height: 17.h),
            Center(
              child: Text('Mall of scandinavian', style: AppFonts.date),
            ),
            SizedBox(height: 4.h),
            Center(
              child:
                  Text('Stjärntorget 13 C, 169 79 Solna', style: AppFonts.date),
            ),
            SizedBox(height: 7.h),
            Center(
              child: Text('Receipt #2788-2039', style: AppFonts.date),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AMOUNT PAID',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                              color: AppColors.black3Color.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 9.h),
                          Text(
                            '765.00 kr',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                              color: AppColors.black3Color.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DATE PAID',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                              color: AppColors.black3Color.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 9.h),
                          Text(
                            'May 10, 2023',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                              color: AppColors.black3Color.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'PAYMENT METHOD',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                              color: AppColors.black3Color.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 9.h),
                          Text(
                            'Mastercard - 4444',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                              color: AppColors.black3Color.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'AMOUNT PAID',
                  //       style: GoogleFonts.inter(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 10.sp,
                  //         color: AppColors.black3Color.withOpacity(0.8),
                  //       ),
                  //     ),
                  //     Text(
                  //       'DATE PAID',
                  //       style: GoogleFonts.inter(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 10.sp,
                  //         color: AppColors.black3Color.withOpacity(0.8),
                  //       ),
                  //     ),
                  //     Text(
                  //       'PAYMENT METHOD',
                  //       style: GoogleFonts.inter(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 10.sp,
                  //         color: AppColors.black3Color.withOpacity(0.8),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 9.h),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       '765.00 kr',
                  //       style: GoogleFonts.inter(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 10.sp,
                  //         color: AppColors.black3Color.withOpacity(0.8),
                  //       ),
                  //     ),
                  //     Text(
                  //       'May 10, 2023',
                  //       style: GoogleFonts.inter(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 10.sp,
                  //         color: AppColors.black3Color.withOpacity(0.8),
                  //       ),
                  //     ),
                  //     Text(
                  //       'Mastercard - 4444',
                  //       style: GoogleFonts.inter(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 10.sp,
                  //         color: AppColors.black3Color.withOpacity(0.8),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 29.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Summary',
                        style: AppFonts.date,
                      ),
                      Text(
                        'Qty',
                        style: AppFonts.date,
                      ),
                      Text(
                        'SEK',
                        style: AppFonts.date,
                      ),
                    ],
                  ),
                  SizedBox(height: 23.h),
                  Container(
                    width: 353.w,
                    height: 150.h,
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      color: AppColors.white5Color,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                'Mozzarella',
                                style: AppFonts.date,
                              ),
                            ),
                            Text(
                              'x 1',
                              style: AppFonts.date,

                            ),
                            Text(
                              '19,00',
                              style: AppFonts.date,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Grillost naturell',
                              style: AppFonts.date,
                            ),
                            Text(
                              'x 2',
                              style: AppFonts.date,
                            ),
                            Text(
                              '101,40',
                              style: AppFonts.date,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Grillost naturell',
                              style: AppFonts.date,
                            ),
                            Text(
                              'x 2',
                              style: AppFonts.date,
                            ),
                            Text(
                              '101,40',
                              style: AppFonts.date,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Divider(
                          color: AppColors.grey9Color.withOpacity(0.1),
                          height: 2.h,
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Amount paid',
                              style: AppFonts.productPrice.copyWith(
                                letterSpacing: 0,
                              ),
                            ),
                            Text(
                              '765.00',
                              style: AppFonts.productPrice.copyWith(
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
