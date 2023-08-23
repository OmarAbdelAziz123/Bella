// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, must_be_immutable
import 'dart:developer';

import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/data/models/get_recommended_products_model.dart';
import 'package:bella/features/layout/home/home_navigation_functions/home_navigation_functions.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/widgets/company_profile_screen.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_member_only.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_product_by_company.dart';
import 'package:bella/features/layout/wish_list/managers/wish_list_cubit/wish_list_cubit.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/custom_recommended_products.dart';

class ProductByCategory extends StatefulWidget {
  String logo, display_name, initialScreen, categoryName;

  ProductByCategory({
    Key? key,
    required this.logo,
    required this.display_name,
    required this.initialScreen,
    required this.categoryName,
  }) : super(key: key);

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory> {
  ScrollController scrollController = ScrollController();

  PageController? pageController;

  bool isLoading = false, allLoaded = false;

  int pageCount = 0;

  // makeLazyLoading() async {
  //   if (allLoaded) {
  //     return;
  //   }
  //   setState(() {
  //     loading = true;
  //   });
  //   await BlocProvider.of<HomeCubit>(context).getProductsByCategory();
  //   await Future.delayed(const Duration(microseconds: 500));
  //   List<RecommendedProducts> newData = BlocProvider.of<HomeCubit>(context).productsByCategory.length > 20 ? [] : BlocProvider.of<HomeCubit>(context).productsByCategory;

  //   if (newData.isNotEmpty) {
  //     BlocProvider.of<HomeCubit>(context).productsByCategory.addAll(newData);
  //   }
  //   setState(() {
  //     loading = false;
  //     allLoaded = true;
  //   });
  // }

  @override
  void initState() {
    log('$pageCount in Init State');
    BlocProvider.of<HomeCubit>(context).getProductsByCategory(
        pageNumber: pageCount, limit: 5, categoryName: widget.categoryName);
    scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(scrollListener);
    super.initState();
    pageController = PageController(
      initialPage: 0,
    );
  }

  scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        log("comes to bottom $isLoading");
        isLoading = true;

        if (isLoading) {
          log("RUNNING LOAD MORE");

          log(pageCount.toString());

          pageCount = pageCount + 1;

          BlocProvider.of<HomeCubit>(context).getProductsByCategory(
              pageNumber: pageCount,
              limit: 5,
              categoryName: widget.categoryName);
          // addItemIntoLisT(pageCount);
        }
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    BlocProvider.of<HomeCubit>(context).resetProductsByCategory();
    super.dispose();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
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
                centerTitle: true,
                title: Padding(
                  padding: EdgeInsets.only(
                    top: 11.h,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(249.44.r),
                    child: Image.network(
                      widget.logo,
                      width: 31.w,
                      height: 31.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                leading: GestureDetector(
                  onTap: () {
                    // scrollController.dispose();
                    BlocProvider.of<HomeCubit>(context)
                        .resetProductsByCategory();
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
              body: cubit.productsByCategory.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              children: [
                                Text(
                                  widget.categoryName,
                                  style: AppFonts.titleSubsection.copyWith(
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 18.h),
                          GridView.builder(
                              clipBehavior: Clip.none,
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 13.w,
                                mainAxisSpacing: 10.h,
                                childAspectRatio: 1 / 1.72,
                                crossAxisCount: 2,
                              ),
                              itemCount: cubit.productsByCategory.length,
                              itemBuilder: (context, index) {
                                var product = cubit.productsByCategory[index];
                                if (index < cubit.productsByCategory.length) {
                                  return BlocBuilder<WishListCubit,
                                      WishListState>(
                                    builder: (context, state) {
                                      var wishListCubit =
                                          BlocProvider.of<WishListCubit>(
                                              context);

                                      // return CustomRecommendedProducts(
                                      //   logoOfCompany: product.companyLogo ?? '',
                                      //   imageOfProduct: product.imageLink ?? '',
                                      //   title: product.name ?? '...',
                                      //   description: product.description ?? '...',
                                      //   currency: product.newPrice!.unit ?? 'kr',
                                      //   regularPrice:
                                      //       product.oldPrice!.price ?? 0.0,
                                      //   salePrice: product.newPrice!.price ?? 0.0,
                                      //   customMemberOnly:
                                      //       product.membersOnly == true
                                      //           ? const CustomMemberOnly()
                                      //           : Container(),
                                      //   widget:
                                      //       wishListCubit.checkProductInWishList(
                                      //     productId: product.id ?? '...',
                                      //   )
                                      //           ? SvgPicture.asset(
                                      //               AppAssets.Vector,
                                      //               width: 12.46.w,
                                      //               height: 12.46.h,
                                      //               color: AppColors.whiteColor,
                                      //             )
                                      //           : SvgPicture.asset(
                                      //               AppAssets.add,
                                      //               width: 12.46.w,
                                      //               height: 12.46.h,
                                      //               color: AppColors.primaryColor,
                                      //             ),
                                      //   buttonColor:
                                      //       wishListCubit.checkProductInWishList(
                                      //               productId: product.id!)
                                      //           ? AppColors.primaryColor
                                      //           : AppColors.whiteColor,
                                      //   onTap: () {
                                      //     MyCache.putString(
                                      //       key: CacheKeys.comp_id,
                                      //       value: product.companyId.toString(),
                                      //     );
                                      //     HomeNavigationClass
                                      //         .navigateToProductDetailsScreen(
                                      //             product,
                                      //             context: context);
                                      //   },
                                      //   onTapAddToCart: () async {
                                      //     if (wishListCubit.checkProductInWishList(
                                      //         productId: product.id!)) {
                                      //       await wishListCubit.deleteOneItemInCart(
                                      //         id: wishListCubit.wishListModel[index]
                                      //             .products![index].id!,
                                      //         companyDisplayName: wishListCubit
                                      //             .wishListModel[index]
                                      //             .companyDisplayName!,
                                      //       );
                                      //       AppConstants.showFlushBar(
                                      //           context, 'Item has been removed');
                                      //     } else {
                                      //       await wishListCubit.addToCart(
                                      //         company_logo_link:
                                      //             product.companyLogo!,
                                      //         company_display_name:
                                      //             product.companyDisplayName!,
                                      //         product_id: product.id!,
                                      //         product_image_link:
                                      //             product.imageLink!,
                                      //         product_title: product.name!,
                                      //         regular_price:
                                      //             product.oldPrice!.price,
                                      //         sale_price: product.newPrice!.price,
                                      //         currency:
                                      //             product.newPrice!.unit ?? 'kr',
                                      //       );
                                      //       AppConstants.showFlushBar(
                                      //           context, 'Item added to wishlist');
                                      //     }
                                      //   },
                                      // );
                                      ///
                                      ///
                                      // return Container(
                                      //   width: 170.w,
                                      //   height: 261.h,
                                      //   decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.circular(15.r),
                                      //   ),
                                      //   child: Column(
                                      //     crossAxisAlignment:
                                      //         CrossAxisAlignment.start,
                                      //     children: [
                                      //       Container(
                                      //         width: 170.w,
                                      //         height: 180.h,
                                      //         decoration: BoxDecoration(
                                      //           color: AppColors.whiteColor,
                                      //           borderRadius:
                                      //               BorderRadius.circular(15.r),
                                      //         ),
                                      //         child: Stack(
                                      //           children: [
                                      //             Positioned(
                                      //               top: 10.h,
                                      //               left: 10.5.w,
                                      //               child: Container(
                                      //                 width: 77.25.w,
                                      //                 height: 18.h,
                                      //                 decoration: BoxDecoration(
                                      //                   borderRadius:
                                      //                       BorderRadius.circular(
                                      //                           7.r),
                                      //                   color: AppColors.newColor,
                                      //                 ),
                                      //                 child: Center(
                                      //                   child: Text(
                                      //                     '2 for 200 kr',
                                      //                     style:
                                      //                         AppFonts.productTag,
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //             Positioned(
                                      //               top: 10.h,
                                      //               right: 9.75.w,
                                      //               child: Container(
                                      //                 width: 42.25.w,
                                      //                 height: 18.h,
                                      //                 decoration: BoxDecoration(
                                      //                   color:
                                      //                       AppColors.grey16Color,
                                      //                   borderRadius:
                                      //                       BorderRadius.circular(
                                      //                           7.r),
                                      //                 ),
                                      //                 child: Center(
                                      //                   child: Text(
                                      //                     product
                                      //                         .priceDecreasePercentage!,
                                      //                     style:
                                      //                         AppFonts.productTag,
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //             Positioned(
                                      //               top: 28.h,
                                      //               bottom: 27.h,
                                      //               left: 23.w,
                                      //               right: 22.w,
                                      //               child: ClipRRect(
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(
                                      //                         40.r),
                                      //                 child: AppConstants
                                      //                     .showNetworkImage(
                                      //                   image: product.imageLink!,
                                      //                   width: 125.w,
                                      //                   height: 125.h,
                                      //                   fit: BoxFit.scaleDown,
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //             Positioned(
                                      //               right: 10.2.w,
                                      //               bottom: 5.2.h,
                                      //               child: Container(
                                      //                 width: 35.6.w,
                                      //                 height: 35.6.h,
                                      //                 decoration: BoxDecoration(
                                      //                   borderRadius:
                                      //                       BorderRadius.circular(
                                      //                           50.sp),
                                      //                   color: AppColors.whiteColor,
                                      //                   boxShadow: [
                                      //                     BoxShadow(
                                      //                       color: const Color(
                                      //                           0x4D8367F4),
                                      //                       offset:
                                      //                           const Offset(1, 1),
                                      //                       blurRadius: 5.sp,
                                      //                       spreadRadius: 1.2,
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //                 child: const Icon(
                                      //                   Icons.add,
                                      //                   color:
                                      //                       AppColors.primaryColor,
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         padding: EdgeInsets.only(top: 12.h),
                                      //         height: 48.h,
                                      //         width: 146.w,
                                      //         child: Column(
                                      //           children: [
                                      //             Container(
                                      //               width: 146.w,
                                      //               // height: 31.h,
                                      //               child: Text(
                                      //                 product.name!,
                                      //                 overflow:
                                      //                     TextOverflow.ellipsis,
                                      //                 style: AppFonts.productName
                                      //                     .copyWith(
                                      //                   color:
                                      //                       AppColors.black7Color,
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //             Container(
                                      //               width: 146.w,
                                      //               // height: 31.h,
                                      //               child: Text(
                                      //                 product.description!,
                                      //                 overflow:
                                      //                     TextOverflow.ellipsis,
                                      //                 style: AppFonts.productName
                                      //                     .copyWith(
                                      //                   color:
                                      //                       AppColors.black7Color,
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //       SizedBox(height: 11.h),
                                      //       Column(
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //         children: [
                                      //           Text(
                                      //             '${product.oldPrice!.price} ${product.oldPrice!.unit ?? 'kr'}',
                                      //             style: AppFonts.strickedText
                                      //                 .copyWith(
                                      //               color: AppColors.grey9Color,
                                      //               fontSize: 12.sp,
                                      //               height: 1.h,
                                      //               decoration:
                                      //                   TextDecoration.lineThrough,
                                      //             ),
                                      //           ),
                                      //           SizedBox(height: 5.h),
                                      //           Text(
                                      //             '${product.newPrice!.price} ${product.newPrice!.unit ?? 'kr'}',
                                      //             style: AppFonts.productPrice
                                      //                 .copyWith(
                                      //               color: AppColors.black7Color,
                                      //               height: 1.h,
                                      //               letterSpacing: -1.sp,
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // );
                                      return CustomProductByCompany(
                                        priceDecreasePercentage:
                                            product.priceDecreasePercentage!,
                                        imageLink: product.imageLink!,
                                        productName: product.name!,
                                        productDescription:
                                            product.description!,
                                        oldPrice: product.oldPrice!.price!,
                                        newPrice: product.newPrice!.price!,
                                        unit: product.newPrice!.unit!,
                                        campaign_type: product.campaignText!,
                                        widget: wishListCubit
                                                .checkProductInWishList(
                                          productId: product.id!,
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
                                        buttonColor: wishListCubit
                                                .checkProductInWishList(
                                                    productId: product.id!)
                                            ? AppColors.primaryColor
                                            : AppColors.whiteColor,
                                        onTapInProduct: () {
                                          MyCache.putString(
                                            key: CacheKeys.comp_id,
                                            value: product.companyId.toString(),
                                          );
                                          HomeNavigationClass
                                              .navigateToProductDetailsScreen(
                                            product,
                                            context: context,
                                          );
                                        },
                                        onTapAddToCart: () async {
                                          if (wishListCubit
                                              .checkProductInWishList(
                                                  productId: product.id!)) {
                                            await wishListCubit
                                                .deleteOneItemInCart(
                                              // productId: wishListCubit
                                              //     .wishListModel[index]
                                              //     .products![index]
                                              //     .id!,
                                              productId: product.id!,
                                              // companyDisplayName: wishListCubit
                                              //     .wishListModel[index]
                                              //     .companyDisplayName!,
                                              companyDisplayName: product.companyDisplayName!,
                                              onTapSource: 'ProductByCategoryScreen',
                                            );
                                            AppConstants.showFlushBar(context,
                                                'Item has been removed',);
                                          } else {
                                            await wishListCubit.addToCart(
                                              company_logo_link:
                                                  product.companyLogo!,
                                              company_display_name:
                                                  product.companyDisplayName!,
                                              product_id: product.id!,
                                              product_image_link:
                                                  product.imageLink!,
                                              product_title: product.name!,
                                              regular_price:
                                                  product.oldPrice!.price,
                                              sale_price:
                                                  product.newPrice!.price!,
                                              currency:
                                                  product.newPrice!.unit ??
                                                      'kr',
                                              saving_in_SEK: product.savingInSEK!,
                                            );
                                            AppConstants.showFlushBar(context,
                                                'Item added to wishlist');
                                          }
                                        },
                                      );
                                    },
                                  );
                                } else {
                                  log('Product By Category Length is ${cubit.productsByCategory.length}');
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primaryColor,
                                    ),
                                  );
                                }
                                // } else {
                                //   /// Get Next Page and Last Page and check in this value if is null meanings the products is finished and will make this return Text
                                //   if (cubit.getRecommendedProductsModel!
                                //           .recommendedProducts!.length ==
                                //       cubit.loadMoreRecommendedProducts.length) {
                                //     return const Center(
                                //       child: Text('The End'),
                                //     );
                                //   } else {
                                //     return const Center(
                                //       child: CircularProgressIndicator(
                                //         color: AppColors.primaryColor,
                                //       ),
                                //     );
                                //   }
                                // }
                              }
                              // else {
                              // return Padding(
                              // padding: EdgeInsets.all(20.sp),
                              // child: const CircularProgressIndicator(
                              // color: AppColors.primaryColor,
                              // ),
                              // );
                              // }
                              // },
                              ),
                          if (isLoading)
                            cubit.getRecommendedProductsModel!
                                    .recommendedProducts!.isEmpty
                                ? Container(
                                    padding: EdgeInsets.only(
                                        top: 20.h, bottom: 50.h),
                                    height: 150.h,
                                    child: InkWell(
                                      onTap: scrollToTop,
                                      // child: const Icon(
                                      //   Icons.arrow_upward,
                                      //   color: AppColors.primaryColor,
                                      // ),
                                      child: Container(
                                        width: 130.w,
                                        height: 72.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(300.r),
                                          color: AppColors.whiteColor,
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.arrow_upward,
                                                color: AppColors.black3Color,
                                                size: 25.sp,
                                              ),
                                              // SizedBox(width: 10.w),
                                              Text(
                                                'Scroll up',
                                                style: AppFonts.bodyLargeBold,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    padding: EdgeInsets.only(
                                      top: 10.h,
                                      bottom: 50.h,
                                    ),
                                    // height: 100.h,
                                    child: Padding(
                                      padding: EdgeInsets.all(20.sp),
                                      child: SizedBox(
                                        width: 26.w,
                                        height: 26.h,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 4.w,
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(
                                            AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          SizedBox(height: 17.h),
                        ],
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
