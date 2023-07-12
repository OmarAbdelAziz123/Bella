// ignore_for_file: must_be_immutable
import 'package:bella/features/layout/home/data/models/get_recommended_products_model.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_container_in_products_details.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_member_only.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatelessWidget {
  RecommendedProducts? product;

  ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              top: 11.h,
            ),
            child: SvgPicture.asset(
              AppAssets.container_close,
              width: 17.9.w,
              height: 11.3.h,
              // color: Colors.black,
            ),
          ),
        ),
        actions: [
          // ClipOval(
          //   // borderRadius: BorderRadius.circular(40.r),
          //   child: Image.network(
          //     product!.company_logo!,
          //     fit: BoxFit.cover,
          //     errorBuilder: (context, error, stackTrace) {
          //       return SvgPicture.asset(AppAssets.errorIcon);
          //     },
          //     height: 40.h,
          //     width: 40.w,
          //   ),
          // ),
          AppConstants.showNetworkImage(
            image: product!.company_logo!,
            width: 40.h,
            height: 40.h,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 30.w,
            height: 10.h,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.h),
          child: Column(
            children: [
              Center(
                child: Image.network(
                  product!.imageLinks![0],
                  color: Colors.grey.withOpacity(0.1),
                  colorBlendMode: BlendMode.srcOver,
                  errorBuilder: (context, error, stackTrace) {
                    return SvgPicture.asset(AppAssets.errorIcon);
                  },
                  width: 231.w,
                  height: 201.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(height: 18.h),
              product!.membersOnly == true
                  ? const CustomMemberOnly()
                  : Container(),
              SizedBox(height: 8.h),
              CustomContainerInProductDetails(),
              SizedBox(height: 32.h),
              Text(
                product!.title!,
                textAlign: TextAlign.center,
                style: AppFonts.titleSection.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                product!.title!,
                textAlign: TextAlign.center,
                style: AppFonts.titleBody.copyWith(
                  color: AppColors.blackColor,
                  height: 1.h,
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                product!.description!,
                textAlign: TextAlign.center,
                style: AppFonts.productName,
              ),
              Padding(
                padding: EdgeInsets.only(top: 29.h, bottom: 21.53.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${product!.pricing!.regularPrice} ${product!.pricing!.currency!}',
                          // style: GoogleFonts.inter(
                          //   color: AppColors.grey9Color,
                          //   decoration: TextDecoration.lineThrough,
                          //   height: 1.h,
                          //   fontWeight: FontWeight.w400,
                          //   fontSize: 15.sp,
                          // ),
                          style: AppFonts.strickedTextBig.copyWith(
                            color: AppColors.darkGreyColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '${product!.pricing!.salePrice} ${product!.pricing!.currency!}',
                          // style: GoogleFonts.inter(
                          //   color: AppColors.black7Color,
                          //   height: 1.h,
                          //   fontWeight: FontWeight.w400,
                          //   fontSize: 18.sp,
                          // ),
                          style: AppFonts.productNameBig.copyWith(
                            color: AppColors.black7Color,
                            height: 1.h,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 47.2,
                      height: 47.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.sp),
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.08),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: const Offset(1, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.34.w,
                        vertical: 15.34.w,
                      ),
                      child: SvgPicture.asset(
                        AppAssets.add,
                        width: 16.52.w,
                        height: 16.52.h,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Product details',
                    style: AppFonts.titleBody.copyWith(
                      height: 1.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: 353.w,
                child: Text(
                  product!.description!,
                  overflow: TextOverflow.clip,
                  style: AppFonts.bodyLarge.copyWith(
                    height: 1.5.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
