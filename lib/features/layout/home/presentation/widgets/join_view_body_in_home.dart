// ignore_for_file: must_be_immutable
import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/data/models/all_companies.dart';
import 'package:bella/features/layout/home/data/models/get-recommended.dart';
import 'package:bella/features/layout/home/data/models/see_all_model.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/home_view.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/my_brands/my_brands_view.dart';
import 'package:bella/features/layout/scan/managers/scan_cubit.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class JoinViewBodyInHome extends StatefulWidget {
  String companyId;

  JoinViewBodyInHome({Key? key, required this.companyId}) : super(key: key);

  @override
  State<JoinViewBodyInHome> createState() => _JoinViewBodyInHomeState();
}

class _JoinViewBodyInHomeState extends State<JoinViewBodyInHome> {
  final ScrollController controller = ScrollController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
    BlocProvider.of<MyBrandsCubit>(context).getTermsAndConditions();
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      setState(() {
        _isButtonEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBrandsCubit, MyBrandsState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<MyBrandsCubit>(context);
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            height: 150.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(1),
                  blurRadius: 20,
                  offset: const Offset(0, 2),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  blurRadius: 30,
                  offset: const Offset(0, 3),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.6),
                  blurRadius: 40,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: _isButtonEnabled
                      ? () {
                          print('Click');
                          BlocProvider.of<ScanCubit>(context).postJoinCompany();
                        }
                      : null,
                  child: Container(
                    width: 353.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: _isButtonEnabled
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                      borderRadius: BorderRadius.circular(70.r),
                    ),
                    child: Center(
                      child: Text(
                        'Accept',
                        style: GoogleFonts.darkerGrotesque(
                          fontSize: 20.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          height: 1.h,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 55.h),
                  width: 353.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(70.r),
                  ),
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.darkerGrotesque(
                        fontSize: 20.sp,
                        color: AppColors.black6Color,
                        fontWeight: FontWeight.bold,
                        height: 1.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                MyCache.removeFromShared(key: CacheKeys.comp_id);
                navigatePop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: SvgPicture.asset(
                  AppAssets.container_close,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 22.w),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: 24.h),

                    ///
                    Row(
                      children: [
                        Image.network(
                          cubit.logo ??
                              'https://w7.pngwing.com/pngs/539/973/png-transparent-kfc-fried-chicken-fast-food-restaurant-kfc-food-recipe-chicken-meat-thumbnail.png',
                          height: 64.h,
                          width: 64.w,
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          cubit.display_name ?? 'Loading',
                          style: GoogleFonts.darkerGrotesque(
                            height: 1.h,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 29.h),
                    Theme(
                      data: Theme.of(context).copyWith(
                        highlightColor: AppColors.primaryColor,
                        scrollbarTheme: ScrollbarThemeData(
                          isAlwaysShown: true,
                          trackBorderColor:
                              MaterialStateProperty.all(AppColors.primaryColor),
                          thumbColor:
                              MaterialStateProperty.all(AppColors.primaryColor),
                          trackColor:
                              MaterialStateProperty.all(AppColors.blackColor),
                        ),
                      ),
                      child: Scrollbar(
                        controller: controller,
                        thickness: 6.w,
                        radius: Radius.circular(300.r),
                        interactive: true,
                        isAlwaysShown: true,
                        child: SizedBox(
                          height: 525,
                          child: NotificationListener<OverscrollIndicatorNotification>(
                            onNotification: (overscroll) {
                              overscroll.disallowGlow();
                              return false;
                            },
                            child: ListView.separated(
                              controller: controller,
                              // physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 1,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 54.h);
                              },
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Terms and Conditions',
                                      style: GoogleFonts.darkerGrotesque(
                                        color: AppColors.black3Color,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                        height: 1.h,
                                      ),
                                    ),
                                    SizedBox(height: 23.h),
                                    Column(
                                      children: [
                                        BlocBuilder<MyBrandsCubit, MyBrandsState>(
                                          builder: (context, myBrandState) {
                                            var cubit =
                                                MyBrandsCubit.get(context);
                                            return myBrandState
                                                    is GetTermsAndConditionsLoadingState
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      SizedBox(height: 170.h),
                                                      const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Text(
                                                    cubit.termsAndConditions ??
                                                        'Loading',
                                                    style: GoogleFonts
                                                        .darkerGrotesque(
                                                      color:
                                                          AppColors.black3Color,
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.h,
                                                    ),
                                                  );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 80.h),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void navigateHomeScreen(BuildContext context) {
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
}

class CustomContainerInJoinScreen extends StatelessWidget {
  final String image, text;

  const CustomContainerInJoinScreen(
      {Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.w,
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.5.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          SvgPicture.asset(
            image,
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(height: 8.h),
          Text(
            text,
            style: GoogleFonts.darkerGrotesque(
              fontWeight: FontWeight.bold,
              height: 1.h,
              fontSize: 14.sp,
              color: AppColors.black3Color,
            ),
          ),
        ],
      ),
    );
  }
}
