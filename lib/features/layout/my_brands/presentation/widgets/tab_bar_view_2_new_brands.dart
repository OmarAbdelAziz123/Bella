import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/field_container_widget.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
import 'package:bella/features/layout/my_brands/brands_navigation_functions/brands_navigation_functions.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
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
        // SearchBarWidget(hintText: 'Search brands'),
        // SizedBox(height: 18.h),
        // Flexible(
        //   child: NotificationListener<OverscrollIndicatorNotification>(
        //     onNotification: (overscroll) {
        //       overscroll.disallowIndicator();
        //       return false;
        //     },
        //     child: ListView.builder(
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
        //                   : const Color(0xff444B67).withOpacity(0.6),
        //             ),
        //             borderRadius: BorderRadius.circular(10.r),
        //           ),
        //           child: Center(
        //             child: AppConstants.texts[index],
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
        // SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.only(
            right: 20.w,
            left: 20.w,
            // top: 44.h,
          ),
          child: GestureDetector(
            onTap: () {
              // navigateToJoinScreen(
              //   context,
              //   MyCache.getString(
              //       key: CacheKeys.comp_id),
              // );
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
                  'Join All',
                  style: AppFonts.bodyLargeBold
                      .copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 405.h,
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
                        BrandsNavigationClass.navigateToJoinScreen(
                            context, company.id.toString());
                      },
                      onTapInAnyPlaceInCustomRecommendedCompany: () {
                        MyCache.putString(
                            key: CacheKeys.comp_id,
                            value: company.id.toString());
                        if (kDebugMode) {
                          print(company.id.toString());
                        }
                        BrandsNavigationClass.navigateToProductsInCompany(
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
}
