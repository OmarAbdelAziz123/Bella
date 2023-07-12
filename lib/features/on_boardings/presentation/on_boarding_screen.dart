import 'dart:async';
import 'dart:io';

import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/features/auth/presentation/widgets/check_view_body.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/login_button_widget.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  // Widget dotPageView() {
  //   return Builder(
  //     builder: (context) {
  //       return Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           for (int i = 0; i < images.length; i++)
  //             Container(
  //               margin: EdgeInsets.symmetric(horizontal: 4.w),
  //               width: 84.w,
  //               height: 4.h,
  //               decoration: BoxDecoration(
  //                 color: i == pageNumber ? AppColors.black3Color : AppColors.black3Color.withOpacity(0.20),
  //                 borderRadius: BorderRadius.circular(400.r),
  //               ),
  //             ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Widget dotPageView(PageController pageController) {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < images.length; i++)
              GestureDetector(
                onTap: () {
                  pageController.animateToPage(
                    i,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: 84.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: i <= pageNumber
                        ? AppColors.black3Color
                        : AppColors.black3Color.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(400.r),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  int pageNumber = 0;

  PageController nextPage = PageController();

  @override
  void initState() {
    super.initState();
    // start a timer to automatically slide to the next page after 2 seconds
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (pageNumber == 0) {
        nextPage.animateToPage(1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      } else if (pageNumber == 1) {
        nextPage.animateToPage(2,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      } else if (pageNumber == 2) {
        nextPage.animateToPage(3,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      } else if (pageNumber == 3) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginBankSuccessState) {
          AppConstants.launchURL(state.loginBank);
          sleep(const Duration(seconds: 2));
        } else if (state is LoginBankErrorState) {
          // SnackBar snackBar = const SnackBar(content: Text('Login Failure'));
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          print('error');
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);

        return Scaffold(
          backgroundColor: AppColors.bgColor,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 27.h),
                dotPageView(nextPage),
                Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowGlow();
                      return false;
                    },
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          pageNumber = value;
                        });
                      },
                      controller: nextPage,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.asset(images[index], height: 266.h),
                              SizedBox(height: 40.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Text(
                                  texts[index].toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily:
                                        'Futura LT Condensed Extra Bold',
                                    color: AppColors.black3Color,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 50.sp,
                                    letterSpacing: -2.sp,
                                    height: 1.16.h,
                                  ),
                                ),
                              ),
                              // Text(texts[index], height: 280.h, s),
                              SizedBox(height: 42.h),
                              pageNumber == 0
                                  ? Container()
                                  : Text(
                                      'Your account has been created \n successfully!',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        fontSize: 16.sp,
                                        color: AppColors.blackColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                              SizedBox(height: 48.h),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  color: AppColors.bgColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LoginButtonWidget(
                              textWidget: state is LoginBankLoadingState
                                  ? SizedBox(
                                      width: 24.w,
                                      height: 24.h,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 4.w,
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                          AppColors.whiteColor,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      'Log in with BankID',
                                      style: AppFonts.bodyLarge.copyWith(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.05.sp,
                                        fontSize: 16.sp,
                                      ),
                                      textAlign: TextAlign.center,
                                      textScaleFactor:
                                          ScaleSize.textScaleFactor(context),
                                    ),
                              width: 353.h,
                              onTap: () {
                                AppConstants.showMyDialog(context);
                                BlocProvider.of<AuthCubit>(context)
                                    .loginBank(context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'By proceeding, I accept Bonoz’s ',
                              style: GoogleFonts.inter(
                                color: AppColors.black3Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'privacy policy ',
                              style: GoogleFonts.inter(
                                color: AppColors.black3Color,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2.0,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                height: 1.2.h,
                              ),
                            ),
                            Text(
                              'och ',
                              style: GoogleFonts.inter(
                                color: AppColors.black3Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                height: 1.2.h,
                              ),
                            ),
                            Text(
                              'terms of use',
                              style: GoogleFonts.inter(
                                decoration: TextDecoration.underline,
                                color: AppColors.black3Color,
                                decorationThickness: 2.0,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                height: 1.2.h,
                              ),
                            ),
                          ],
                        ),
                      ],
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
}

List<String> images = [
  AppAssets.hands,
  AppAssets.waleet,
  AppAssets.money,
  AppAssets.voot,
];

List<String> texts = [
  'One app\n all things\n discount  &\n offers',
  'say bye to\n your\n membership\n cards',
  'Save money\n with loyalty\n program',
  'Sync all your\n membership\n with all',
];
