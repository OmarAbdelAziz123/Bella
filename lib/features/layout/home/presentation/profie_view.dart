import 'package:bella/features/layout/home/presentation/home_view.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/verification_an_email_widget.dart';
import 'package:bella/features/on_boardings/presentation/on_boarding_screen.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/my_id_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _isScrolled = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 0 &&
          !_scrollController.position.outOfRange) {
        if (!_isScrolled) {
          setState(() {
            _isScrolled = true;
          });
        }
      } else {
        if (_isScrolled) {
          setState(() {
            _isScrolled = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                backgroundColor: AppColors.bgColor,
                centerTitle: true,
                elevation: 0,
                leading: GestureDetector(
                  onTap: () {
                    navigatePop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    child: SvgPicture.asset(
                      AppAssets.arrowbackblack,
                    ),
                  ),
                ),
                floating: true,
                pinned: true,
                title: !_isScrolled ? null : Text(
                        'Account',
                        style: AppFonts.titleSubsection,
                      )
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([

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
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const VerificationAnEmailWidget(),
                        SizedBox(height: 20.h),
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
                            height: 15.h,
                            color: AppColors.grey5Color,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(height: 9.5.h),
                        GestureDetector(
                          onTap: () {
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
                        SizedBox(height: 19.5.h),
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
                        SizedBox(height: 19.5.h),
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
                            style: AppFonts.bodyLargeBold,
                          ),
                          trailing: SvgPicture.asset(
                            AppAssets.arrow,
                            height: 25.h,
                            width: 25.w,
                          ),
                        ),
                        SizedBox(height: 19.5.h),
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
                        SizedBox(height: 9.5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Divider(
                            height: 18.h,
                            color: AppColors.grey5Color,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(height: 9.5.h),
                        GestureDetector(
                          onTap: () {
                            logout(context);
                          },
                          child: ListTile(
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
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToMyCard(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const MyCardView(),
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

  void logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const OnBoardingScreen(),
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