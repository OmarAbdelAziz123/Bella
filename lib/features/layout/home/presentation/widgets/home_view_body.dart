// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:another_flushbar/flushbar.dart';
import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/data/models/get_recommended_products_model.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/home_view.dart';
import 'package:bella/features/layout/home/presentation/profie_view.dart';
import 'package:bella/features/layout/home/presentation/see_all__view.dart';
import 'package:bella/features/layout/home/presentation/widgets/product_details_screen.dart';
import 'package:bella/features/layout/home/presentation/widgets/products_in_company_screen.dart';
import 'package:bella/features/layout/home/presentation/widgets/terms_and_conditions.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  PageController? pageController;

  final int _selectedItemIndex = -1;

  Color colorOfIconAddToCart = Colors.black;

  Map<String, Color> buttonColors = {};

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
        var wishListCubit = BlocProvider.of<WishListCubit>(context);

        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);

            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: SingleChildScrollView(
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
                            // horizontal: 20.w,
                            // vertical: 18.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(AppAssets.bonoz),
                              GestureDetector(
                                onTap: () {
                                  navigatetoProfileScreen(context);
                                },
                                child: Container(
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
                        SearchBarWidget(
                          hintText: 'Search',
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          height: 35.h,
                          child: NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification: (overscroll) {
                              overscroll.disallowGlow();
                              return false;
                            },
                            child: ListView.builder(
                              padding: EdgeInsets.only(left: 13.w),
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 35.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 13.w,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: index == 0 ? 8.w : 8.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.bgColor,
                                    border: Border.all(
                                      width: 0.65.w,
                                      color: index == 0
                                          ? AppColors.bgColor
                                          : const Color(0xff444B67)
                                              .withOpacity(0.6),
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child: AppConstants.texts[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                    Container(
                      height: 324.h,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        top: 29.h,
                      ),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.main_container),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        children: [
                          /// See All
                          GestureDetector(
                            onTap: () => navigateToSeeAllScreen(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Text(
                                    'You might like',
                                    style: AppFonts.titleSubsection,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BlocBuilder<MyBrandsCubit, MyBrandsState>(
                                      builder: (context, state) {
                                        return Text(
                                          'See all',
                                          style: AppFonts.linkDefault.copyWith(
                                            height: 1.5.h,
                                            decoration:
                                                TextDecoration.underline,
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
                              ? const CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                )
                              : cubit.recommended!.recommendedCompanies == null
                                  ? const Text('Empty list')
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: cubit.recommended!
                                          .recommendedCompanies!.length,
                                      itemBuilder: (context, index) {
                                        var recommendedCompany = cubit
                                            .recommended!
                                            .recommendedCompanies![index];
                                        return FieldContainerWidget(
                                          image: recommendedCompany.logo
                                              .toString(),
                                          headText: recommendedCompany
                                              .displayName
                                              .toString(),
                                          subText: recommendedCompany
                                              .countryCode
                                              .toString(),
                                          onTapInLogo: () {},
                                          onTap: () {
                                            MyCache.putString(
                                                key: CacheKeys.comp_id,
                                                value: recommendedCompany.id
                                                    .toString());
                                            print('COMPANY ID');
                                            print(MyCache.getString(
                                                key: CacheKeys.comp_id));
                                            print('COMPANY ID');
                                            navigateToJoinScreen(
                                              recommendedCompany.id.toString(),
                                            );
                                          },
                                          onTapInAnyPlaceInCustomRecommendedCompany:
                                              () {
                                            MyCache.putString(
                                                key: CacheKeys.comp_id,
                                                value: recommendedCompany.id
                                                    .toString());
                                            print(recommendedCompany.id
                                                .toString());
                                            navigateToProductsInCompany(
                                              recommendedCompany.logo!,
                                              recommendedCompany.displayName!,
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
                    else
                      GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 13.w,
                          mainAxisSpacing: 13.h,
                          childAspectRatio: 1 / 1.72,
                          crossAxisCount: 2,
                        ),
                        itemCount: cubit.getRecommendedProductsModel!
                            .recommendedProducts!.length,
                        itemBuilder: (context, index) {
                          var product = cubit.getRecommendedProductsModel!
                              .recommendedProducts![index];

                          bool isSelected = index == _selectedItemIndex;

                          return BlocBuilder<WishListCubit, WishListState>(
                            builder: (context, state) {
                              var wishListCubit =
                                  BlocProvider.of<WishListCubit>(context);

                              return CustomRecommendedProducts(
                                logoOfCompany: product.company_logo,
                                imageOfProduct: product.imageLinks![0],
                                title: product.title!,
                                description: product.description!,
                                currency: product.pricing!.currency!,
                                regularPrice:
                                    product.pricing!.regularPrice ?? 0.0,
                                salePrice: product.pricing!.salePrice ?? 0.0,
                                customMemberOnly: product.membersOnly == true
                                    ? const CustomMemberOnly()
                                    : Container(),
                                widget: wishListCubit.checkProductInWishList(
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
                                buttonColor:
                                    wishListCubit.checkProductInWishList(
                                            productId: product.id!)
                                        ? AppColors.primaryColor
                                        : AppColors.whiteColor,
                                onTap: () {
                                  MyCache.putString(
                                    key: CacheKeys.comp_id,
                                    value: product.companyId.toString(),
                                  );
                                  navigateToProductDetailsScreen(product);
                                },
                                onTapAddToCart: () async {
                                  if (wishListCubit.checkProductInWishList(
                                      productId: product.id!)) {
                                    await wishListCubit.deleteOneItemInCart(
                                      id: wishListCubit.wishListModel[index]
                                          .products![index].id!,
                                      companyDisplayName: wishListCubit
                                          .wishListModel[index]
                                          .companyDisplayName!,
                                    );
                                    AppConstants.showFlushBar(
                                        context, 'Item has been removed');
                                  } else {
                                    await wishListCubit.addToCart(
                                      company_logo_link: product.company_logo!,
                                      company_display_name:
                                          product.company_display_name!,
                                      product_id: product.id!,
                                      product_image_link:
                                          product.imageLinks![0],
                                      product_title: product.title!,
                                      regular_price:
                                          product.pricing!.regularPrice,
                                      sale_price: product.pricing!.salePrice,
                                      currency: product.pricing!.currency,
                                    );
                                    AppConstants.showFlushBar(
                                        context, 'Item added to wishlist');
                                  }
                                },
                              );
                            },
                          );
                        },
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

  void navigatetoProfileScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const ProfileView(),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
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

  void navigateToSeeAllScreen() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const SeeAllView(),
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

  void navigatePop(BuildContext context) {
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

  void navigateToProductDetailsScreen(RecommendedProducts product) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (context, animation, secondaryAnimation) {
          return ProductDetailsScreen(product: product);
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

  void navigateToProductsInCompany(String logo, String display_name) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) {
          return ProductsInCompanyScreen(
            display_name: display_name,
            logo: logo,
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

  void navigateToJoinScreen(String companyId) {
    ///
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) {
          return TermsAndConditions(
            companyId: companyId,
            flow: 'Join',
            hasJoined: false,
            initialView: 'Home',
            onCancelButtonInFinalScreen: () {
              Navigator.pop(context);
              BlocProvider.of<MyBrandsCubit>(context)
                  .clearTermsAndConditionsState();
            },
            onTap: () {
              Navigator.pop(context);
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
}
