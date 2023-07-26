// ignore_for_file: must_be_immutable

import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/see_all__view.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/final_view_in_join/final_view_in_join.dart';
import 'package:bella/features/layout/scan/managers/scan_cubit.dart';
import 'package:bella/features/layout/scan/presentation/final_view_in_scan.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatefulWidget {
  String? companyId;
  dynamic? onTap;
  void Function()? onCancelButtonInFinalScreen;
  String? flow;
  String? initialView;

  // String initialScreen;
  bool? hasJoined;

  TermsAndConditions({
    Key? key,
    this.companyId,
    this.onTap,
    this.flow,
    this.initialView,
    // this.initialScreen,
    this.onCancelButtonInFinalScreen,
    this.hasJoined,
  }) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  final ScrollController controller = ScrollController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
    print('COMPANY ID');
    print(MyCache.getString(key: CacheKeys.comp_id));
    print('COMPANY ID');
    BlocProvider.of<MyBrandsCubit>(context).getTermsAndConditions();
  }

  @override
  void dispose() {
    BlocProvider.of<MyBrandsCubit>(context).clearTermsAndConditionsState();
    super.dispose();
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      setState(() {
        _isButtonEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext termsAndConditionsContext) {
    return BlocConsumer<MyBrandsCubit, MyBrandsState>(
      listener: (context, state) {
        // if(state is GetTermsAndConditionsLoadingState)  {
        //   BlocProvider.of<MyBrandsCubit>(context).clearTermsAndConditionsState();
        // }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<MyBrandsCubit>(context);

        return Scaffold(
          backgroundColor: AppColors.bgColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            height: 160.h,
            width: 393.w,
            padding: EdgeInsets.only(top: 15.h),
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocConsumer<ScanCubit, ScanState>(
                  listener: (context, state) {
                    if (state is PostJoinCompanySuccessState) {
                      print('My Print 1');
                      BlocProvider.of<MyBrandsCubit>(context).joinedFunction();
                      BlocProvider.of<MyBrandsCubit>(context)
                          .notJoinedFunction(context);
                      BlocProvider.of<HomeCubit>(context).getRecommended();
                      BlocProvider.of<HomeCubit>(context).getAllCompanies();
                      print('My Print2');
                      if (widget.flow == 'Join') {
                        Navigator.push(
                          termsAndConditionsContext,
                          MaterialPageRoute(
                            builder: (context) => FinalViewInJoin(
                              initialView: widget.initialView!,
                              // onCloseButtonInFinalInJoin: widget.onCancelButtonInFinalScreen,
                            ),
                          ),
                        );
                      }
                      else {
                        Navigator.push(
                          termsAndConditionsContext,
                          MaterialPageRoute(
                            builder: (context) => FinalViewInScan(
                              onTap: widget.onCancelButtonInFinalScreen,
                              hasJoined: widget.hasJoined!,
                            ),
                          ),
                        );
                      }
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: _isButtonEnabled
                          ? () {
                              BlocProvider.of<ScanCubit>(context)
                                  .postJoinCompany();
                              print('Click');
                            }
                          : null,
                      child: Container(
                        width: 353.w,
                        height: 52.h,
                        decoration: BoxDecoration(
                          color: _isButtonEnabled
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                          borderRadius: BorderRadius.circular(300.r),
                        ),
                        child: Center(
                          child: state is PostJoinCompanyLoadingState
                              ? SizedBox(
                                  width: 24.w,
                                  height: 24.h,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 4.w,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      AppColors.whiteColor,
                                    ),
                                  ),
                                )
                              : Text(
                                  'Accept',
                                  style: AppFonts.bodyLargeBold.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  onTap: widget.onCancelButtonInFinalScreen,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 55.h),
                    width: 353.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(70.r),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: AppFonts.bodyLargeBold.copyWith(
                          color: AppColors.black9Color,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
              onTap: widget.onCancelButtonInFinalScreen,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  top: 11.h,
                ),
                child: SvgPicture.asset(
                  AppAssets.cornerupleft,
                  width: 17.9.w,
                  height: 11.3.h,
                  // color: Colors.black,
                ),
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 21.h,
                ),
                child: SvgPicture.asset(
                  AppAssets.more,
                ),
              ),
            ],
          ),
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return false;
            },
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 22.w),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 24.h),

                        ///
                        Row(
                          children: [
                            Container(
                              width: 45.h,
                              height: 45.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.r),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.r,
                                    color:
                                        AppColors.blackColor.withOpacity(0.14),
                                    offset: const Offset(0, 0.66),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40.r),
                                child: Image.network(
                                  cubit.logo ?? AppAssets.errorIcon,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(AppAssets.errorIcon);
                                  },
                                  height: 64.h,
                                  width: 64.w,
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Text(
                              cubit.display_name ?? 'Loading',
                              style: AppFonts.bodyLargeBold.copyWith(
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
                              trackBorderColor: MaterialStateProperty.all(
                                  AppColors.primaryColor),
                              // trackBorderWidth: 2.0,
                              thumbColor: MaterialStateProperty.all(
                                  AppColors.primaryColor),
                              trackColor: MaterialStateProperty.all(
                                  AppColors.blackColor),
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
                              height: 500.h,
                              child: NotificationListener<
                                  OverscrollIndicatorNotification>(
                                onNotification: (overscroll) {
                                  overscroll.disallowGlow();
                                  return false;
                                },
                                child: ListView.separated(
                                  controller: controller,
                                  // physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.only(right: 26.w),
                                  shrinkWrap: true,
                                  itemCount: 1,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 20.h);
                                  },
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Terms and Conditions',
                                          style: AppFonts.titleBody.copyWith(
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                        SizedBox(height: 23.h),
                                        Column(
                                          children: [
                                            state is GetTermsAndConditionsLoadingState
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(height: 170.h),
                                                      const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Text(
                                                    cubit.termsAndConditions ??
                                                        'Loading',
                                                    style: AppFonts.bodyLarge,
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
                        ),
                        SizedBox(height: 80.h),
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
}
