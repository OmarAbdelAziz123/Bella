// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_member_only.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_recommended_products.dart';
import 'package:bella/features/layout/wish_list/managers/wish_list_cubit/wish_list_cubit.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsInCompanyScreen extends StatefulWidget {
  String logo, display_name;

  ProductsInCompanyScreen(
      {Key? key, required this.logo, required this.display_name})
      : super(key: key);

  @override
  State<ProductsInCompanyScreen> createState() =>
      _ProductsInCompanyScreenState();
}

class _ProductsInCompanyScreenState extends State<ProductsInCompanyScreen> {
  int selectedItem = 0;

  Color colorOfIconAddToCart = Colors.black;

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getCompanyProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
        var wishListCubit = BlocProvider.of<WishListCubit>(context);

        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<HomeCubit>(context);
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
                      AppAssets.arrowContainer,
                      width: 17.9.w,
                      height: 11.3.h,
                      // color: Colors.black,
                    ),
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              // ClipOval(
                              //   // borderRadius: BorderRadius.circular(40.r),
                              //   child: Image.network(
                              //     widget.logo,
                              //     fit: BoxFit.cover,
                              //     errorBuilder: (context, error, stackTrace) {
                              //       return SvgPicture.asset(AppAssets.errorIcon);
                              //     },
                              //     width: 64.w,
                              //     height: 64.h,
                              //     // color: Colors.black,
                              //   ),
                              // ),
                              AppConstants.showNetworkImage(
                                image: widget.logo,
                                width: 64.h,
                                height: 64.h,
                                fit: BoxFit.scaleDown,
                              ),
                              Text(
                                widget.display_name,
                                style: GoogleFonts.darkerGrotesque(
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 126.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: AppColors.grey8Color,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 7.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.address,
                                    height: 16.h,
                                    width: 16.w,
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    'Favourite Store',
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.darkerGrotesque(
                                      height: 1.h,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    AppAssets.dwon,
                                    height: 16.h,
                                    width: 16.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 26.h),
                      Row(
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
                      SizedBox(height: 18.h),

                      /// Get Company Products
                      state is GetCompanyProductsLoadingState
                          ? const CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            )
                          : cubit.getCompanyProductsModel == null
                              ? const CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                )
                              : cubit.getCompanyProductsModel!.companyProducts!
                                      .isEmpty
                                  ? Text(
                                      'No products',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        color: AppColors.blackColor,
                                      ),
                                    )
                                  : BlocBuilder<WishListCubit, WishListState>(
                                      builder: (context, state) {
                                        var wishCubit =
                                            BlocProvider.of<WishListCubit>(
                                                context);
                                        return GridView.builder(
                                          // padding: EdgeInsets.symmetric(horizontal: 20.w),
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisSpacing: 13.w,
                                            mainAxisSpacing: 13.h,
                                            childAspectRatio: 1 / 1.72,
                                            crossAxisCount: 2,
                                          ),
                                          itemCount: cubit
                                              .getCompanyProductsModel!
                                              .companyProducts!
                                              .length,
                                          itemBuilder: (context, index) {
                                            var products = cubit
                                                .getCompanyProductsModel!
                                                .companyProducts![index];
                                            var wishList =
                                                wishListCubit.wishListModel;

                                            // bool isInWishlist(String productId) {
                                            //   bool result = false;
                                            //   for (var product in wishListCubit.wishListModel!) {
                                            //     if (product.id == productId) {
                                            //       result = true;
                                            //       break;
                                            //     }
                                            //   }
                                            //   return result;
                                            // }

                                            return CustomRecommendedProducts(
                                              logoOfCompany:
                                                  products.company_logo,
                                              imageOfProduct:
                                                  products.imageLinks![0],
                                              title: products.title!,
                                              description:
                                                  products.description!,
                                              currency:
                                                  products.pricing!.currency!,
                                              regularPrice: products
                                                      .pricing!.regularPrice ??
                                                  0.0,
                                              salePrice:
                                                  products.pricing!.salePrice ??
                                                      0.0,
                                              customMemberOnly:
                                                  products.membersOnly == true
                                                      ? const CustomMemberOnly()
                                                      : Container(),
                                              onTap: () {
                                                // MyCache.putString(
                                                //   key: CacheKeys.comp_id,
                                                //   value: products.companyId.toString(),
                                                // );
                                                // print('COMPANY ID');
                                                // print(
                                                //     MyCache.getString(key: CacheKeys.comp_id));
                                                // navigateToProductDetailsScreen(
                                                //   products,
                                                // );
                                              },
                                              widget: SvgPicture.asset(
                                                AppAssets.add,
                                                width: 12.46.w,
                                                height: 12.46.h,
                                                color: AppColors.primaryColor,
                                              ),
                                              buttonColor: AppColors.primaryColor,
                                              onTapAddToCart: () {
                                                wishCubit.addToCart(
                                                  company_logo_link: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .company_logo!,
                                                  company_display_name: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .company_display_name!,
                                                  product_id: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .id!,
                                                  product_image_link: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .imageLinks![0],
                                                  product_title: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .title!,
                                                  regular_price: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .pricing!
                                                      .regularPrice,
                                                  sale_price: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .pricing!
                                                      .salePrice,
                                                  currency: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .pricing!
                                                      .currency,
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CustomContainerInProductsInCompanyScreen extends StatelessWidget {
  final String text, icon;
  void Function()? onTap;
  Color borderColor;

  CustomContainerInProductsInCompanyScreen(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onTap,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 79.w,
        height: 90.h,
        padding: EdgeInsets.only(
          top: 21.h,
          bottom: 12.h,
          right: 10.w,
          left: 10.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.grey8Color,
          border: Border.all(
            color: borderColor,
            width: 2.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              icon,
              width: 24.w,
              height: 24.h,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: AppColors.black3Color,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
