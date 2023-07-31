// ignore_for_file: must_be_immutable
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/widgets/tab_bar_view_1_my_brands.dart';
import 'package:bella/features/layout/my_brands/presentation/widgets/tab_bar_view_2_new_brands.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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


