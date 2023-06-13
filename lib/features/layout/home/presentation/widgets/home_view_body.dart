// ignore_for_file: must_be_immutable
import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/data/models/all_companies.dart';
import 'package:bella/features/layout/home/data/models/get-recommended.dart';
import 'package:bella/features/layout/home/data/models/see_all_model.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/profie_view.dart';
import 'package:bella/features/layout/home/presentation/see_all__view.dart';
import 'package:bella/features/layout/home/presentation/widgets/join_view_body_in_hone.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/banner/banner.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/dress_component.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/field_container_widget.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/verification_an_email_widget.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // if (state is GetRecommendedErrorState) {
        //   SnackBar snackBar = const SnackBar(
        //       content: Text('Error in Get All Recommended List'));
        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        if (cubit.recommended.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }
        else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 2.h),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 18.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            // cubit.recommended.length.toString(),
                            'Hi ${MyCache.getString(key: CacheKeys.firstName)}!',
                            style: GoogleFonts.darkerGrotesque(
                              height: 1.h,
                              fontWeight: FontWeight.bold,
                              fontSize: 28.sp,
                              color: AppColors.black3Color,
                            ),
                          ),

                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.notificationIcon),
                              SizedBox(width: 2.w),
                              GestureDetector(
                                onTap: () {
                                  navigatetoProfileScreen(context);
                                },
                                child: SvgPicture.asset(AppAssets.userIcon),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const VerificationAnEmailWidget(),
                    const SearchBarWidget(
                      hintText: 'Search product or store',
                    ),
                    SizedBox(height: 21.h),
                    SizedBox(
                      height: 35.h,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 20.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 35.h,
                            // width: 91.18.w,
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
                    SizedBox(height: 25.h),
                  ],
                ),
                Container(
                  height: 324.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 36.h,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.main_container),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      /// See All
                      GestureDetector(
                        onTap: () => navigateToSeeAllScreen(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'You might like',
                              style: GoogleFonts.darkerGrotesque(
                                fontWeight: FontWeight.bold,
                                height: 1.h,
                                fontSize: 24.sp,
                                color: AppColors.black3Color,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'See All (33)',
                                  style: GoogleFonts.darkerGrotesque(
                                    height: 1.h,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: AppColors.black3Color,
                                  ),
                                ),
                                SvgPicture.asset(
                                  AppAssets.arrow,
                                  height: 18.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 17.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit.recommended.length,
                        itemBuilder: (context, index) {
                          return FieldContainerWidget(
                            image: cubit.recommended[index].logo.toString(),
                            headText:
                                cubit.recommended[index].displayName.toString(),
                            subText:
                                cubit.recommended[index].countryCode.toString(),
                            onTapInLogo: () {},
                            onTap: () {
                              List<RecommendedCompanies> item = BlocProvider.of<HomeCubit>(context).recommended;
                             navigateToJoinScreen(item[index]);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                CustomPageView(
                  onPageChanged: (p0) {},
                  pageController: pageController!,
                ),
                SizedBox(height: 17.h),
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 13.w,
                    mainAxisSpacing: 13.h,
                    childAspectRatio: 1 / 1.5,
                    crossAxisCount: 2,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 237.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.r),
                                  topRight: Radius.circular(15.r),
                                ),
                                child: Image.asset(
                                  AppAssets.one,
                                  width: 170.w,
                                  height: 173.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8.h,
                                left: 8.w,
                                child: Image.asset(
                                  AppAssets.one_one,
                                  width: 35.w,
                                  height: 35.h,
                                ),
                              ),
                              Positioned(
                                bottom: 5.81.h,
                                left: 8.w,
                                child: Image.asset(
                                  AppAssets.offer,
                                  width: 35.w,
                                  height: 35.h,
                                ),
                              ),
                              Positioned(
                                bottom: 6.41.h,
                                right: 9.41.w,
                                child: Container(
                                  width: 30.18,
                                  height: 30.18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.sp),
                                    color: AppColors.whiteColor,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 9.81.w,
                                    vertical: 9.81.w,
                                  ),
                                  child: SvgPicture.asset(
                                    AppAssets.add,
                                    width: 10.56.w,
                                    height: 10.56.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h,
                                // bottom: 2.h,
                                left: 12.w,
                                right: 9.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shein Sjorta vinyl',
                                  style: GoogleFonts.darkerGrotesque(
                                    color: AppColors.blackColor,
                                    height: 1.h,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  'awespme',
                                  style: GoogleFonts.darkerGrotesque(
                                    color: AppColors.blackColor,
                                    height: 1.h,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  children: [
                                    Text(
                                      '1 218 kr',
                                      style: GoogleFonts.darkerGrotesque(
                                        color: AppColors.orangeColor,
                                        height: 1.h,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Text(
                                      '1 718 kr',
                                      style: GoogleFonts.darkerGrotesque(
                                        color: AppColors.grey7Color,
                                        decoration: TextDecoration.lineThrough,
                                        height: 1.h,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 17.h),
              ],
            ),
          );
        }
      },
    );
  }

  void navigatetoProfileScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const ProfileView(),
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

  void navigateToSeeAllScreen() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const SeeAllView(),
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

  void navigateToJoinScreen(RecommendedCompanies item) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => JoinViewBodyInHome(item: item),
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
