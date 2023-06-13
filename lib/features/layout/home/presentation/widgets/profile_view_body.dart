import 'package:bella/features/layout/home/presentation/widgets/my_id_view.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/verification_an_email_widget.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 75.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.myProfile),
            SizedBox(width: 13.w),
            SvgPicture.asset(AppAssets.edit),
          ],
        ),
        SizedBox(height: 18.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mark AL-Jumaily',
              style: GoogleFonts.darkerGrotesque(
                fontSize: 26.sp,
                height: 1.h,
                fontWeight: FontWeight.bold,
                color: AppColors.black3Color,
              ),
            ),
          ],
        ),
        SizedBox(height: 43.h),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 43.h),
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                const VerificationAnEmailWidget(),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {
                    navigateToMyId(context);
                  },
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        color: AppColors.grey4Color,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: SvgPicture.asset(AppAssets.qrCode),
                    ),
                    title: Text(
                      'My ID',
                      style: GoogleFonts.darkerGrotesque(
                        color: AppColors.black3Color,
                        fontWeight: FontWeight.bold,
                        height: 1.h,
                        fontSize: 18.sp,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      AppAssets.arrow,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                ),
                SizedBox(height: 0.6.h),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: AppColors.grey4Color,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SvgPicture.asset(AppAssets.file),
                  ),
                  title: Text(
                    'Receipts',
                    style: GoogleFonts.darkerGrotesque(
                      color: AppColors.black3Color,
                      fontWeight: FontWeight.bold,
                      height: 1.h,
                      fontSize: 18.sp,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                    AppAssets.arrow,
                    height: 17.sp,
                  ),
                ),
                SizedBox(height: 0.6.h),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: AppColors.grey4Color,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SvgPicture.asset(AppAssets.settings),
                  ),
                  title: Text(
                    'Settings',
                    style: GoogleFonts.darkerGrotesque(
                      color: AppColors.black3Color,
                      fontWeight: FontWeight.bold,
                      height: 1.h,
                      fontSize: 18.sp,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                    AppAssets.arrow,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
                SizedBox(height: 0.6.h),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: AppColors.grey4Color,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SvgPicture.asset(AppAssets.infoCircle4),
                  ),
                  title: Text(
                    'Information',
                    style: GoogleFonts.darkerGrotesque(
                      color: AppColors.black3Color,
                      fontWeight: FontWeight.bold,
                      height: 1.h,
                      fontSize: 18.sp,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                    AppAssets.arrow,
                    height: 17.sp,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Divider(
                    height: 18.h,
                    color: AppColors.grey5Color,
                    thickness: 1,
                  ),
                ),
                // SizedBox(height: 0.6.h),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: AppColors.grey4Color,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SvgPicture.asset(AppAssets.logoutIcon),
                  ),
                  title: Text(
                    'Log out',
                    style: GoogleFonts.darkerGrotesque(
                      color: AppColors.black3Color,
                      fontWeight: FontWeight.bold,
                      height: 1.h,
                      fontSize: 18.sp,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                    AppAssets.arrow,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void navigateToMyId(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const MyIDView(),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}
