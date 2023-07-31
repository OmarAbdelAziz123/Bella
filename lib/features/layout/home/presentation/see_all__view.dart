import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/home_view.dart';
import 'package:bella/features/layout/home/presentation/widgets/company_profile_screen.dart';
import 'package:bella/features/layout/home/presentation/widgets/terms_and_conditions.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/field_container_widget.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget_in_see_all_screen.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeAllView extends StatefulWidget {
  const SeeAllView({Key? key}) : super(key: key);

  @override
  State<SeeAllView> createState() => _SeeAllViewState();
}

class _SeeAllViewState extends State<SeeAllView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => navigateToHomeScreen(),
              icon: SvgPicture.asset(
                AppAssets.arrowBack,
                height: 13.2.h,
                width: 15.5,
              ),
            ),
            centerTitle: true,
            title: Text(
              'Stores',
              style: GoogleFonts.darkerGrotesque(
                height: 1.h,
                color: AppColors.black3Color,
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 2.4.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const SearchBarWidgetInSeeAllScreen(),
                ),
                SizedBox(height: 21.h),
                SizedBox(
                  height: 35.h,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowIndicator();
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
                SizedBox(height: 25.h),
                cubit.allCompanies == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SizedBox(
                          height: 530.h,
                          child: NotificationListener<OverscrollIndicatorNotification>(
                            onNotification: (overscroll) {
                              overscroll.disallowIndicator();
                              return false;
                            },
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubit.allCompanies!.companies!.length,
                              itemBuilder: (context, index) {
                                var list = cubit.allCompanies!.companies![index];
                                var recommendedCompany = cubit
                                    .allCompanies!
                                    .companies![index];
                                return FieldContainerWidget(
                                  image: list.logo.toString(),
                                  headText: list.displayName.toString(),
                                  subText: list.countryCode.toString(),
                                  onTapInLogo: () {},
                                  onTap: () {
                                    MyCache.putString(
                                        key: CacheKeys.comp_id,
                                        value: list.id.toString());
                                    navigateToJoinScreen(
                                        context, list.id.toString());
                                  },
                                  onTapInAnyPlaceInCustomRecommendedCompany:
                                      () {
                                        MyCache.putString(
                                            key: CacheKeys.comp_id,
                                            value: recommendedCompany.id
                                                .toString());
                                        navigateToProductsInCompany(
                                          recommendedCompany.logo!,
                                          recommendedCompany.displayName!,
                                        );
                                      },
                                );
                              },
                            ),
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

  void navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const HomeView(),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  void navigateToJoinScreen(BuildContext context, String companyId) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (context, animation, secondaryAnimation) {
          return TermsAndConditions(
            companyId: companyId,
            flow: 'Join',
            hasJoined: false,
            initialView: 'SeeAll',
            initialScreen: 'SeeAll',
            onCancelButtonInFinalScreen: () {
              Navigator.pop(context);
            },
            onTap: () {
              Navigator.pop(context);
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

  void navigateToProductsInCompany(String logo, String displayName) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) {
          return CompanyProfileScreen(
            display_name: displayName,
            logo: logo,
            initialScreen: 'SeeAll',
            onBack: () {
              navigatePopToSeeAllScreen(context);
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
