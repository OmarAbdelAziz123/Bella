import 'package:bella/features/layout/home/data/models/all_companies.dart';
import 'package:bella/features/layout/home/data/models/see_all_model.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/widgets/join_view_body_in_hone.dart';
import 'package:bella/features/layout/home/presentation/widgets/joine_view_body_in_brands.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/field_container_widget.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
import 'package:bella/features/layout/my_brands/data/models/not_joined_model.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/my_brands/my_brands_view.dart';
import 'package:bella/features/layout/my_brands/presentation/new_brands/details_in_new_brand_view.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBrandViewBody2 extends StatelessWidget {
  const MyBrandViewBody2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBrandsCubit, MyBrandsState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<MyBrandsCubit>(context);
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Brands',
              style: GoogleFonts.darkerGrotesque(
                height: 1.h,
                fontWeight: FontWeight.bold,
                fontSize: 28.sp,
                color: AppColors.black3Color,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7.sp),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => navigateToSeeAllScreen(context),
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.myBrandIcon2,
                                    height: 18.h,
                                    width: 18.h,
                                    color: AppColors.black3Color,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    'My brands (${cubit.allCompanies.length})',
                                    style: GoogleFonts.darkerGrotesque(
                                      height: 1.h,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: AppColors.black3Color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(35.sp),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.starsIcon,
                                  height: 15.h,
                                  width: 15.h,
                                  color: AppColors.whiteColor,
                                ),
                                SizedBox(width: 6.5.w),
                                Text(
                                  'New brands (${cubit.notJoined.length})',
                                  style: GoogleFonts.darkerGrotesque(
                                    height: 1.h,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const SearchBarWidget(hintText: 'Search brands'),
                ),
                SizedBox(height: 18.h),
                SizedBox(
                  height: 35.h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 35.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.9.w,
                        ),
                        margin: EdgeInsets.only(
                          right: index == 0 ? 8.w : 8.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Center(
                          child: Text(
                            AppConstants.texts[index],
                            style: GoogleFonts.darkerGrotesque(
                              height: 1.h,
                              color: AppColors.black3Color,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 18.h),
                state is GetAllCompaniesLoadingState
                    ? const CircularProgressIndicator()
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SizedBox(
                          height: 490.h,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cubit.notJoined.length,
                            itemBuilder: (context, index) {
                              return FieldContainerWidget(
                                image: cubit.notJoined[index].logo.toString(),
                                headText: cubit.notJoined[index].displayName
                                    .toString(),
                                subText: cubit.notJoined[index].countryCode
                                    .toString(),
                                onTapInLogo: () {},
                                onTap: () {
                                  // cubit.allCompanies[index].id;
                                  List<CompaniesNotJoined> item =
                                      BlocProvider.of<MyBrandsCubit>(context)
                                          .notJoined;
                                  // print(item[index].termsAndConditions);
                                  navigateToJoinScreen(context, item[index]);
                                },
                              );
                            },
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  // void navigateToDetailsScreen(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const DetailsInNewBrandView(),
  //     ),
  //   );
  // }

  void navigateToSeeAllScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const MyBrandsView(),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  void navigateToJoinScreen(BuildContext context, CompaniesNotJoined item) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) {
          // BlocProvider.of<MyBrandsCubit>(context).allCompanies.clear();
          return JoinViewBodyInBrands(item: item);
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
