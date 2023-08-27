import 'package:bella/features/layout/home/data/models/receipts_model.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ReceiptDetailsScreenInCompanyProfileScreen extends StatefulWidget {
  String companyLogo, title;
  Receipts? receipts;

  ReceiptDetailsScreenInCompanyProfileScreen({
    Key? key,
    required this.companyLogo,
    required this.title,
    required this.receipts,
  }) : super(key: key);

  @override
  State<ReceiptDetailsScreenInCompanyProfileScreen> createState() =>
      _ReceiptDetailsScreenInCompanyProfileScreenState();
}

class _ReceiptDetailsScreenInCompanyProfileScreenState
    extends State<ReceiptDetailsScreenInCompanyProfileScreen> {
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
        title: ClipRRect(
          borderRadius: BorderRadius.circular(40.r),
          child: AppConstants.showNetworkImage(
            image: widget.companyLogo,
            width: 31.h,
            height: 31.h,
            fit: BoxFit.scaleDown,
          ),
        ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.receipts!.company!.displayName!,
                  style: AppFonts.titleSubsection,
                ),
              ],
            ),
            SizedBox(height: 17.h),
            Text(
              widget.receipts!.company!.storeName!,
              style: AppFonts.date,
            ),
            SizedBox(height: 7.h),
            SizedBox(
              width: 163.w,
              child: Text(
                widget.receipts!.id!,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style: AppFonts.date,
              ),
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
                            'Amount paid',
                            style: AppFonts.smallCapslook.copyWith(
                              color: AppColors.black3Color.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 9.h),
                          Text(
                            '${widget.receipts!.total} kr',
                            style: AppFonts.smallCapslook,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'date paid'.toUpperCase(),
                            style: AppFonts.smallCapslook.copyWith(
                              color: AppColors.black3Color.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 9.h),
                          Text(
                            '${widget.receipts!.date}',
                            style: AppFonts.smallCapslook,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 29.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Summary',
                        style: AppFonts.date,
                      ),
                      Text(
                        'SEK',
                        style: AppFonts.date,
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Container(
                      width: 353.w,
                      decoration: BoxDecoration(
                        color: AppColors.white5Color,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 170.w,
                                      child: Text(
                                        '${widget.receipts!.items![index].name} x${widget.receipts!.items![index].quantity}',
                                        overflow: TextOverflow.clip,
                                        style: AppFonts.receiptItemLine,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 110.w,
                                      child: Text(
                                        widget.receipts!.items![index].price
                                            .toString(),
                                        textAlign: TextAlign.right,
                                        overflow: TextOverflow.clip,
                                        style: AppFonts.receiptItemLine,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: widget.receipts!.items!.length,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 129.w,
                                padding: EdgeInsets.only(
                                  left: 12.w,
                                  right: 12.w,
                                  bottom: 20.h,
                                ),
                                child: Text(
                                  'Amount paid',
                                  overflow: TextOverflow.clip,
                                  style: AppFonts.productPrice,
                                ),
                              ),
                              Container(
                                width: 157.w,
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text(
                                  widget.receipts!.total.toString(),
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.clip,
                                  style: AppFonts.productPrice,
                                ),
                              ),
                            ],
                          ),
                        ],
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
  }
}
