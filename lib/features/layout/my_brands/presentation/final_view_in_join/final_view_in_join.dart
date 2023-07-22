// ignore_for_file: must_be_immutable
import 'package:bella/features/layout/home/presentation/home_view.dart';
import 'package:bella/features/layout/home/presentation/see_all__view.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/my_brands/my_brands_view.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalViewInJoin extends StatefulWidget {
  String initialView = 'Home';

  FinalViewInJoin({Key? key, required this.initialView}) : super(key: key);

  @override
  State<FinalViewInJoin> createState() => _FinalViewInJoinState();
}

class _FinalViewInJoinState extends State<FinalViewInJoin>
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
                left: 20.w, right: 20.w, top: 91.h, bottom: 44.h),
            child: Column(
              children: [
                Image.asset(AppAssets.hand, height: 382.h, width: 382.w),
                // Image.asset(AppAssets.way_to_go, height: 158.h, width: 335.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29.w),
                  child: Text(
                    'Way to go!'.toUpperCase(),
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
                SizedBox(height: 55.h),
                Text(
                  '${cubit.display_name} has been added to your brands',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.darkerGrotesque(
                    color: Colors.black,
                    height: 1.h,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5.h),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (widget.initialView == 'Home') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                      );
                    } else if (widget.initialView == 'SeeAll') {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SeeAllView(),
                        ),
                      );
                    } else if (widget.initialView == 'NewBrands') {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyBrandsView(),
                        ),
                      );
                    }
                  },
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
                SizedBox(height: 40.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
