// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, non_constant_identifier_names, void_checks
import 'dart:io';
import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/home_navigation_functions/home_navigation_functions.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/home_view.dart';
import 'package:bella/features/layout/home/presentation/see_all__view.dart';
import 'package:bella/features/layout/home/presentation/widgets/coupons_screen_in_company_profile_screen.dart';
import 'package:bella/features/layout/home/presentation/widgets/products_by_category_screen.dart';
import 'package:bella/features/layout/home/presentation/widgets/receipts_screen_in_company_profile_screen.dart';
import 'package:bella/features/layout/home/presentation/widgets/terms_and_conditions.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/banner/banner.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_member_only.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_recommended_products.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/my_brands/my_brands_view.dart';
import 'package:bella/features/layout/offers/presentation/template.dart';
import 'package:bella/features/layout/wish_list/managers/wish_list_cubit/wish_list_cubit.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyProfileScreen extends StatefulWidget {
  String logo, display_name, initialScreen;

  void Function()? onBack;

  CompanyProfileScreen(
      {Key? key,
      required this.logo,
      required this.display_name,
      this.onBack,
      required this.initialScreen})
      : super(key: key);

  @override
  State<CompanyProfileScreen> createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  int selectedItem = 0;

  Color colorOfIconAddToCart = Colors.black;

  PageController? pageController;

  int calculateCrossAxisCount(double screenWidth) {
    const double desiredItemWidth = 120.0;
    int crossAxisCount = (screenWidth / desiredItemWidth).floor();
    crossAxisCount = crossAxisCount > 0 ? crossAxisCount : 1;

    return crossAxisCount;
  }

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getCompanyProducts();
    BlocProvider.of<HomeCubit>(context).companyProfileFunc();
    pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<HomeCubit>(context).resetCompanyProfile();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
        var wishListCubit = BlocProvider.of<WishListCubit>(context);

        List<String> yourList = List.generate(15, (index) => 'Item $index');

        void navigateToCouponsScreenInCompanyProfileScreen({
          required String companyLogo,
          required String title,
        }) {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 250),
              pageBuilder: (_, __, ___) => CouponsScreenInCompanyProfileScreen(
                companyLogo: companyLogo,
                title: title,
              ),
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

        void navigateToReceiptsScreenInCompanyProfileScreen({
          required String companyLogo,
          required String title,
        }) {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 250),
              pageBuilder: (_, __, ___) => ReceiptsScreenInCompanyProfileScreen(
                companyLogo: companyLogo,
                title: title,
              ),
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

        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<HomeCubit>(context);

            dynamic progressPercentage = (cubit.companyProfile!.balance! -
                    cubit.companyProfile!.start!) /
                (cubit.companyProfile!.end! - cubit.companyProfile!.start!) *
                318;
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
                  child: Text(
                    widget.display_name,
                    style: AppFonts.titleSubsection.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                leading: GestureDetector(
                  onTap: () {
                    widget.initialScreen == 'NewBrands' ||
                            widget.initialScreen == 'MyBrands'
                        ? navigatePopBrands(context)
                        : widget.initialScreen == 'Home'
                            ? navigatePopToHomeScreen(context)
                            : widget.initialScreen == 'SeeAll'
                                ? navigatePopToSeeAllScreen(context)
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Scaffold(),
                                    ),
                                  );
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
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: cubit.companyProfile == null
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.w),
                          child: Column(
                            children: [
                              SizedBox(height: 12.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40.r),
                                          child: AppConstants.showNetworkImage(
                                            image: widget.logo,
                                            width: 64.h,
                                            height: 64.h,
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 126.w,
                                      height: 32.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.grey8Color,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
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
                                              style:
                                                  GoogleFonts.darkerGrotesque(
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
                              ),
                              SizedBox(height: 19.h),
                              cubit.companyProfile!.hasLoyaltyProgram == false
                                  ? Container()
                                  : Container(
                                      width: 393.w,
                                      height: 187.h,
                                      padding: EdgeInsets.only(
                                        right: 30.w,
                                        left: 30.w,
                                        top: 36.h,
                                        bottom: 20.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 29.h,
                                                constraints: BoxConstraints(
                                                  maxWidth: 144.w,
                                                ),
                                                // padding: EdgeInsets.all(10.sp),
                                                decoration: BoxDecoration(
                                                  color: AppColors.primaryColor
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.r),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '${cubit.companyProfile!.balance} ${cubit.companyProfile!.unit}',
                                                    style: AppFonts
                                                        .bodyLargeBold
                                                        .copyWith(
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Reset on: ${cubit.companyProfile!.validTo}',
                                                style: AppFonts.productTag
                                                    .copyWith(
                                                  color: AppColors.black3Color
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 18.h),
                                          SizedBox(height: 10.h),
                                          Column(
                                            children: [
                                              ///   Progress
                                              Container(
                                                height: 6.h,
                                                width: 318.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          400.r),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      height: 6.h,
                                                      width: 318.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    400.r),
                                                        color:
                                                            AppColors.bgColor,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            height: 6.h,
                                                            width:
                                                                progressPercentage,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                400.r,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              ///
                                              SizedBox(
                                                width: 318.w,
                                                child: Row(
                                                  children: cubit
                                                      .companyProfile!
                                                      .milestones!
                                                      .map((milestone) {
                                                    double milestonePosition = (milestone
                                                                .limit! -
                                                            cubit
                                                                .companyProfile!
                                                                .start!) /
                                                        (cubit.companyProfile!
                                                                .end! -
                                                            cubit
                                                                .companyProfile!
                                                                .start!) *
                                                        318.w;
                                                    return Expanded(
                                                      child: Align(
                                                        alignment: Alignment(
                                                          milestonePosition /
                                                              318.w,
                                                          0,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 14.h,
                                                              child:
                                                                  VerticalDivider(
                                                                thickness:
                                                                    0.5.w,
                                                                width: 0.5.w,
                                                                color: milestone
                                                                            .reached ==
                                                                        true
                                                                    ? AppColors
                                                                        .primaryColor
                                                                    : AppColors
                                                                        .grey14Color,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 24.w,
                                                              height: 24.h,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            379.59.r),
                                                                color: milestone
                                                                            .reached ==
                                                                        true
                                                                    ? AppColors
                                                                        .primaryColor
                                                                    : AppColors
                                                                        .bgColor,
                                                              ),
                                                              child: Center(
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  milestone.reached ==
                                                                          true
                                                                      ? AppAssets
                                                                          .giftSvgLight
                                                                      : AppAssets
                                                                          .giftSvgDark,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 5.h),
                                                            Text(
                                                              '${milestone.limit} ${cubit.companyProfile!.unit}',
                                                              style: AppFonts
                                                                  .productTag
                                                                  .copyWith(
                                                                color: AppColors
                                                                    .black3Color
                                                                    .withOpacity(
                                                                        0.7),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                              // SizedBox(height: 44.h),
                              cubit.companyProfile!.hasJoined == true
                                  ? Container()
                                  : Padding(
                                      padding: EdgeInsets.only(
                                        right: 20.w,
                                        left: 20.w,
                                        top: 44.h,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          navigateToJoinScreen(
                                            context,
                                            MyCache.getString(
                                                key: CacheKeys.comp_id),
                                          );
                                        },
                                        child: Container(
                                          width: 353.w,
                                          height: 52.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(300.r),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Join',
                                              style: AppFonts.bodyLargeBold
                                                  .copyWith(
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              // SizedBox(height: 20.h),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                              //   child: GestureDetector(
                              //     onTap: () {
                              //       HomeNavigationClass
                              //           .navigateToProductsByCategoryScreen(
                              //         context: context,
                              //         widget.logo,
                              //         widget.display_name,
                              //       );
                              //     },
                              //     child: Container(
                              //       width: 353.w,
                              //       height: 52.h,
                              //       decoration: BoxDecoration(
                              //         color: AppColors.primaryColor,
                              //         borderRadius: BorderRadius.circular(300.r),
                              //       ),
                              //       child: Center(
                              //         child: Text(
                              //           'Catrgories',
                              //           style: AppFonts.bodyLargeBold.copyWith(
                              //             color: AppColors.whiteColor,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              SizedBox(height: 10.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  children: [
                                    /// Coupons
                                    GestureDetector(
                                      onTap: () {
                                        navigateToCouponsScreenInCompanyProfileScreen(
                                          companyLogo: widget.logo,
                                          title: widget.display_name,
                                        );
                                      },
                                      child: Container(
                                        width: 171.w,
                                        height: 83.h,
                                        margin: EdgeInsets.only(right: 11.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.grey15Color,
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 14.h),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 14.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Coupons',
                                                    style: AppFonts.productName,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 14.sp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 18.h),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 12.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SvgPicture.asset(
                                                      AppAssets.coupon,
                                                      width: 32.w,
                                                      height: 32.h),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    /// Receipts
                                    GestureDetector(
                                      onTap: () {
                                        navigateToReceiptsScreenInCompanyProfileScreen(
                                          companyLogo: widget.logo,
                                          title: widget.display_name,
                                        );
                                      },
                                      child: Container(
                                        width: 171.w,
                                        height: 83.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.grey15Color,
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 14.h),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 14.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Receipts',
                                                    style: AppFonts.productName,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 14.sp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 18.h),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 12.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SvgPicture.asset(
                                                      AppAssets.receipt,
                                                      width: 32.w,
                                                      height: 32.h),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 26.h),
                              Padding(
                                padding: EdgeInsets.only(left: 24.w),
                                child: Row(
                                  children: [
                                    Text(
                                      'General offers',
                                      style: AppFonts.bodyLargeBold,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 13.h),
                              CustomPageView(
                                onPageChanged: (p0) {},
                                pageController: pageController!,
                              ),

                              /// Get Company Products
                              // state is GetCompanyProductsLoadingState
                              //     ? const CircularProgressIndicator(
                              //         color: AppColors.primaryColor,
                              //       )
                              //     : cubit.getCompanyProductsModel == null
                              //         ? const CircularProgressIndicator(
                              //             color: AppColors.primaryColor,
                              //           )
                              //         : cubit.getCompanyProductsModel!
                              //                 .companyProducts!.isEmpty
                              //             ? Text(
                              //                 'No products',
                              //                 style: GoogleFonts.inter(
                              //                   fontWeight: FontWeight.w600,
                              //                   fontSize: 16.sp,
                              //                   color: AppColors.blackColor,
                              //                 ),
                              //               )
                              //             : BlocBuilder<WishListCubit, WishListState>(
                              //                 builder: (context, state) {
                              //                   var wishCubit =
                              //                       BlocProvider.of<WishListCubit>(
                              //                           context);
                              //                   return GridView.builder(
                              //                     padding: EdgeInsets.symmetric(
                              //                         horizontal: 20.w),
                              //                     physics:
                              //                         const NeverScrollableScrollPhysics(),
                              //                     shrinkWrap: true,
                              //                     gridDelegate:
                              //                         SliverGridDelegateWithFixedCrossAxisCount(
                              //                       crossAxisSpacing: 13.w,
                              //                       mainAxisSpacing: 13.h,
                              //                       childAspectRatio: 1 / 1.72,
                              //                       crossAxisCount: 2,
                              //                     ),
                              //                     itemCount: cubit
                              //                         .getCompanyProductsModel!
                              //                         .companyProducts!
                              //                         .length,
                              //                     itemBuilder: (context, index) {
                              //                       var products = cubit
                              //                           .getCompanyProductsModel!
                              //                           .companyProducts![index];

                              //                       return CustomRecommendedProducts(
                              //                         logoOfCompany:
                              //                             products.company_logo,
                              //                         imageOfProduct:
                              //                             products.imageLinks![0],
                              //                         title: products.title!,
                              //                         description:
                              //                             products.description!,
                              //                         currency:
                              //                             products.pricing!.currency!,
                              //                         regularPrice: products.pricing!
                              //                                 .regularPrice ??
                              //                             0.0,
                              //                         salePrice: products
                              //                                 .pricing!.salePrice ??
                              //                             0.0,
                              //                         customMemberOnly: products
                              //                                     .membersOnly ==
                              //                                 true
                              //                             ? const CustomMemberOnly()
                              //                             : Container(),
                              //                         onTap: () {},
                              //                         widget: wishListCubit
                              //                                 .checkProductInWishList(
                              //                           productId: products.id!,
                              //                         )
                              //                             ? SvgPicture.asset(
                              //                                 AppAssets.Vector,
                              //                                 width: 12.46.w,
                              //                                 height: 12.46.h,
                              //                                 color: AppColors
                              //                                     .whiteColor,
                              //                               )
                              //                             : SvgPicture.asset(
                              //                                 AppAssets.add,
                              //                                 width: 12.46.w,
                              //                                 height: 12.46.h,
                              //                                 color: AppColors
                              //                                     .primaryColor,
                              //                               ),
                              //                         buttonColor: wishListCubit
                              //                                 .checkProductInWishList(
                              //                                     productId:
                              //                                         products.id!)
                              //                             ? AppColors.primaryColor
                              //                             : AppColors.whiteColor,
                              //                         onTapAddToCart: () {
                              //                           AppConstants.showFlushBar(
                              //                               context,
                              //                               'Item added to wishlist');
                              //                           wishCubit.addToCart(
                              //                             company_logo_link: cubit
                              //                                 .getRecommendedProductsModel!
                              //                                 .recommendedProducts![
                              //                                     index]
                              //                                 .company_logo!,
                              //                             company_display_name: cubit
                              //                                 .getRecommendedProductsModel!
                              //                                 .recommendedProducts![
                              //                                     index]
                              //                                 .company_display_name!,
                              //                             product_id: cubit
                              //                                 .getRecommendedProductsModel!
                              //                                 .recommendedProducts![
                              //                                     index]
                              //                                 .id!,
                              //                             product_image_link: cubit
                              //                                 .getRecommendedProductsModel!
                              //                                 .recommendedProducts![
                              //                                     index]
                              //                                 .imageLinks![0],
                              //                             product_title: cubit
                              //                                 .getRecommendedProductsModel!
                              //                                 .recommendedProducts![
                              //                                     index]
                              //                                 .title!,
                              //                             regular_price: cubit
                              //                                 .getRecommendedProductsModel!
                              //                                 .recommendedProducts![
                              //                                     index]
                              //                                 .pricing!
                              //                                 .regularPrice,
                              //                             sale_price: cubit
                              //                                 .getRecommendedProductsModel!
                              //                                 .recommendedProducts![
                              //                                     index]
                              //                                 .pricing!
                              //                                 .salePrice,
                              //                             currency: cubit
                              //                                 .getRecommendedProductsModel!
                              //                                 .recommendedProducts![
                              //                                     index]
                              //                                 .pricing!
                              //                                 .currency,
                              //                           );
                              //                         },
                              //                       );
                              //                     },
                              //                   );
                              //                 },
                              //               ),
                              SizedBox(height: 27.h),
                              Padding(
                                padding: EdgeInsets.only(left: 24.w),
                                child: Row(
                                  children: [
                                    Text(
                                      'Products Categories',
                                      style: AppFonts.bodyLargeBold,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              // LayoutBuilder(
                              //   builder: (BuildContext context,
                              //       BoxConstraints constraints) {
                              //     final double screenWidth = constraints.maxWidth;
                              //
                              //     return state is CompanyProfileLoadingState
                              //         ? const CircularProgressIndicator(
                              //             color: AppColors.primaryColor,
                              //           )
                              //         : cubit.companyProfile!.productCategories!
                              //                 .isEmpty
                              //             ? Text(
                              //                 'There is no category yet',
                              //                 style: AppFonts.bodyLargeBold,
                              //               )
                              //             : SizedBox(
                              //                 child: GridView.builder(
                              //                   physics:
                              //                       const NeverScrollableScrollPhysics(),
                              //                   shrinkWrap: true,
                              //                   itemCount: cubit.companyProfile!
                              //                       .productCategories!.length,
                              //                   gridDelegate:
                              //                       SliverGridDelegateWithFixedCrossAxisCount(
                              //                     crossAxisCount:
                              //                         calculateCrossAxisCount(
                              //                             screenWidth),
                              //                     childAspectRatio: 2.2,
                              //                   ),
                              //                   itemBuilder: (BuildContext context,
                              //                       int index) {
                              //                     return InkWell(
                              //                       onTap: () {
                              //                         navigateToProductByCategoryScreen(
                              //                           context,
                              //                           cubit.companyProfile!
                              //                                   .productCategories![
                              //                               index],
                              //                         );
                              //                       },
                              //                       child: LayoutBuilder(
                              //                         builder: (BuildContext context,
                              //                             BoxConstraints
                              //                                 constraints) {
                              //                           return Container(
                              //                             margin: EdgeInsets.only(
                              //                               right: 5.sp,
                              //                               bottom: 5.h,
                              //                             ),
                              //                             // height: 34.h,
                              //                             decoration: BoxDecoration(
                              //                               color:
                              //                                   AppColors.grey15Color,
                              //                               borderRadius:
                              //                                   BorderRadius.circular(
                              //                                 10.r,
                              //                               ),
                              //                             ),
                              //                             child: Padding(
                              //                               padding:
                              //                                   EdgeInsets.all(12.sp),
                              //                               child: Center(
                              //                                 child: Text(
                              //                                   cubit.companyProfile!
                              //                                           .productCategories![
                              //                                       index],
                              //                                   style: AppFonts
                              //                                       .productName,
                              //                                   // overflow:
                              //                                   //     TextOverflow
                              //                                   //         .ellipsis,
                              //                                   // maxLines: 1,
                              //                                 ),
                              //                               ),
                              //                             ),
                              //                           );
                              //                         },
                              //                       ),
                              //                     );
                              //                   },
                              //                 ),
                              //               );
                              //   },
                              // )
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 10.h);
                                },
                                itemCount: cubit
                                    .companyProfile!.productCategories!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      navigateToProductByCategoryScreen(
                                        context,
                                        cubit.companyProfile!
                                            .productCategories![index],
                                      );
                                    },
                                    child: Container(
                                      height: 45.h,
                                      width: 356.w,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      decoration: BoxDecoration(
                                        color: AppColors.grey15Color,
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            cubit.companyProfile!
                                                .productCategories![index],
                                            style: AppFonts.productName,
                                          ),
                                          SvgPicture.asset(
                                            AppAssets.listTileIcon,
                                          ),
                                        ],
                                      ),
                                      // child: ListTile(
                                      //   title: Text(
                                      //     cubit.companyProfile!
                                      //         .productCategories![index],
                                      //     style: AppFonts.productName
                                      //         // .copyWith(height: -0.3.h),
                                      //   ),
                                      //   onTap: () {
                                      //     navigateToProductByCategoryScreen(
                                      //       context,
                                      //       cubit.companyProfile!
                                      //           .productCategories![index],
                                      //     );
                                      //   },
                                      //   trailing: SvgPicture.asset(
                                      //     AppAssets.listTileIcon,
                                      //   ),
                                      // ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 25.h),
                            ],
                          ),
                        ),
                      ),
              ),
            );
          },
        );
      },
    );
  }

  void navigatePop() {
    Navigator.pop(context);
  }

  void navigateToJoinScreen(BuildContext context, String item) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) {
          return TermsAndConditions(
            companyId: item,
            flow: 'Join',
            hasJoined: false,
            initialScreen: widget.initialScreen,
            onCancelButtonInFinalScreen: () {
              navigatePopToCompanyProfile(
                context,
                widget.logo,
                widget.display_name,
                Navigator.pop(context),
              );
              BlocProvider.of<MyBrandsCubit>(context)
                  .clearTermsAndConditionsState();
            },
            onSuccessButton: () {
              BlocProvider.of<MyBrandsCubit>(context).joinedFunction();
              BlocProvider.of<MyBrandsCubit>(context)
                  .notJoinedFunction(context);
              BlocProvider.of<HomeCubit>(context).getRecommended();
              BlocProvider.of<HomeCubit>(context).getAllCompanies();
              AppConstants.showFlushBar(context, 'You have joined right now');
              sleep(const Duration(seconds: 3));
              navigatePopToCompanyProfile(
                context,
                widget.logo,
                widget.display_name,
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 250),
                    pageBuilder: (_, __, ___) => CompanyProfileScreen(
                      logo: widget.logo,
                      display_name: widget.display_name,
                      initialScreen: widget.initialScreen,
                    ),
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                  ),
                ),
              );
            },
            initialView: 'NewBrands',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyBrandsView(),
                ),
              );
              BlocProvider.of<MyBrandsCubit>(context)
                  .clearTermsAndConditionsState();
            },
          );
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  void navigateToProductByCategoryScreen(
      BuildContext context, String categoryName) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) {
          return ProductByCategory(
            logo: widget.logo,
            display_name: widget.display_name,
            initialScreen: widget.initialScreen,
            categoryName: categoryName,
          );
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  void navigatePopToHomeScreen(
    BuildContext context,
  ) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const HomeView(),
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

  void navigatePopToSeeAllScreen(
    BuildContext context,
  ) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const SeeAllView(),
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

  void navigatePopBrands(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => MyBrandsView(),
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

  void navigatePopToCompanyProfile(BuildContext context, String logo,
      String display_name, void navigatePop) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => CompanyProfileScreen(
          logo: logo,
          display_name: display_name,
          initialScreen: widget.initialScreen,
          onBack: () {
            Navigator.pop(context);
          },
        ),
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

class StepperComponent extends StatelessWidget {
  int index;

  int currentIndex;

  VoidCallback onTap;

  bool isLast;

  StepperComponent({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLast
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(379.59.r),
                        color: index == currentIndex
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        image: DecorationImage(
                          image: AssetImage(
                            index == currentIndex
                                ? AppAssets.gift2white
                                : AppAssets.gift2,
                          ),
                        ),
                        border: Border.all(
                          color: currentIndex >= index
                              ? AppColors.primaryColor
                              : Colors.black12,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: currentIndex >= index + 1
                        ? AppColors.primaryColor
                        : Colors.black12,
                  ),
                ],
              ),
              Text(
                'Page ${index + 1}',
                style: AppFonts.productTag.copyWith(
                  color: AppColors.black3Color.withOpacity(0.7),
                ),
              ),
            ],
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(379.59.r),
                          color: index == currentIndex
                              ? AppColors.primaryColor
                              : Colors.transparent,
                          border: Border.all(
                            color: currentIndex >= index
                                ? AppColors.primaryColor
                                : Colors.black12,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              index == currentIndex
                                  ? AppAssets.gift2white
                                  : AppAssets.gift2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 6.h,
                        color: currentIndex >= index + 1
                            ? AppColors.primaryColor
                            : Colors.black12,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Page ${index + 1}',
                  style: AppFonts.productTag.copyWith(
                    color: AppColors.black3Color.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          );
  }
}
