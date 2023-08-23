// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/scan/managers/scan_cubit.dart';
import 'package:bella/features/layout/scan/presentation/final_view_in_scan.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TermsAndConditions extends StatefulWidget {
  String? companyId;
  dynamic onTap;
  void Function()? onCancelButtonInFinalScreen;
  dynamic onSuccessButton;
  String? flow;
  String? initialView;
  String? initialScreen;
  bool? hasJoined;

  TermsAndConditions({
    Key? key,
    this.companyId,
    this.onTap,
    this.flow,
    this.initialView,
    this.onCancelButtonInFinalScreen,
    this.onSuccessButton,
    this.hasJoined,
    this.initialScreen,
  }) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  final ScrollController controller = ScrollController();
  bool _isButtonEnabled = false;
  bool userHasJoined = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
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
            decoration: BoxDecoration(
              color: userHasJoined == false ? AppColors.whiteColor : Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocConsumer<ScanCubit, ScanState>(
                  listener: (context, state) async {
                    if (state is PostJoinCompanySuccessState) {
                      userHasJoined = true;
                      await BlocProvider.of<MyBrandsCubit>(context)
                          .joinedFunction();
                      await BlocProvider.of<MyBrandsCubit>(context)
                          .notJoinedFunction(context);
                      await BlocProvider.of<HomeCubit>(context)
                          .getRecommended();
                      await BlocProvider.of<HomeCubit>(context)
                          .getAllCompanies();
                      await BlocProvider.of<HomeCubit>(context)
                          .companyProfileFunc();
                      if (widget.flow == 'Join') {
                        Navigator.pop(context);
                      } else {
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
                            }
                          : null,
                      child: userHasJoined == true ? Container() : Container(
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
                  child: userHasJoined == true ? Container() : Container(
                    margin: EdgeInsets.only(bottom: 55.h),
                    width: 353.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(70.r),
                    ),
                    child:  Center(
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
              overscroll.disallowIndicator();
              return false;
            },
            child: BlocConsumer<ScanCubit, ScanState>(
              listener: (context, state) {
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 22.w),
                    child: Column(
                      children: [
                        userHasJoined == true
                        ? Column(
                          children: [
                            SizedBox(height: 40.h),

                            Image.asset(AppAssets.hand),
                            SizedBox(height: 53.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 29.w),
                              child: Text(
                                'Joined \n Successfully'.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily:
                                  'Futura LT Condensed Extra Bold',
                                  color: AppColors.black3Color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 50.sp,
                                  letterSpacing: -3.sp,
                                ),
                              ),
                            ),
                          ],
                        )
                            : Column(
                                children: [
                                  SizedBox(height: 24.h),

                                  ///
                                  Row(
                                    children: [
                                      Container(
                                        width: 45.h,
                                        height: 45.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40.r),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3.r,
                                              color: AppColors.blackColor
                                                  .withOpacity(0.14),
                                              offset: const Offset(0, 0.66),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40.r),
                                          child: Image.network(
                                            cubit.logo ?? AppAssets.errorIcon,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                  AppAssets.errorIcon);
                                            },
                                            height: 64.h,
                                            width: 64.w,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Text(
                                        cubit.display_name,
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
                                        trackBorderColor:
                                            MaterialStateProperty.all(
                                                AppColors.primaryColor),
                                        thumbColor: MaterialStateProperty.all(
                                            AppColors.primaryColor),
                                        trackColor: MaterialStateProperty.all(
                                            AppColors.blackColor),
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
                                            overscroll.disallowIndicator();
                                            return false;
                                          },
                                          child: ListView.separated(
                                            controller: controller,
                                            padding:
                                                EdgeInsets.only(right: 26.w),
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
                                                    style: AppFonts.titleBody
                                                        .copyWith(
                                                      color:
                                                          AppColors.blackColor,
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
                                                                SizedBox(
                                                                    height:
                                                                        170.h),
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
                                                              cubit.termsAndConditions,
                                                              style: AppFonts
                                                                  .bodyLarge,
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
                );
              },
            ),
          ),
        );
      },
    );
  }


}
