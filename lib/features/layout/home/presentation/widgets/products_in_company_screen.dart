// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/presentation/widgets/check_view_body.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/login_button_widget.dart';
import 'package:bella/features/layout/home/data/models/company_profile.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_member_only.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_recommended_products.dart';
import 'package:bella/features/layout/wish_list/managers/wish_list_cubit/wish_list_cubit.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsInCompanyScreen extends StatefulWidget {
  String logo, display_name;

  ProductsInCompanyScreen(
      {Key? key, required this.logo, required this.display_name})
      : super(key: key);

  @override
  State<ProductsInCompanyScreen> createState() =>
      _ProductsInCompanyScreenState();
}

class _ProductsInCompanyScreenState extends State<ProductsInCompanyScreen> {
  int _currentIndex = 0;
  int selectedItem = 0;
  PageController _pageController = PageController();

  Color colorOfIconAddToCart = Colors.black;

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getCompanyProducts();
    BlocProvider.of<HomeCubit>(context).companyProfileFunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListState>(
      builder: (context, state) {
        var wishListCubit = BlocProvider.of<WishListCubit>(context);

        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<HomeCubit>(context);

            dynamic progressPercentage = (cubit.companyProfile!.balance! -
                    cubit.companyProfile!.start!) /
                (cubit.companyProfile!.end! - cubit.companyProfile!.start!) *
                318;
            return Scaffold(
              backgroundColor: AppColors.bgColor,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Padding(
                  padding: EdgeInsets.only(
                    // left: 20.w,
                    top: 11.h,
                  ),
                  child: Text(
                    widget.display_name,
                    style: AppFonts.titleSubsection.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      top: 11.h,
                    ),
                    child: SvgPicture.asset(
                      AppAssets.arrowContainer,
                      width: 17.9.w,
                      height: 11.3.h,
                      // color: Colors.black,
                    ),
                  ),
                ),
                actions: [
                  Container(
                    margin: EdgeInsets.only(right: 27.w),
                    width: 20.w,
                    height: 16.h,
                    child: SvgPicture.asset(AppAssets.more),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40.r),
                                  child: AppConstants.showNetworkImage(
                                    image: widget.logo,
                                    width: 64.h,
                                    height: 64.h,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                // Text(
                                //   widget.display_name,
                                //   style: GoogleFonts.darkerGrotesque(
                                //     color: AppColors.blackColor,
                                //     fontWeight: FontWeight.w700,
                                //     fontSize: 18.sp,
                                //   ),
                                // ),
                              ],
                            ),
                            Container(
                              width: 126.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                color: AppColors.grey8Color,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 7.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.address,
                                      height: 16.h,
                                      width: 16.w,
                                    ),
                                    SizedBox(width: 2.w),
                                    Text(
                                      'Favourite Store',
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.darkerGrotesque(
                                        height: 1.h,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      AppAssets.dwon,
                                      height: 16.h,
                                      width: 16.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 19.h),
                      // Image.asset(
                      //   AppAssets.reward,
                      //   width: double.infinity,
                      //   height: 177.h,
                      // ),
                      Container(
                        width: 393.w,
                        height: 187.h,
                        padding: EdgeInsets.only(
                          right: 30.w,
                          left: 30.w,
                          top: 36.h,
                          bottom: 20.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'Balance',
                            //       style: AppFonts.productTag.copyWith(
                            //         color:
                            //             AppColors.black3Color.withOpacity(0.7),
                            //       ),
                            //     ),
                            //     Text(
                            //       'How it works',
                            //       style: AppFonts.linkDefault.copyWith(
                            //         decoration: TextDecoration.underline,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 83.w,
                                  height: 29.h,
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(7.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${cubit.companyProfile!.balance} ${cubit.companyProfile!.unit}',
                                      style: AppFonts.bodyLargeBold.copyWith(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Reset on: ${cubit.companyProfile!.validTo}',
                                  style: AppFonts.productTag.copyWith(
                                    color:
                                        AppColors.black3Color.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 18.h),
                            // Positioned(
                            //   left: 58.79.w,
                            //   child: Image.asset(AppAssets.gift2white),
                            // ),
                            // Positioned(
                            //   left: 124.57.w,
                            //   child: Image.asset(AppAssets.gift2white),
                            // ),
                            // Positioned(
                            //   left: 198.57.w,
                            //   child: Image.asset(AppAssets.gift2white),
                            // ),
                            // Positioned(
                            //   left: 300.w,
                            //   child: Image.asset(AppAssets.gift2white),
                            // ),
                            // Positioned(
                            //   left: 58.79.w,
                            //   child: Image.asset(AppAssets.gift2white),
                            // ),
                            // Positioned(
                            //   left: 124.57.w,
                            //   child: Image.asset(AppAssets.gift2white),
                            // ),
                            // Positioned(
                            //   left: 198.57.w,
                            //   child: Image.asset(AppAssets.gift2white),
                            // ),
                            // Positioned(
                            //   left: 300.w,
                            //   child: Image.asset(AppAssets.gift2white),
                            // ),
                            // StepperComponent(
                            //   currentIndex: _currentIndex,
                            //   index: 0,
                            //   onTap: () {
                            //     setState(() {
                            //       _currentIndex = 0;
                            //     });
                            //     _pageController.jumpToPage(0);
                            //   },
                            // ),
                            // StepperComponent(
                            //   currentIndex: _currentIndex,
                            //   index: 1,
                            //   onTap: () {
                            //     setState(() {
                            //       _currentIndex = 1;
                            //     });
                            //     _pageController.jumpToPage(1);
                            //   },
                            // ),
                            // StepperComponent(
                            //   currentIndex: _currentIndex,
                            //   index: 2,
                            //   onTap: () {
                            //     setState(() {
                            //       _currentIndex = 2;
                            //     });
                            //     _pageController.jumpToPage(2);
                            //   },
                            // ),
                            // StepperComponent(
                            //   currentIndex: _currentIndex,
                            //   index: 3,
                            //   isLast: true,
                            //   onTap: () {
                            //     setState(() {
                            //       _currentIndex = 3;
                            //     });
                            //     _pageController.jumpToPage(3);
                            //   },
                            // ),

                            ///
                            // Container(
                            //   height: 6.h,
                            //   child: ListView.builder(
                            //     scrollDirection: Axis.horizontal,
                            //     shrinkWrap: true,
                            //     itemCount:
                            //         cubit.companyProfile!.milestones!.length,
                            //     itemBuilder: (context, index) {
                            //       return Row();
                            //     },
                            //   ),
                            // ),
                            SizedBox(height: 10.h),

                            ///
                            // Column(
                            //   children: [
                            //     Container(
                            //       height: 6.h,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(400.r),
                            //       ),
                            //       child: Stack(
                            //         children: [
                            //           Container(
                            //             height: 6.h,
                            //             width: 318.w,
                            //             decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(400.r),
                            //               color: AppColors.bgColor,
                            //             ),
                            //             child: Row(
                            //               children: [
                            //                 Container(
                            //                   height: 6.h,
                            //                   width: progress_percentage,
                            //                   decoration: BoxDecoration(
                            //                     color: AppColors.primaryColor,
                            //                     borderRadius:
                            //                         BorderRadius.circular(
                            //                             400.r),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     SizedBox(height: 4.h),
                            //     Container(
                            //       width: 318.w,
                            //       child: Row(
                            //         children: cubit.companyProfile!.milestones!
                            //             .map((milestone) {
                            //           double milestonePosition = (milestone
                            //                       .limit! -
                            //                   cubit.companyProfile!.start!) /
                            //               (cubit.companyProfile!.end! -
                            //                   cubit.companyProfile!.start!) *
                            //               318.w;
                            //           return Expanded(
                            //             child: Column(
                            //               children: [
                            //                 SizedBox(height: 4.h),
                            //                 Container(
                            //                   width: 24.w,
                            //                   height: 24.h,
                            //                   decoration: BoxDecoration(
                            //                     borderRadius:
                            //                         BorderRadius.circular(
                            //                             379.59.r),
                            //                     color: milestone.reached == true
                            //                         ? AppColors.primaryColor
                            //                         : AppColors.bgColor,
                            //                   ),
                            //                   child: Center(
                            //                     child: SvgPicture.asset(
                            //                       milestone.reached == true
                            //                           ? AppAssets.giftSvgLight
                            //                           : AppAssets.giftSvgDark,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 SizedBox(height: 5.h),
                            //                 Text(
                            //                   '${milestone.limit} ${cubit.companyProfile!.unit}',
                            //                   style:
                            //                       AppFonts.productTag.copyWith(
                            //                     color: AppColors.black3Color
                            //                         .withOpacity(0.7),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           );
                            //         }).toList(),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            ///
                            Column(
                              children: [
                                ///   Progress
                                Container(
                                  height: 6.h,
                                  width: 318.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(400.r),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 6.h,
                                        width: 318.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(400.r),
                                          color: AppColors.bgColor,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 6.h,
                                              width: progressPercentage,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  400.r,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 318.w,
                                  child: Row(
                                    children: cubit.companyProfile!.milestones!
                                        .map((milestone) {
                                      // double milestonePosition;
                                      // if (milestone.limit! ==
                                      //     cubit.companyProfile!.end!) {
                                      // print('endddddddddddddddddddddddddd ${milestone.name}');
                                      // milestonePosition = 318.w;
                                      // } else {
                                      double milestonePosition = (milestone
                                                  .limit! -
                                              cubit.companyProfile!.start!) /
                                          (cubit.companyProfile!.end! -
                                              cubit.companyProfile!.start!) *
                                          318.w;
                                      // }
                                      return Expanded(
                                        child: Align(
                                          alignment: Alignment(
                                            milestonePosition / 318.w,
                                            0,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 14.h,
                                                child: VerticalDivider(
                                                  thickness: 0.5.w,
                                                  width: 0.5.w,
                                                  color: milestone.reached ==
                                                          true
                                                      ? AppColors.primaryColor
                                                      : AppColors.grey14Color,
                                                ),
                                              ),
                                              Container(
                                                width: 24.w,
                                                height: 24.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          379.59.r),
                                                  color: milestone.reached ==
                                                          true
                                                      ? AppColors.primaryColor
                                                      : AppColors.bgColor,
                                                ),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    milestone.reached == true
                                                        ? AppAssets.giftSvgLight
                                                        : AppAssets.giftSvgDark,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                '${milestone.limit} ${cubit.companyProfile!.unit}',
                                                style: AppFonts.productTag
                                                    .copyWith(
                                                  color: AppColors.black3Color
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),

                            ///
                            ///
                            // Container(
                            //   height: 6.h,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(400.r),
                            //   ),
                            //   child: Stack(
                            //     children: [
                            //       Container(
                            //         height: 6.h,
                            //         // height: 51.88.h,
                            //         width: 318.w,
                            //         decoration: BoxDecoration(
                            //           borderRadius:
                            //               BorderRadius.circular(400.r),
                            //           color: AppColors.bgColor,
                            //         ),
                            //         child: Row(
                            //           children: [
                            //             Stack(
                            //               children: [
                            //                 Container(
                            //                   height: 6.h,
                            //                   width: progress_percentage,
                            //                   decoration: BoxDecoration(
                            //                     color: AppColors.primaryColor,
                            //                     borderRadius:
                            //                         BorderRadius.circular(
                            //                             400.r),
                            //                   ),
                            //                 ),
                            //                 // ListView.builder(
                            //                 //   physics:
                            //                 //       const NeverScrollableScrollPhysics(),
                            //                 //   scrollDirection: Axis.horizontal,
                            //                 //   shrinkWrap: true,
                            //                 //   itemCount: cubit.companyProfile!
                            //                 //       .milestones!.length,
                            //                 //   itemBuilder: (context, index) {
                            //                 //     List<Milestones> milestones =
                            //                 //         cubit.companyProfile!
                            //                 //             .milestones!;
                            //                 //
                            //                 //     dynamic milestone_position;
                            //                 //
                            //                 //     milestones.forEach((milestone) {
                            //                 //       milestone_position = (milestone
                            //                 //                   .limit! -
                            //                 //               cubit.companyProfile!
                            //                 //                   .start!) /
                            //                 //           (cubit.companyProfile!
                            //                 //                   .end! -
                            //                 //               cubit.companyProfile!
                            //                 //                   .start!) *
                            //                 //           318;
                            //                 //     });
                            //                 //
                            //                 //     return Align(
                            //                 //       alignment:
                            //                 //           Alignment.topCenter,
                            //                 //       // left: milestone_position,
                            //                 //       child: cubit
                            //                 //                   .companyProfile!
                            //                 //                   .milestones![
                            //                 //                       index]
                            //                 //                   .reached! ==
                            //                 //               true
                            //                 //           ? Image.asset(
                            //                 //               AppAssets.gift2white,
                            //                 //             )
                            //                 //           : Container(),
                            //                 //     );
                            //                 //   },
                            //                 // )
                            //               ],
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       // Positioned(
                            //       //   left: 58.79.w,
                            //       //   child: Align(
                            //       //     alignment: Alignment.topCenter,
                            //       //     child: Image.asset(AppAssets.gift2),
                            //       //   ),
                            //       // ),
                            //       // Positioned(
                            //       //   left: 124.57.w,
                            //       //   child: Align(
                            //       //     alignment: Alignment.topCenter,
                            //       //     child: Image.asset(AppAssets.gift2),
                            //       //   ),
                            //       // ),
                            //       // Positioned(
                            //       //   left: 198.57.w,
                            //       //   child: Align(
                            //       //     alignment: Alignment.topCenter,
                            //       //     child: Image.asset(AppAssets.gift2),
                            //       //   ),
                            //       // ),
                            //       // Positioned(
                            //       //   left: 300.w,
                            //       //   child: Align(
                            //       //     alignment: Alignment.topCenter,
                            //       //     child: Image.asset(AppAssets.gift2),
                            //       //   ),
                            //       // ),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(height: 4.h),
                            // Container(
                            //   width: 318.w,
                            //   height: 55.h,
                            //   child: Row(
                            //     children: cubit.companyProfile!.milestones!.map((milestone) {
                            //       double milestonePosition = (milestone.limit! - cubit.companyProfile!.start!) / (cubit.companyProfile!.end! - cubit.companyProfile!.start!) * 318.w;
                            //       return Column(
                            //         children: [
                            //           VerticalDivider(
                            //             thickness: 0.5.w,
                            //             width: 0.5.w,
                            //             color: milestone.reached == true ? AppColors.primaryColor : AppColors.grey14Color,
                            //           ),
                            //           Container(
                            //             width: 24.w,
                            //             height: 24.h,
                            //             decoration: BoxDecoration(
                            //               borderRadius: BorderRadius.circular(379.59.r),
                            //               color: milestone.reached == true ? AppColors.primaryColor : AppColors.bgColor,
                            //             ),
                            //             child: Center(
                            //               child: SvgPicture.asset(
                            //                 milestone.reached == true ? AppAssets.giftSvgLight : AppAssets.giftSvgDark,
                            //               ),
                            //             ),
                            //           ),
                            //           SizedBox(height: 5.h),
                            //           Text(
                            //             '${milestone.limit} ${cubit.companyProfile!.unit}',
                            //             style: AppFonts.productTag.copyWith(
                            //               color: AppColors.black3Color.withOpacity(0.7),
                            //             ),
                            //           ),
                            //         ],
                            //       );
                            //     }).expand((widget) => [widget, SizedBox(width: 8.w)]).toList(),
                            //   ),
                            // ),

                            ///
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Text(
                            //           '${cubit.companyProfile!.start} ${cubit.companyProfile!.unit}'),
                            //       Text(
                            //           '${cubit.companyProfile!.end} ${cubit.companyProfile!.unit}'),
                            //     ],
                            //   ),
                            // ),
                            ///
//                             Container(
//                               width: 318.w,
//                               height: 55.h,
//                               child: ListView.builder(
//                                 shrinkWrap: true,
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount:
//                                     cubit.companyProfile!.milestones!.length,
//                                 itemBuilder: (context, index) {
//                                   dynamic milestonePosition = (cubit
//                                               .companyProfile!
//                                               .milestones![index]
//                                               .limit! -
//                                           cubit.companyProfile!.start!) /
//                                       (cubit.companyProfile!.end! -
//                                           cubit.companyProfile!.start!) *
//                                       318.w;
//
//                                   return Column(
//                                     children: [
//                                       VerticalDivider(
//                                         thickness: 0.5.w,
//                                         width: 0.5.w,
//                                         color: cubit
//                                                     .companyProfile!
//                                                     .milestones![index]
//                                                     .reached ==
//                                                 true
//                                             ? AppColors.primaryColor
//                                             : AppColors.grey14Color,
//                                       ),
//                                       Container(
//                                         width: 24.w,
//                                         height: 24.h,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(379.59.r),
//                                           color: cubit
//                                                       .companyProfile!
//                                                       .milestones![index]
//                                                       .reached ==
//                                                   true
//                                               ? AppColors.primaryColor
//                                               : AppColors.bgColor,
//                                         ),
//                                         child: Center(
//                                           child: SvgPicture.asset(
//                                             cubit
//                                                         .companyProfile!
//                                                         .milestones![index]
//                                                         .reached ==
//                                                     true
//                                                 ? AppAssets.giftSvgLight
//                                                 : AppAssets.giftSvgDark,
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 5.h),
//                                       Text(
//                                         '${cubit.companyProfile!.milestones![index].limit} ${cubit.companyProfile!.unit}',
//                                         style: AppFonts.productTag.copyWith(
//                                           color: AppColors.black3Color
//                                               .withOpacity(0.7),
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                             ),
                            ///
                            ///
                            // Container(
                            //   height: 51.h,
                            //   child: Stack(
                            //     children: [
                            //       Container(
                            //         height: 6.h,
                            //         width: 318.w,
                            //         color: AppColors.bgColor,
                            //         child: Row(
                            //           children: [
                            //             Stack(
                            //               children: [
                            //                 Container(
                            //                   height: 6.h,
                            //                   width: progress_percentage,
                            //                   color: AppColors.primaryColor,
                            //                 ),
                            //                 ListView.builder(
                            //                   physics: NeverScrollableScrollPhysics(),
                            //                   scrollDirection: Axis.horizontal,
                            //                   shrinkWrap: true,
                            //                   itemCount: cubit.companyProfile!.milestones!.length,
                            //                   itemBuilder: (context, index) {
                            //                     List<Milestones> milestones = cubit.companyProfile!.milestones!;
                            //                     dynamic milestone_position;
                            //                     milestones.forEach((milestone) {
                            //                       milestone_position = (milestone.limit! - cubit.companyProfile!.start!) / (cubit.companyProfile!.end! - cubit.companyProfile!.start!) * 318;
                            //                     });
                            //                     return Align(
                            //                       alignment: Alignment.centerLeft,
                            //                       child: cubit.companyProfile!.milestones![index].reached! == true
                            //                           ? Image.asset(AppAssets.gift2white)
                            //                           : Container(),
                            //                     );
                            //                   },
                            //                 )
                            //               ],
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       Align(
                            //         alignment: Alignment.centerLeft,
                            //         child: Image.asset(AppAssets.gift2),
                            //       ),
                            //       Align(
                            //         alignment: Alignment.centerLeft,
                            //         child: Image.asset(AppAssets.gift2),
                            //       ),
                            //       Align(
                            //         alignment: Alignment.centerLeft,
                            //         child: Image.asset(AppAssets.gift2),
                            //       ),
                            //       Align(
                            //         alignment: Alignment.centerLeft,
                            //         child: Image.asset(AppAssets.gift2),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(height: 44.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: GestureDetector(
                          onTap: () {
                            print('Click');
                          },
                          child: Container(
                            width: 353.w,
                            height: 52.h,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(300.r),
                            ),
                            child: Center(
                              child: Text(
                                'Join',
                                style: AppFonts.bodyLargeBold.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 46.h),

                      /// Get Company Products
                      state is GetCompanyProductsLoadingState
                          ? const CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            )
                          : cubit.getCompanyProductsModel == null
                              ? const CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                )
                              : cubit.getCompanyProductsModel!.companyProducts!
                                      .isEmpty
                                  ? Text(
                                      'No products',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        color: AppColors.blackColor,
                                      ),
                                    )
                                  : BlocBuilder<WishListCubit, WishListState>(
                                      builder: (context, state) {
                                        var wishCubit =
                                            BlocProvider.of<WishListCubit>(
                                                context);
                                        return GridView.builder(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisSpacing: 13.w,
                                            mainAxisSpacing: 13.h,
                                            childAspectRatio: 1 / 1.72,
                                            crossAxisCount: 2,
                                          ),
                                          itemCount: cubit
                                              .getCompanyProductsModel!
                                              .companyProducts!
                                              .length,
                                          itemBuilder: (context, index) {
                                            var products = cubit
                                                .getCompanyProductsModel!
                                                .companyProducts![index];
                                            var wishList =
                                                wishListCubit.wishListModel;

                                            // bool isInWishlist(String productId) {
                                            //   bool result = false;
                                            //   for (var product in wishListCubit.wishListModel!) {
                                            //     if (product.id == productId) {
                                            //       result = true;
                                            //       break;
                                            //     }
                                            //   }
                                            //   return result;
                                            // }

                                            return CustomRecommendedProducts(
                                              logoOfCompany:
                                                  products.company_logo,
                                              imageOfProduct:
                                                  products.imageLinks![0],
                                              title: products.title!,
                                              description:
                                                  products.description!,
                                              currency:
                                                  products.pricing!.currency!,
                                              regularPrice: products
                                                      .pricing!.regularPrice ??
                                                  0.0,
                                              salePrice:
                                                  products.pricing!.salePrice ??
                                                      0.0,
                                              customMemberOnly:
                                                  products.membersOnly == true
                                                      ? const CustomMemberOnly()
                                                      : Container(),
                                              onTap: () {
                                                // MyCache.putString(
                                                //   key: CacheKeys.comp_id,
                                                //   value: product.companyId.toString(),
                                                // );
                                                // navigateToProductDetailsScreen(product);
                                              },
                                              widget: wishListCubit
                                                      .checkProductInWishList(
                                                productId: products.id!,
                                              )
                                                  ? SvgPicture.asset(
                                                      AppAssets.Vector,
                                                      width: 12.46.w,
                                                      height: 12.46.h,
                                                      color:
                                                          AppColors.whiteColor,
                                                    )
                                                  : SvgPicture.asset(
                                                      AppAssets.add,
                                                      width: 12.46.w,
                                                      height: 12.46.h,
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                              buttonColor: wishListCubit
                                                      .checkProductInWishList(
                                                          productId:
                                                              products.id!)
                                                  ? AppColors.primaryColor
                                                  : AppColors.whiteColor,
                                              onTapAddToCart: () {
                                                AppConstants.showFlushBar(
                                                    context,
                                                    'Item added to wishlist');
                                                wishCubit.addToCart(
                                                  company_logo_link: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .company_logo!,
                                                  company_display_name: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .company_display_name!,
                                                  product_id: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .id!,
                                                  product_image_link: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .imageLinks![0],
                                                  product_title: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .title!,
                                                  regular_price: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .pricing!
                                                      .regularPrice,
                                                  sale_price: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .pricing!
                                                      .salePrice,
                                                  currency: cubit
                                                      .getRecommendedProductsModel!
                                                      .recommendedProducts![
                                                          index]
                                                      .pricing!
                                                      .currency,
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CustomContainerInProductsInCompanyScreen extends StatelessWidget {
  final String text, icon;
  void Function()? onTap;
  Color borderColor;

  CustomContainerInProductsInCompanyScreen(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onTap,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 79.w,
        height: 90.h,
        padding: EdgeInsets.only(
          top: 21.h,
          bottom: 12.h,
          right: 10.w,
          left: 10.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.grey8Color,
          border: Border.all(
            color: borderColor,
            width: 2.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              icon,
              width: 24.w,
              height: 24.h,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: AppColors.black3Color,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepperComponent extends StatelessWidget {
  // index describe the position of our bubble
  int index;

  //currentIndex is index that is gonna change on Tap
  int currentIndex;

  //onTap CallBack
  VoidCallback onTap;

  bool isLast;

  StepperComponent({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLast
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(379.59.r),
                        color: index == currentIndex
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        image: DecorationImage(
                          image: AssetImage(
                            index == currentIndex
                                ? AppAssets.gift2white
                                : AppAssets.gift2,
                          ),
                        ),
                        border: Border.all(
                          color: currentIndex >= index
                              ? AppColors.primaryColor
                              : Colors.black12,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: currentIndex >= index + 1
                        ? AppColors.primaryColor
                        : Colors.black12,
                  ),
                ],
              ),
              Text(
                'Page ${index + 1}',
                style: AppFonts.productTag.copyWith(
                  color: AppColors.black3Color.withOpacity(0.7),
                ),
              ),
            ],
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(379.59.r),
                          color: index == currentIndex
                              ? AppColors.primaryColor
                              : Colors.transparent,
                          border: Border.all(
                            color: currentIndex >= index
                                ? AppColors.primaryColor
                                : Colors.black12,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              index == currentIndex
                                  ? AppAssets.gift2white
                                  : AppAssets.gift2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 6.h,
                        color: currentIndex >= index + 1
                            ? AppColors.primaryColor
                            : Colors.black12,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Page ${index + 1}',
                  style: AppFonts.productTag.copyWith(
                    color: AppColors.black3Color.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          );
  }
}
