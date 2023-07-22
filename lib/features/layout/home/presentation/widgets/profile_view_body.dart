import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/features/layout/home/presentation/widgets/my_id_view.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/verification_an_email_widget.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text(
                'Account',
                style: AppFonts.titleScreen,
              )
            ],
          ),
        ),
        SizedBox(height: 29.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.myProfile,
              height: 72.h,
              width: 72.w,
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              AppAssets.edit,
              width: 27.w,
              height: 39.h,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mark AL-Jumaily',
              style: AppFonts.titleBody,
            ),
          ],
        ),
        SizedBox(height: 30.h),
        Expanded(
          child: Column(
            children: [
              const VerificationAnEmailWidget(),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.only(left: 26.h),
                child: Row(
                  children: [
                    Text(
                      'Details',
                      style: AppFonts.bodyDefault,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Divider(
                  height: 18.h,
                  color: AppColors.grey5Color,
                  thickness: 1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // BlocProvider.of<AuthCubit>(context).readCreditCard();
                  navigateToMyCard(context);
                },
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(10.5.sp),
                    decoration: BoxDecoration(
                      color: AppColors.grey8Color,
                      borderRadius: BorderRadius.circular(300.r),
                    ),
                    child: SvgPicture.asset(AppAssets.my_cards),
                  ),
                  title: Text(
                    'My Cards',
                    style: AppFonts.bodyLargeBold,
                  ),
                  trailing: SvgPicture.asset(
                    AppAssets.arrow,
                    height: 25.h,
                    width: 25.w,
                  ),
                ),
              ),
              SizedBox(height: 0.6.h),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(10.5.sp),
                  decoration: BoxDecoration(
                    color: AppColors.grey8Color,
                    borderRadius: BorderRadius.circular(300.r),
                  ),
                  child: SvgPicture.asset(AppAssets.file),
                ),
                title: Text(
                  'Receipts',
                  style: AppFonts.bodyLargeBold,
                ),
                trailing: SvgPicture.asset(
                  AppAssets.arrow,
                  height: 25.h,
                  width: 25.w,
                ),
              ),
              SizedBox(height: 0.6.h),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(10.5.sp),
                  decoration: BoxDecoration(
                    color: AppColors.grey8Color,
                    borderRadius: BorderRadius.circular(300.r),
                  ),
                  child: SvgPicture.asset(AppAssets.settings),
                ),
                title: Text(
                  'Settings',
                  // style: GoogleFonts.darkerGrotesque(
                  //   color: AppColors.black3Color,
                  //   fontWeight: FontWeight.bold,
                  //   height: 1.h,
                  //   fontSize: 18.sp,
                  // ),
                  style: AppFonts.bodyLargeBold,
                ),
                trailing: SvgPicture.asset(
                  AppAssets.arrow,
                  height: 25.h,
                  width: 25.w,
                ),
              ),
              SizedBox(height: 0.6.h),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(10.5.sp),
                  decoration: BoxDecoration(
                    color: AppColors.grey8Color,
                    borderRadius: BorderRadius.circular(300.r),
                  ),
                  child: SvgPicture.asset(AppAssets.infoCircle4),
                ),
                title: Text(
                  'Information',
                  style: AppFonts.bodyLargeBold,
                ),
                trailing: SvgPicture.asset(
                  AppAssets.arrow,
                  height: 25.sp,
                  width: 25.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Divider(
                  height: 18.h,
                  color: AppColors.grey5Color,
                  thickness: 1,
                ),
              ),
              // SizedBox(height: 0.6.h),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(10.5.sp),
                  decoration: BoxDecoration(
                    color: AppColors.grey8Color,
                    borderRadius: BorderRadius.circular(300.r),
                  ),
                  child: SvgPicture.asset(AppAssets.logoutIcon),
                ),
                title: Text(
                  'Log out',
                  style: AppFonts.bodyLargeBold,
                ),
                trailing: SvgPicture.asset(
                  AppAssets.arrow,
                  height: 25.h,
                  width: 25.w,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void navigateToMyCard(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => MyCardView(),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}
