// ignore_for_file: must_be_immutable

import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalViewInScan extends StatefulWidget {
  void Function()? onTap;
  bool hasJoined;

  FinalViewInScan({
    Key? key,
    required this.onTap,
    required this.hasJoined,
  }) : super(key: key);

  @override
  State<FinalViewInScan> createState() => _FinalViewInScanState();
}

class _FinalViewInScanState extends State<FinalViewInScan>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(_controller!);
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBrandsCubit, MyBrandsState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<MyBrandsCubit>(context);

        return Scaffold(
          backgroundColor: AppColors.bgColor,
          body: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 72.h,
              bottom: 44.h,
            ),
            child: Column(
              children: [
                widget.hasJoined == true
                    ? Container()
                    : SlideTransition(
                        position: _animation!,
                        child: Hero(
                          tag: 'myContainer',
                          child: Container(
                            height: 60.h,
                            width: 353.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0.5,
                                  blurRadius: 0.5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15.r),
                              color: AppColors.whiteColor,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 12.w,
                                      top: 14.h,
                                      bottom: 14.h,
                                      right: 4.w),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40.r),
                                      child: Image.network(
                                        cubit.logo ?? 'https://w7.pngwing.com/pngs/539/973/png-transparent-kfc-fried-chicken-fast-food-restaurant-kfc-food-recipe-chicken-meat-thumbnail.png',
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            AppAssets.notFound,
                                            height: 32.h,
                                            width: 32.w,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                        height: 32.h,
                                        width: 31.w,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 8.5.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'You have joined',
                                        style: AppFonts.date,
                                      ),
                                      Text(
                                        cubit.display_name,
                                        style: AppFonts.bodyLargeBold,
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 12.w,
                                    top: 17.h,
                                    bottom: 17.h,
                                  ),
                                  child: SvgPicture.asset(AppAssets.checkRight),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                Image.asset(AppAssets.hand2, height: 334.h, width: 334.w),
                SizedBox(height: 57.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    'scanned successfully'.toUpperCase(),
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
                SizedBox(height: 10.h),
                Text(
                  'Your account has been created \n successfully!',
                  textAlign: TextAlign.center,
                  style: AppFonts.bodyLarge.copyWith(
                    color: AppColors.blackColor,
                    height: 1.5.h,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    width: 353.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(70.r),
                    ),
                    child: Center(
                      child: Text(
                        'Close',
                        style: AppFonts.bodyLargeBold.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
