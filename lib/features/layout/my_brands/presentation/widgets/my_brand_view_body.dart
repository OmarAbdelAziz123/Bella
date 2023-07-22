import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/presentation/widgets/products_in_company_screen.dart';
import 'package:bella/features/layout/home/presentation/widgets/terms_and_conditions.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/field_container_widget.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/my_brands/company_details_view.dart';
import 'package:bella/features/layout/my_brands/presentation/my_brands/my_brands_view.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBrandViewBody extends StatefulWidget {
  const MyBrandViewBody({Key? key}) : super(key: key);

  @override
  State<MyBrandViewBody> createState() => _MyBrandViewBodyState();
}

class _MyBrandViewBodyState extends State<MyBrandViewBody> {
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.r,
                      spreadRadius: 0,
                      color: AppColors.whiteColor.withOpacity(0.08),
                      offset: const Offset(0, 0.66),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: TabBar(
                    padding: EdgeInsets.all(5.sp),
                    indicatorColor: Colors.transparent,
                    physics: const NeverScrollableScrollPhysics(),
                    isScrollable: false,
                    unselectedLabelStyle: AppFonts.bodySmallBold,
                    onTap: (current) {
                      setState(() {
                        currentIndex = current;
                      });
                    },
                    unselectedLabelColor: AppColors.whiteColor,
                    labelStyle: AppFonts.bodySmallBold
                        .copyWith(color: AppColors.whiteColor),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: AppColors.primaryColor,
                    ),
                    tabs: [
                      BlocBuilder<MyBrandsCubit, MyBrandsState>(
                        builder: (context, state) {
                          var cubit = BlocProvider.of<MyBrandsCubit>(context);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "My brands",
                                style: AppFonts.bodyLargeBold.copyWith(
                                  color: currentIndex == 0
                                      ? AppColors.whiteColor
                                      : AppColors.black3Color,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.w),
                                width: 20.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(400.r),
                                  color: currentIndex == 0
                                      ? AppColors.whiteColor
                                      : AppColors.black3Color,
                                ),
                                child: Center(
                                  child: Text(
                                    '${cubit.allJoined == null ? '...' : cubit.allJoined!.companies!.length}',
                                    style: currentIndex == 0
                                        ? AppFonts.bodySmallBold.copyWith(
                                            color: AppColors.primaryColor,
                                          )
                                        : AppFonts.bodySmallBold.copyWith(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      BlocBuilder<MyBrandsCubit, MyBrandsState>(
                        builder: (context, state) {
                          var cubit = BlocProvider.of<MyBrandsCubit>(context);

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New brands",
                                style: AppFonts.bodyLargeBold.copyWith(
                                  color: currentIndex == 1
                                      ? AppColors.whiteColor
                                      : AppColors.black3Color,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.w),
                                width: 20.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(400.r),
                                  color: currentIndex == 1
                                      ? AppColors.whiteColor
                                      : AppColors.black3Color,
                                ),
                                child: Center(
                                  child: Text(
                                    '${cubit.allNotJoined == null ? '...' : cubit.allNotJoined!.companies!.length}',
                                    style: currentIndex == 1
                                        ? AppFonts.bodySmallBold.copyWith(
                                            color: AppColors.primaryColor,
                                          )
                                        : AppFonts.bodySmallBold.copyWith(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      // Text("تم الانتهاء"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 590.h,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    BlocBuilder<MyBrandsCubit, MyBrandsState>(
                      builder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: const TabBarView1(),
                        );
                      },
                    ),
                    const TabBarView2(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainerInMyBrands extends StatelessWidget {
  final String image, text;
  void Function()? onTap;

  CustomContainerInMyBrands({
    Key? key,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: 110.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.08),
              spreadRadius: 0,
              blurRadius: 4.r,
              offset: const Offset(1, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 45.h,
              height: 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.r,
                    color: AppColors.blackColor.withOpacity(0.14),
                    offset: const Offset(0, 0.66),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      AppAssets.notFound,
                      height: 45.h,
                      width: 45.w,
                      fit: BoxFit.cover,
                    );
                  },
                  height: 45.h,
                  width: 45.w,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: 96.w,
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppFonts.capsolButton.copyWith(
                  letterSpacing: -0.2,
                  height: 1.h,
                ),
              ),
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}

class TabBarView1 extends StatelessWidget {
  const TabBarView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarWidget(hintText: 'Search brands'),
        SizedBox(height: 18.h),
        Flexible(
          child: BlocConsumer<MyBrandsCubit, MyBrandsState>(
            listener: (context, state) {
              if (state is JoinedErrorState) {
                SnackBar snak =
                    const SnackBar(content: Text("Error in Joined"));
                ScaffoldMessenger.of(context).showSnackBar(snak);
              }
            },
            builder: (context, state) {
              var cubit = BlocProvider.of<MyBrandsCubit>(context);

              return cubit.allJoined == null
                  ? const Center(child: CircularProgressIndicator())
                  : NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                        return false;
                      },
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: cubit.allJoined!.companies!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 11,
                          mainAxisSpacing: 11.h,
                        ),
                        itemBuilder: (context, index) {
                          var list = cubit.allJoined!.companies![index];
                          return CustomContainerInMyBrands(
                            onTap: () {
                              print('44');
                              navigateToCompanyDetails(context);
                            },
                            image: list.logo.toString(),
                            text: list.displayName.toString(),
                          );
                        },
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }

  void navigateToCompanyDetails(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const CompanyDetailsView(),
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
}

class TabBarView2 extends StatelessWidget {
  const TabBarView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarWidget(hintText: 'Search brands'),
        SizedBox(height: 18.h),
        Flexible(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return false;
            },
            child: ListView.builder(
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
                          : const Color(0xff444B67).withOpacity(0.6),
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
        SizedBox(height: 18.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 468.h,
          child: BlocConsumer<MyBrandsCubit, MyBrandsState>(
            listener: (context, state) {
              if (state is NotJoinedErrorState) {
                SnackBar snak = const SnackBar(content: Text("Error"));
                ScaffoldMessenger.of(context).showSnackBar(snak);
              }
            },
            builder: (context, state) {
              var cubit = BlocProvider.of<MyBrandsCubit>(context);
              return cubit.allNotJoined == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                        return false;
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cubit.allNotJoined!.companies!.length,
                        itemBuilder: (context, index) {
                          var company = cubit.allNotJoined!.companies![index];
                          return FieldContainerWidget(
                            image: company.logo ?? '',
                            headText: company.displayName.toString(),
                            subText: company.countryCode.toString(),
                            onTapInLogo: () {},
                            onTap: () {
                              MyCache.putString(
                                  key: CacheKeys.comp_id,
                                  value: company.id.toString());
                              navigateToJoinScreen(
                                  context, company.id.toString());
                            },
                            onTapInAnyPlaceInCustomRecommendedCompany: () {
                              MyCache.putString(
                                  key: CacheKeys.comp_id,
                                  value: company.id.toString());
                              print(company.id.toString());
                              navigateToProductsInCompany(
                                  context, company.displayName!, company.logo!);
                            },
                          );
                        },
                      ),
                    );
            },
          ),
        ),
      ],
    );
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
            onCancelButtonInFinalScreen: () {
              navigatePop(context);
              BlocProvider.of<MyBrandsCubit>(context)
                  .clearTermsAndConditionsState();
            },
            initialView: 'NewBrands',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyBrandsView(),
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
    // }
  }

  void navigateToProductsInCompany(
      BuildContext context, String display_name, String logo) {
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

  void navigatePop(BuildContext context) {
    Navigator.pop(context);
  }
}
