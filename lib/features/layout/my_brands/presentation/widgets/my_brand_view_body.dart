import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/widgets/joine_view_body_in_brands.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/field_container_widget.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
import 'package:bella/features/layout/my_brands/data/models/not_joined_model.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/widgets/my_brand_view_body2.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBrandViewBody extends StatefulWidget {
  const MyBrandViewBody({Key? key}) : super(key: key);

  @override
  State<MyBrandViewBody> createState() => _MyBrandViewBodyState();
}

class _MyBrandViewBodyState extends State<MyBrandViewBody> {
  @override
  void initState() {
    BlocProvider.of<MyBrandsCubit>(context).joinedFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBrandsCubit, MyBrandsState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<MyBrandsCubit>(context);
        return DefaultTabController(
          length: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 10.h),
                SizedBox(height: 10.h),
                Container(
                  height: 50.h,
                  // width: 353.w,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7.sp),
                    // EdgeInsets.symmetric(horizontal: 2.6.w, vertical: 0.8.h),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r)),
                      child: TabBar(
                        indicatorColor: Colors.transparent,

                        physics: NeverScrollableScrollPhysics(),
                        isScrollable: false,
                        unselectedLabelStyle: GoogleFonts.darkerGrotesque(
                          height: 1.h,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColors.black3Color,
                        ),
                        unselectedLabelColor: AppColors.black3Color,
                        labelStyle: GoogleFonts.darkerGrotesque(
                          height: 1.h,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColors.whiteColor,
                        ),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: AppColors.primaryColor,
                        ),
                        tabs: [
                          Text("My brands (${cubit.allCompanies.length})"),
                          Text("New brands (${cubit.notJoined.length})"),
                          // Text("تم الانتهاء"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),

                    children: [
                      BlocBuilder<MyBrandsCubit, MyBrandsState>(
                        builder: (context, state) {
                          return TabBarView1();
                        },
                      ),
                      TabBarView2(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void navigateToSeeAllScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) {
          BlocProvider.of<MyBrandsCubit>(context).joinedFunction();
          return MyBrandViewBody2();
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}

class CustomContainerInMyBrands extends StatelessWidget {
  final String image, text;

  const CustomContainerInMyBrands(
      {Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 110.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(
              // left: 7.92.w,
              top: 5.92.h,
              right: 5.51.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  AppAssets.checkIcon,
                  height: 15.84.h,
                  width: 15.84.w,
                ),
              ],
            ),
          ),
          // Positioned(
          //   top: 7.92,
          //   right: 5.51,
          //   child: SvgPicture.asset(
          //     AppAssets.checkIcon,
          //     height: 15.84.h,
          //     width: 15.84.w,
          //   ),
          // ),
          Image.network(
            image,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                AppAssets.notFound,
                height: 30.h,
                width: 30.w,
                fit: BoxFit.cover,
              );
            },
            height: 30.h,
            width: 30.w,
          ),
          SizedBox(height: 6.h),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.darkerGrotesque(
              height: 1.h,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: AppColors.black3Color,
            ),
          ),
          SizedBox(height: 15.5.h),
        ],
      ),
    );
  }
}

class TabBarView1 extends StatelessWidget {
  const TabBarView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBrandsCubit, MyBrandsState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<MyBrandsCubit>(context);

        return Column(
          children: [
            const SearchBarWidget(hintText: 'Search brands'),
            SizedBox(height: 18.h),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 20.w),
              height: 516.h,
              child: Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: cubit.allCompanies.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 11,
                    mainAxisSpacing: 11.h,
                  ),
                  itemBuilder: (context, index) {
                    return CustomContainerInMyBrands(
                      image: cubit.allCompanies[index].logo.toString(),
                      text: cubit.allCompanies[index].displayName.toString(),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class TabBarView2 extends StatelessWidget {
  const TabBarView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBrandsCubit, MyBrandsState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<MyBrandsCubit>(context);

        return Column(
          children: [
            const SearchBarWidget(hintText: 'Search brands'),
            SizedBox(height: 18.h),
            SizedBox(
              height: 35.h,
              child: Expanded(
                child: ListView.builder(
                  // padding: EdgeInsets.only(left: 20.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 35.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.9.w,
                      ),
                      margin: EdgeInsets.only(
                        right: index == 0 ? 8.w : 8.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Center(
                        child: Text(
                          AppConstants.texts[index],
                          style: GoogleFonts.darkerGrotesque(
                            height: 1.h,
                            color: AppColors.black3Color,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 18.h),
            state is GetAllCompaniesLoadingState
                ? const CircularProgressIndicator()
                : SizedBox(
              height: 490.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cubit.notJoined.length,
                itemBuilder: (context, index) {
                  return FieldContainerWidget(
                    image: cubit.notJoined[index].logo.toString(),
                    headText:
                    cubit.notJoined[index].displayName.toString(),
                    subText:
                    cubit.notJoined[index].countryCode.toString(),
                    onTapInLogo: () {},
                    onTap: () {
                      // cubit.allCompanies[index].id;
                      List<CompaniesNotJoined> item =
                          BlocProvider
                              .of<MyBrandsCubit>(context)
                              .notJoined;
                      // print(item[index].termsAndConditions);
                      navigateToJoinScreen(context, item[index]);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void navigateToJoinScreen(BuildContext context, CompaniesNotJoined item) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) {
          // BlocProvider.of<MyBrandsCubit>(context).allCompanies.clear();
          return JoinViewBodyInBrands(item: item);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}
