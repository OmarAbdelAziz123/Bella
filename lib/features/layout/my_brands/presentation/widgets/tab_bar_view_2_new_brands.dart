import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/widgets/company_profile_screen.dart';
import 'package:bella/features/layout/home/presentation/widgets/terms_and_conditions.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/field_container_widget.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/my_brands/my_brands_view.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              overscroll.disallowIndicator();
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
              return cubit.allNotJoined == null ? Column(
                children: [
                  SizedBox(height: 144.h),
                  Text(
                    'No brands found yet',
                    style: AppFonts.titleSection.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'All new brands will appear here',
                    style: AppFonts.bodyLarge.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ) : NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
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
                        if (kDebugMode) {
                          print(company.id.toString());
                        }
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
            initialScreen: 'NewBrands',
            onCancelButtonInFinalScreen: () {
              Navigator.pop(context);
              navigatePop(context);
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
              navigatePop(context);
            },
            initialView: 'NewBrands',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  MyBrandsView(),
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

  void navigatePop(BuildContext context) {
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

  void navigatePopToBrands(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) =>  MyBrandsView(),
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

  void navigateToProductsInCompany(
      BuildContext context, String displayName, String logo) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) {
          return CompanyProfileScreen(
            display_name: displayName,
            logo: logo,
            initialScreen: 'NewBrands',
            onBack: () {
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
}
