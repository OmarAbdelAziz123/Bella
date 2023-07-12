// ignore_for_file: must_be_immutable
import 'dart:io';
import 'dart:math';
import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/login_button_widget.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sizer/sizer.dart';

/// Sizes in Design in this screen
class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class CheckViewBody extends StatefulWidget {
  CheckViewBody({Key? key}) : super(key: key);

  // bool isClicked = false;

  int currentIndex = 0;

  List<String> images = [
    AppAssets.banner,
    AppAssets.banner,
    AppAssets.banner,
    AppAssets.banner,
  ];

  @override
  State<CheckViewBody> createState() => _CheckViewBodyState();
}

class _CheckViewBodyState extends State<CheckViewBody> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginBankSuccessState) {
          AppConstants.launchURL(state.loginBank);
          sleep(const Duration(seconds: 2));
        } else if (state is LoginBankErrorState) {
          SnackBar snackBar = const SnackBar(content: Text('Login Failure'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return SingleChildScrollView(
          child: Center(
            child: SizedBox(
              // height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppAssets.banner2,
                    height: MediaQuery.of(context).size.height / 1.4,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(height: 19.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'One app,',
                          style: GoogleFonts.darkerGrotesque(
                            color: AppColors.black3Color,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                            // height: 1.h,
                          ),
                        ),
                        Text(
                          'all things discounts & offers',
                          style: GoogleFonts.darkerGrotesque(
                            color: AppColors.black3Color,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                            // height: 1.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 31.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginButtonWidget(
                          textWidget: state is LoginBankLoadingState
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      left: 2.w, top: 8.h, bottom: 8.h),
                                  child: const CircularProgressIndicator(
                                    color: AppColors.whiteColor,
                                  ),
                                )
                              : Text(
                                  'Log in with BankID',
                                  style: GoogleFonts.darkerGrotesque(
                                    // height: 1.h,
                                    color: AppColors.whiteColor,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  textScaleFactor:
                                      ScaleSize.textScaleFactor(context),
                                ),
                          // text: 'Log in with BankID',
                          width: 353.h,
                          onTap: () {
                            // setState(() {
                            //   widget.isClicked = true;
                            //   cubit.testFunc();
                            // });
                             AppConstants.showMyDialog(context);
                            BlocProvider.of<AuthCubit>(context)
                             .loginBank(context);
                          }),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  // widget.isClicked == true ? Center(child: Text('Hello')) : Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'By proceeding, I accept Bella’s',
                        style: GoogleFonts.darkerGrotesque(
                          color: AppColors.black3Color,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          // height: 1.h,
                        ),
                      ),
                    ],
                  ),
                  // state is TestLoadingState
                  //     ? CircularProgressIndicator()
                  //     : Text(
                  //         MyCache.getInt(key: CacheKeys.total).toString(),
                  //         style: TextStyle(
                  //           color: AppColors.primaryColor,
                  //           fontSize: 50.sp,
                  //         ),
                  //       ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'privacy policy ',
                        style: GoogleFonts.darkerGrotesque(
                          color: AppColors.black3Color,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0,
                          fontWeight: FontWeight.w800,
                          fontSize: 14.sp,
                          // height: 1.h,
                        ),
                      ),
                      Text(
                        'och ',
                        style: GoogleFonts.darkerGrotesque(
                          color: AppColors.black3Color,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.8.sp,
                          // height: 1,
                        ),
                      ),
                      Text(
                        'terms of use',
                        style: GoogleFonts.darkerGrotesque(
                          decoration: TextDecoration.underline,
                          color: AppColors.black3Color,
                          decorationThickness: 2.0,
                          fontWeight: FontWeight.w800,
                          fontSize: 12.8.sp,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
