// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'dart:developer';

import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/home_navigation_functions/home_navigation_functions.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/banner/banner.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_member_only.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_recommended_products.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/field_container_widget.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/verification_an_email_widget.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/wish_list/managers/wish_list_cubit/wish_list_cubit.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewBody extends StatefulWidget {
  String initialScreen = 'Home';

  HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  PageController? pageController;

  int page = 1;
  ScrollController scrollController = ScrollController();

  bool _isLoading = false;

  Color colorOfIconAddToCart = Colors.black;

  Map<String, Color> buttonColors = {};

  List dataList = <int>[];
  bool isLoading = false;
  int pageCount = 0;

  @override
  void initState() {
    // log(scrollController.hasClients.toString());
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels ==
    //       scrollController.position.maxScrollExtent) {
    //     // BlocProvider.of<HomeCubit>(context).index =
    //     // BlocProvider.of<HomeCubit>(context).index + 1;
    //     BlocProvider.of<HomeCubit>(context).loadMore();
    //     log('OOOOOOOOOOOOOOOOOOOO');
    //   }
    // });
    // addItemIntoLisT(1);
    log('$pageCount in Init State');
    BlocProvider.of<HomeCubit>(context)
        .getRecommendedProducts(pageNumber: pageCount, pageSize: 20);
    scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(scrollListener);
    super.initState();
    pageController = PageController(
      initialPage: 0,
    );

    // BlocProvider.of<HomeCubit>(context).loadMore();
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

          BlocProvider.of<HomeCubit>(context)
              .getRecommendedProducts(pageNumber: pageCount, pageSize: 20);
          // addItemIntoLisT(pageCount);
        }
      });
    }
  }

  // void addItemIntoLisT(var pageCount) {
  //   for (int i = (pageCount * 10) - 10; i < pageCount * 10; i++) {
  //     dataList.add(i);
  //     isLoading = false;
  //   }
  // }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);

            return cubit.getRecommendedProductsModel == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowIndicator();
                      return false;
                    },
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: ScrollPhysics(),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 20.h,
                                  bottom: 25.h,
                                  right: 20.w,
                                  left: 20.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(AppAssets.BellaIcon),
                                    GestureDetector(
                                      onTap: () {
                                        HomeNavigationClass
                                            .navigateToProfileScreen(context);
                                      },
                                      child: SizedBox(
                                        width: 30.h,
                                        height: 26.h,
                                        child: SvgPicture.asset(
                                          AppAssets.userIcon,
                                          height: 26.h,
                                          width: 26.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const VerificationAnEmailWidget(),
                              // Container(
                              //   height: 50.h,
                              //   width: 353.w,
                              //   decoration: BoxDecoration(
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: AppColors.blackColor
                              //             .withOpacity(0.15),
                              //         spreadRadius: 0,
                              //         blurRadius: 14,
                              //         offset: const Offset(0, 4),
                              //       ),
                              //     ],
                              //   ),
                              //   child: SearchBarWidget(
                              //     hintText: 'Search',
                              //   ),
                              // ),
                              // SizedBox(height: 20.h),
                              // SizedBox(
                              //   height: 35.h,
                              //   child: NotificationListener<
                              //       OverscrollIndicatorNotification>(
                              //     onNotification: (overscroll) {
                              //       overscroll.disallowIndicator();
                              //       return false;
                              //     },
                              //     child: ListView.builder(
                              //       padding: EdgeInsets.only(left: 13.w),
                              //       scrollDirection: Axis.horizontal,
                              //       itemCount: 6,
                              //       itemBuilder: (context, index) {
                              //         return Container(
                              //           height: 35.h,
                              //           padding: EdgeInsets.symmetric(
                              //             horizontal: 13.w,
                              //           ),
                              //           margin: EdgeInsets.only(
                              //             right: index == 0 ? 8.w : 8.w,
                              //           ),
                              //           decoration: BoxDecoration(
                              //             color: AppColors.bgColor,
                              //             border: Border.all(
                              //               width: 0.65.w,
                              //               color: index == 0
                              //                   ? AppColors.bgColor
                              //                   : const Color(0xff444B67)
                              //                       .withOpacity(0.6),
                              //             ),
                              //             borderRadius:
                              //                 BorderRadius.circular(10.r),
                              //           ),
                              //           child: Center(
                              //             child: AppConstants.texts[index],
                              //           ),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                          cubit.recommended == null
                              ? Container()
                              : Container(
                                  height: 324.h,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                    left: 20.w,
                                    right: 20.w,
                                    top: 29.h,
                                  ),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage(AppAssets.main_container),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      /// See All
                                      GestureDetector(
                                        onTap: () => HomeNavigationClass
                                            .navigateToSeeAllScreen(
                                                context: context),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.w),
                                              child: Text(
                                                'You might like',
                                                style: AppFonts.titleSubsection,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                BlocBuilder<MyBrandsCubit,
                                                    MyBrandsState>(
                                                  builder: (context, state) {
                                                    return Text(
                                                      'See all',
                                                      style: AppFonts
                                                          .linkDefault
                                                          .copyWith(
                                                        height: 1.5.h,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 17.h),

                                      /// Recommended Companies
                                      cubit.recommended == null
                                          ? Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 110.h),
                                                child: SizedBox(
                                                  width: 25.w,
                                                  height: 24.h,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 4.w,
                                                    valueColor:
                                                        const AlwaysStoppedAnimation<
                                                            Color>(
                                                      AppColors.primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : cubit.recommended!
                                                      .recommendedCompanies ==
                                                  null
                                              ? const Text('Empty list')
                                              : ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: cubit
                                                      .recommended!
                                                      .recommendedCompanies!
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var recommendedCompany = cubit
                                                            .recommended!
                                                            .recommendedCompanies![
                                                        index];
                                                    return FieldContainerWidget(
                                                      image: recommendedCompany
                                                          .logo
                                                          .toString(),
                                                      headText:
                                                          recommendedCompany
                                                              .displayName
                                                              .toString(),
                                                      subText:
                                                          recommendedCompany
                                                              .countryCode
                                                              .toString(),
                                                      onTapInLogo: () {},
                                                      onTap: () {
                                                        MyCache.putString(
                                                            key: CacheKeys
                                                                .comp_id,
                                                            value:
                                                                recommendedCompany
                                                                    .id
                                                                    .toString());

                                                        HomeNavigationClass
                                                            .navigateToJoinScreen(
                                                          recommendedCompany.id
                                                              .toString(),
                                                          context: context,
                                                        );
                                                      },
                                                      onTapInAnyPlaceInCustomRecommendedCompany:
                                                          () {
                                                        MyCache.putString(
                                                            key: CacheKeys
                                                                .comp_id,
                                                            value:
                                                                recommendedCompany
                                                                    .id
                                                                    .toString());
                                                        HomeNavigationClass
                                                            .navigateToCompanyProfile(
                                                          displayName:
                                                              recommendedCompany
                                                                  .displayName!,
                                                          logo:
                                                              recommendedCompany
                                                                  .logo!,
                                                          context: context,
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                    ],
                                  ),
                                ),
                          CustomPageView(
                            onPageChanged: (p0) {},
                            pageController: pageController!,
                          ),
                          SizedBox(height: 17.h),
                          if (cubit.getRecommendedProductsModel == null)
                            const CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            )

                          /// Products
                          else
                            // GridView.count(
                            //   shrinkWrap: true,
                            //   // controller: scrollController,
                            //   scrollDirection: Axis.vertical,
                            //   crossAxisCount: 2,
                            //   mainAxisSpacing: 10.0,
                            //   physics: const NeverScrollableScrollPhysics(),
                            //   children: dataList.map((value) {
                            //     return Container(
                            //       alignment: Alignment.center,
                            //       height: MediaQuery.of(context).size.height * 0.2,
                            //       margin: EdgeInsets.only(left: 10.0, right: 10.0),
                            //       decoration: BoxDecoration(
                            //         border: Border.all(color: Colors.black),
                            //       ),
                            //       child: Text("Item ${value}"),
                            //     );
                            //   }).toList(),
                            // ),
                            /// Grid
                            GridView.builder(
                                clipBehavior: Clip.none,
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 12.w,
                                  mainAxisSpacing: 12.h,
                                  childAspectRatio: 0.98 / 1.72,
                                  crossAxisCount: 2,
                                ),
                                itemCount:
                                    cubit.loadMoreRecommendedProducts.length,
                                itemBuilder: (context, index) {
                                  if (index <
                                      cubit
                                          .loadMoreRecommendedProducts.length) {
                                    var product = cubit
                                        .loadMoreRecommendedProducts[index];

                                    return BlocBuilder<WishListCubit,
                                        WishListState>(
                                      builder: (context, state) {
                                        var wishListCubit =
                                            BlocProvider.of<WishListCubit>(
                                                context);

                                        return CustomRecommendedProducts(
                                          logoOfCompany: product.companyLogo,
                                          imageOfProduct: product.imageLink,
                                          title: product.name!,
                                          description: product.description!,
                                          currency:
                                              product.newPrice!.unit ?? 'kr',
                                          regularPrice:
                                              product.oldPrice!.price ?? 0.0,
                                          salePrice:
                                              product.newPrice!.price ?? 0.0,
                                          customMemberOnly:
                                              product.membersOnly == true
                                                  ? const CustomMemberOnly()
                                                  : Container(),
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
                                          onTap: () {
                                            MyCache.putString(
                                              key: CacheKeys.comp_id,
                                              value:
                                                  product.companyId.toString(),
                                            );
                                            HomeNavigationClass
                                                .navigateToProductDetailsScreen(
                                                    product,
                                                    context: context);
                                          },
                                          onTapAddToCart: () async {
                                            if (wishListCubit
                                                .checkProductInWishList(
                                                    productId: product.id!)) {
                                              print('Delete');
                                              await wishListCubit
                                                  .deleteOneItemInCart(
                                                // id: wishListCubit
                                                // .wishListModel[index]
                                                // .products![index]
                                                // .id!,
                                                // id: wishListCubit
                                                //     .wishListModelCopy[index]
                                                //     .products![index]
                                                //     .productId!,
                                                productId: product.id!,
                                                // companyDisplayName:
                                                //     wishListCubit
                                                //         .wishListModel[index]
                                                //         .companyDisplayName!,
                                                companyDisplayName:
                                                    product.companyDisplayName!,
                                                onTapSource: 'HomeScreen',
                                              );
                                              AppConstants.showFlushBar(context,
                                                  'Item has been removed');
                                            } else {
                                              print('Add To Card');
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
                                                saving_in_SEK:
                                                    product.savingInSEK!,
                                              );
                                              AppConstants.showFlushBar(context,
                                                  'Item added to wishlist');
                                            }
                                          },
                                          campaign_type: product.campaignText!,
                                        );
                                      },
                                    );
                                  } else {
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
                                    padding: EdgeInsets.only(top: 20.h),
                                    height: 100.h,
                                    child: Text(
                                      'The End',
                                      style: AppFonts.bodyLargeBold,
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.all(20.sp),
                                    child: SizedBox(
                                      width: 26.w,
                                      height: 26.h,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 4.w,
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                          AppColors.primaryColor,
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

  loadMore() async {}
}
