import 'package:another_flushbar/flushbar.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConstants {
  static const String baseImage = 'assets/images';

  /// Base Url
  static const String baseUrl = 'https://business-webapi.azurewebsites.net/';

  /// End Points

  static TextStyle getTextStyle({
    required FontWeight fontWeight,
    required double fontSize,
    required double letterSpacing,
    required double height,
    required Color color,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      height: height,
      color: color,
    );
  }

  /// Shared Variables
  static List<Widget> texts = [
    SvgPicture.asset(
      AppAssets.Horizontal,
      height: 24.h,
      width: 24.w,
    ),
    Text(
      'Fashion',
      style: AppFonts.productName.copyWith(
        height: 1.2.h,
      ),
    ),
    Text(
      'Home',
      style: AppFonts.productName.copyWith(
        height: 1.2.h,
      ),
    ),
    Text(
      'Electronics',
      style: AppFonts.productName.copyWith(
        height: 1.2.h,
      ),
    ),
    Text(
      'Travel',
      style: AppFonts.productName.copyWith(
        height: 1.2.h,
      ),
    ),
    Text(
      'health',
      style: AppFonts.productName.copyWith(
        height: 1.2.h,
      ),
    ),
    Text(
      'Sports',
      style: AppFonts.productName.copyWith(
        height: 1.2.h,
      ),
    ),
  ];

  /// Navigate To Another App.
  static launchURL(String uri) async {
    final Uri url =
        Uri.parse('https://app.bankid.com/?autostarttoken=$uri&redirect=null');
    print(uri.toString());
    if (!await launchUrl(url, mode: LaunchMode.externalNonBrowserApplication)) {
      throw Exception('Could not launch $uri');
    }
  }

  /// Show Loading in Login Screen
  static Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.sp),
            ),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 2.w),
          content: SizedBox(
            height: 245.h,
            width: 283.w,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 1.2.h),
                    SvgPicture.asset(
                      AppAssets.bella2,
                      height: 97.h,
                      width: 164.w,
                    ),
                    SizedBox(height: 73.21.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.inter(
                              decoration: TextDecoration.underline,
                              decorationThickness: 2.0,
                              decorationColor: Colors.black,
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> showMyDialog2(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SizedBox(
          height: 312.h,
          width: 350.w,
          child: AlertDialog(
            backgroundColor: AppColors.grey4Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.sp),
              ),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 33.w),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  // SizedBox(height: 1.2.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Well done!',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                          fontSize: 25.sp,
                          height: 1.h,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // SvgPicture.asset(
                      //   AppAssets.bellaIcon,
                      //   height: 60,
                      // ),
                      Lottie.asset('assets/images/Well_done.json',
                          width: 200.w, height: 200.h),
                      SizedBox(height: 4.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Your account has been created',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                              fontSize: 20.sp,
                              height: 1.h,
                            ),
                          ),
                          Text(
                            'successfully',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                              fontSize: 20.sp,
                              height: 1.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Take me home',
                          style: GoogleFonts.inter(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryColor,
                            fontSize: 20.sp,
                            height: 1.h,
                          ),
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

  static Future<void> showMyDialogError(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.sp),
            ),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          content: SizedBox(
            height: 245.h,
            width: 283.w,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 1.2.h),
                    SvgPicture.asset(
                      AppAssets.bella22,
                      height: 97.h,
                      width: 164.w,
                    ),
                    SizedBox(height: 73.21.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.inter(
                              decoration: TextDecoration.underline,
                              decorationThickness: 2.0,
                              decorationColor: Colors.black,
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void showFlushBar(BuildContext context, String message) async {
    return Flushbar(
      message: message,
      messageSize: 16.sp,
      messageColor: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(
        12.r,
      ),
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.only(
        bottom: 16.h,
        left: 15.w,
        right: 15.w,
      ),
      isDismissible: false,
      animationDuration: const Duration(milliseconds: 300),
      icon: Icon(
        Icons.check_circle_outline,
        color: AppColors.whiteColor,
        size: 22.sp,
      ),
      shouldIconPulse: false,
      backgroundColor: AppColors.primaryColor,
      boxShadows: const [
        BoxShadow(
          color: Colors.white38,
          offset: const Offset(0.0, 2.0),
          blurRadius: 3.0,
        ),
      ],
    ).show(context);
  }

  /// Network Image
  static Widget showNetworkImage({
    required String image,
    required double height,
    required double width,
    required BoxFit fit,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.r),
        ),
        child: Image.network(
          image,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return SvgPicture.asset(AppAssets.errorIcon);
          },
          height: height,
          width: width,
        ),
      ),
    );
  }
}
