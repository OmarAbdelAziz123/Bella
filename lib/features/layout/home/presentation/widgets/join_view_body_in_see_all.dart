import 'package:bella/features/layout/home/data/models/all_companies.dart';
import 'package:bella/features/layout/home/data/models/get-recommended.dart';
import 'package:bella/features/layout/home/data/models/see_all_model.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/home_view.dart';
import 'package:bella/features/layout/home/presentation/see_all__view.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/my_brands/my_brands_view.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class JoinViewBodyInSeeAll extends StatefulWidget {
  Companies item;

  JoinViewBodyInSeeAll({Key? key, required this.item}) : super(key: key);

  @override
  State<JoinViewBodyInSeeAll> createState() => _JoinViewBodyInSeeAllState();
}

class _JoinViewBodyInSeeAllState extends State<JoinViewBodyInSeeAll> {
  final ScrollController controller = ScrollController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
    BlocProvider.of<MyBrandsCubit>(context).getTermsAndConditions();
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      setState(() {
        _isButtonEnabled = true;
      });
      // } else {
      //   setState(() {
      //     _isButtonEnabled = false;
      //   });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // if (state is CreateJoinSuccessState) {
        //   print('Successsssssssssssssss');
        // } else if (state is CreateJoinErrorState) {
        //   print('errrrrorrrr');
        // }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(1),
                  blurRadius: 20,
                  offset: const Offset(0, 2),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  blurRadius: 30,
                  offset: const Offset(0, 3),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.6),
                  blurRadius: 40,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 55.h),
                  width: 167.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.grey8Color,
                    borderRadius: BorderRadius.circular(70.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.close1,
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Decline',
                        style: GoogleFonts.darkerGrotesque(
                          fontSize: 20.sp,
                          color: AppColors.black6Color,
                          fontWeight: FontWeight.bold,
                          height: 1.h,
                        ),
                      ),
                    ],
                  ),
                ),
                state is CreateJoinLoadingState
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                        onTap: _isButtonEnabled
                            ? () {
                                /// Create Function to Join
                                cubit.createJoinInAccept(
                                    '517644bf-faf4-4568-8305-8ae77b07ebfc');
                              }
                            : null,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 55.h),
                          width: 167.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: _isButtonEnabled
                                ? AppColors.primaryColor
                                : AppColors.greyColor,
                            borderRadius: BorderRadius.circular(70.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppAssets.check1,
                                height: 24.h,
                                width: 24.w,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                'Accept',
                                style: GoogleFonts.darkerGrotesque(
                                  fontSize: 20.sp,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  height: 1.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
          // body: Stack(
          //   alignment: Alignment.topCenter,
          //   children: [
          //     Image.asset(
          //       'assets/images/banner8.png',
          //       width: 393.w,
          //       height: 201.h,
          //       fit: BoxFit.fitHeight,
          //     ),
          //     Positioned(
          //       top: 53.h,
          //       left: 30.w,
          //       child: GestureDetector(
          //         onTap: () {
          //           navigateHomeScreen(context);
          //         },
          //         child: SvgPicture.asset(AppAssets.arrowContainer),
          //       ),
          //     ),
          //     Positioned(
          //       top: 58.h,
          //       right: 30.w,
          //       child: SvgPicture.asset(AppAssets.infoCircle),
          //     ),
          //     Container(
          //       width: double.infinity,
          //       height: double.infinity,
          //       margin: EdgeInsets.only(top: 140.h),
          //       decoration: BoxDecoration(
          //         color: AppColors.grey4Color,
          //         borderRadius: BorderRadius.only(
          //           topRight: Radius.circular(25.r),
          //           topLeft: Radius.circular(25.r),
          //         ),
          //       ),
          //       child: SingleChildScrollView(
          //         child: Column(
          //           children: [
          //             Padding(
          //               padding:
          //                   EdgeInsets.only(top: 24.h, left: 30.w, right: 30.w),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   Row(
          //                     children: [
          //                       Image.asset(
          //                         AppAssets.one_one,
          //                         width: 44.w,
          //                         height: 44.h,
          //                       ),
          //                       SizedBox(
          //                         width: 9.w,
          //                       ),
          //                       Text(
          //                         'Starbucks',
          //                         style: GoogleFonts.darkerGrotesque(
          //                           height: 1.h,
          //                           fontSize: 20.sp,
          //                           fontWeight: FontWeight.bold,
          //                           color: AppColors.blackColor,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   Image.asset(AppAssets.drop),
          //                 ],
          //               ),
          //             ),
          //             SizedBox(height: 21.h),
          //             SizedBox(
          //               height: 90.h,
          //               child: ListView(
          //                 padding: EdgeInsets.only(left: 30.w),
          //                 scrollDirection: Axis.horizontal,
          //                 children: [
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       const CustomContainerInJoinScreen(
          //                           image: AppAssets.personalOffers,
          //                           text: 'Personal \n Offers'),
          //                       SizedBox(width: 11.w),
          //                       const CustomContainerInJoinScreen(
          //                           image: AppAssets.coupons, text: 'Coupons'),
          //                       SizedBox(width: 11.w),
          //                       const CustomContainerInJoinScreen(
          //                           image: AppAssets.award, text: 'Rewards'),
          //                       SizedBox(width: 11.w),
          //                       const CustomContainerInJoinScreen(
          //                           image: AppAssets.personalOffers,
          //                           text: 'Receipts'),
          //                       SizedBox(width: 11.w),
          //                       const CustomContainerInJoinScreen(
          //                           image: AppAssets.personalOffers,
          //                           text: 'Receipts'),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             SizedBox(height: 21.h),
          //             GridView.builder(
          //               padding: EdgeInsets.symmetric(horizontal: 20.w),
          //               physics: const NeverScrollableScrollPhysics(),
          //               shrinkWrap: true,
          //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //                 crossAxisSpacing: 13.w,
          //                 mainAxisSpacing: 13.h,
          //                 childAspectRatio: 1 / 1.5,
          //                 crossAxisCount: 2,
          //               ),
          //               itemCount: 6,
          //               itemBuilder: (context, index) {
          //                 return Container(
          //                   height: 237.h,
          //                   width: 170.w,
          //                   decoration: BoxDecoration(
          //                     color: AppColors.whiteColor,
          //                     borderRadius: BorderRadius.circular(15.r),
          //                   ),
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Stack(
          //                         children: [
          //                           ClipRRect(
          //                             borderRadius: BorderRadius.only(
          //                               topLeft: Radius.circular(15.r),
          //                               topRight: Radius.circular(15.r),
          //                             ),
          //                             child: Image.asset(
          //                               AppAssets.one,
          //                               width: 170.w,
          //                               height: 173.h,
          //                               fit: BoxFit.cover,
          //                             ),
          //                           ),
          //                           Positioned(
          //                             top: 8.h,
          //                             left: 8.w,
          //                             child: Image.asset(
          //                               AppAssets.one_one,
          //                               width: 35.w,
          //                               height: 35.h,
          //                             ),
          //                           ),
          //                           Positioned(
          //                             bottom: 5.81.h,
          //                             left: 8.w,
          //                             child: Image.asset(
          //                               AppAssets.offer,
          //                               width: 35.w,
          //                               height: 35.h,
          //                             ),
          //                           ),
          //                           Positioned(
          //                             bottom: 6.41.h,
          //                             right: 9.41.w,
          //                             child: Container(
          //                               width: 30.18,
          //                               height: 30.18,
          //                               decoration: BoxDecoration(
          //                                 borderRadius:
          //                                     BorderRadius.circular(50.sp),
          //                                 color: AppColors.whiteColor,
          //                               ),
          //                               padding: EdgeInsets.symmetric(
          //                                 horizontal: 9.81.w,
          //                                 vertical: 9.81.w,
          //                               ),
          //                               child: SvgPicture.asset(
          //                                 AppAssets.add,
          //                                 width: 10.56.w,
          //                                 height: 10.56.h,
          //                               ),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.only(
          //                             top: 10.h,
          //                             // bottom: 2.h,
          //                             left: 12.w,
          //                             right: 9.h),
          //                         child: Column(
          //                           crossAxisAlignment: CrossAxisAlignment.start,
          //                           children: [
          //                             Text(
          //                               'Shein Sjorta vinyl',
          //                               style: GoogleFonts.darkerGrotesque(
          //                                 color: AppColors.blackColor,
          //                                 height: 1.h,
          //                                 fontWeight: FontWeight.bold,
          //                                 fontSize: 16.sp,
          //                               ),
          //                             ),
          //                             Text(
          //                               'awespme',
          //                               style: GoogleFonts.darkerGrotesque(
          //                                 color: AppColors.blackColor,
          //                                 height: 1.h,
          //                                 fontWeight: FontWeight.bold,
          //                                 fontSize: 16.sp,
          //                               ),
          //                             ),
          //                             SizedBox(height: 6.h),
          //                             Row(
          //                               children: [
          //                                 Text(
          //                                   '1 218 kr',
          //                                   style: GoogleFonts.darkerGrotesque(
          //                                     color: AppColors.orangeColor,
          //                                     height: 1.h,
          //                                     fontWeight: FontWeight.w500,
          //                                     fontSize: 16.sp,
          //                                   ),
          //                                 ),
          //                                 SizedBox(width: 6.w),
          //                                 Text(
          //                                   '1 718 kr',
          //                                   style: GoogleFonts.darkerGrotesque(
          //                                     color: AppColors.grey7Color,
          //                                     decoration:
          //                                         TextDecoration.lineThrough,
          //                                     height: 1.h,
          //                                     fontWeight: FontWeight.w500,
          //                                     fontSize: 16.sp,
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 );
          //               },
          //             ),
          //             SizedBox(height: 120.h),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                navigatePop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: SvgPicture.asset(
                  AppAssets.container_close,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 22.w),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: 24.h),

                    ///
                    Row(
                      children: [
                        Image.network(
                          widget.item.logo ??
                              'https://w7.pngwing.com/pngs/539/973/png-transparent-kfc-fried-chicken-fast-food-restaurant-kfc-food-recipe-chicken-meat-thumbnail.png',
                          height: 64.h,
                          width: 64.w,
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          widget.item.displayName ?? 'Loading',
                          style: GoogleFonts.darkerGrotesque(
                            height: 1.h,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 29.h),
                    Theme(
                      data: Theme.of(context).copyWith(
                        highlightColor: AppColors.primaryColor,
                        scrollbarTheme: ScrollbarThemeData(
                          isAlwaysShown: true,
                          trackBorderColor:
                              MaterialStateProperty.all(AppColors.primaryColor),
                          // trackBorderWidth: 2.0,
                          thumbColor:
                              MaterialStateProperty.all(AppColors.primaryColor),
                          trackColor:
                              MaterialStateProperty.all(AppColors.blackColor),
                          // mainAxisMargin: 200,
                        ),
                      ),
                      child: Scrollbar(
                        controller: controller,
                        thickness: 6.w,
                        radius: Radius.circular(300.r),
                        interactive: true,
                        isAlwaysShown: true,
                        child: SizedBox(
                          height: 525,
                          child: ListView.separated(
                            controller: controller,
                            // physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 1,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 54.h);
                            },
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Terms and Conditions',
                                    style: GoogleFonts.darkerGrotesque(
                                      color: AppColors.black3Color,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                      height: 1.h,
                                    ),
                                  ),
                                  SizedBox(height: 23.h),
                                  Column(
                                    children: [
                                      state is GetTermsAndConditionsLoadingState
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                                color: AppColors.primaryColor,
                                              ),
                                            )
                                          : Text(
                                              BlocProvider.of<MyBrandsCubit>(
                                                          context)
                                                      .termsAndConditions ??
                                                  'Loading',
                                              style:
                                                  GoogleFonts.darkerGrotesque(
                                                color: AppColors.black3Color,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 1.h,
                                              ),
                                            ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 80.h),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // void navigateHomeScreen(BuildContext context) {
  //   Navigator.pushReplacement(
  //     context,
  //     PageRouteBuilder(
  //       transitionDuration: const Duration(milliseconds: 250),
  //       pageBuilder: (_, __, ___) => const HomeView(),
  //       transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
  //         return SlideTransition(
  //           position: Tween<Offset>(
  //             begin: const Offset(-1.0, 0.0),
  //             end: Offset.zero,
  //           ).animate(animation),
  //           child: child,
  //         );
  //       },
  //     ),
  //   );
  // }

  void navigatePop(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const SeeAllView(),
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

class CustomContainerInJoinScreen extends StatelessWidget {
  final String image, text;

  const CustomContainerInJoinScreen(
      {Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.w,
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.5.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          SvgPicture.asset(
            image,
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(height: 8.h),
          Text(
            text,
            style: GoogleFonts.darkerGrotesque(
              fontWeight: FontWeight.bold,
              height: 1.h,
              fontSize: 14.sp,
              color: AppColors.black3Color,
            ),
          ),
        ],
      ),
    );
  }
}
