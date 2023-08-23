// ignore_for_file: must_be_immutable
import 'package:bella/features/layout/home/data/models/get_recommended_products_model.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_container_in_products_details.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_member_only.dart';
import 'package:bella/features/layout/wish_list/managers/wish_list_cubit/wish_list_cubit.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: AppColors.bgColor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.r),
              child: AppConstants.showNetworkImage(
                image: product!.companyLogo!,
                width: 40.h,
                height: 40.h,
                fit: BoxFit.cover,
              ),
            ),
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
                  product!.imageLink!,
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
              const CustomContainerInProductDetails(),
              SizedBox(height: 32.h),
              Text(
                product!.name!,
                textAlign: TextAlign.center,
                style: AppFonts.titleSection.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                product!.name!,
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
                          '${product!.oldPrice!.price} ${product!.newPrice!
                              .unit}',
                          style: AppFonts.strickedTextBig.copyWith(
                            color: AppColors.darkGreyColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '${product!.newPrice!.price} ${product!.newPrice!
                              .unit}',
                          style: AppFonts.productNameBig.copyWith(
                            color: AppColors.black7Color,
                            height: 1.h,
                          ),
                        ),
                      ],
                    ), BlocBuilder<WishListCubit, WishListState>(
                      builder: (context, state) {
                        var wishListCubit =
                        BlocProvider.of<WishListCubit>(context);

                        return GestureDetector(
                          onTap: () async {
                            if (wishListCubit.checkProductInWishList(
                                productId: product!.id!)) {
                              AppConstants.showFlushBar(
                                  context, 'Item has been removed');
                              await wishListCubit.deleteOneItemInCart(
                                productId: product!.id!,
                                companyDisplayName: product!.companyDisplayName!,
                                onTapSource: 'ProductDetailsScreen',
                              );
                            } else {
                              AppConstants.showFlushBar(
                                  context, 'Item added to wishlist');
                              await wishListCubit.addToCart(
                                company_logo_link: product!.companyLogo!,
                                company_display_name:
                                product!.companyDisplayName!,
                                product_id: product!.id!,
                                product_image_link: product!.imageLink!,
                                product_title: product!.name!,
                                regular_price:
                                product!.oldPrice!.price,
                                sale_price: product!.newPrice!.price!,
                                currency: product!.newPrice!.unit ?? 'kr',
                                saving_in_SEK: product!.savingInSEK!,
                              );
                            }
                          },
                          child: Container(
                            width: 47.2,
                            height: 47.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.sp),
                              color: wishListCubit.checkProductInWishList(
                                  productId: product!.id!)
                                  ? AppColors.primaryColor
                                  : AppColors.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff000000).withOpacity(
                                      0.08),
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
                            child: wishListCubit.checkProductInWishList(
                              productId: product!.id!,
                            )
                                ? SvgPicture.asset(
                              AppAssets.Vector,
                              width: 12.46.w,
                              height: 12.46.h,
                              color: AppColors.whiteColor,
                            )
                                : SvgPicture.asset(
                              AppAssets.add,
                              width: 12.46.w,
                              height: 12.46.h,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        );
                      },
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
