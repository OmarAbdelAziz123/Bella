import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/custom_button.dart';
import 'package:bella/features/layout/home/home_navigation_functions/home_navigation_functions.dart';
import 'package:bella/features/layout/home/presentation/profie_view.dart';
import 'package:bella/features/layout/home/presentation/widgets/add_card_in_home_view.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCardView extends StatefulWidget {
  const MyCardView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCardView> createState() => _MyCardViewState();
}

class _MyCardViewState extends State<MyCardView> {
  bool _isScrolled = false;
  final _scrollController = ScrollController();

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 108.h,
        width: 393.w,
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: const BoxDecoration(
          color: AppColors.grey4Color,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: 40.h,
            top: 16.h,
          ),
          child: CustomButton(
            widget: Text(
              'Add Card',
              style: AppFonts.bodyLargeBold.copyWith(
                color: AppColors.whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
            width: 353.w,
            onTap: () {
              HomeNavigationClass.navigateToAddCard(context);
            },
          ),
        ),
      ),
      // appBar: AppBar(
      //   leading: GestureDetector(
      //     onTap: () {
      //       // Navigator.pop(context);
      //       HomeNavigationClass.navigateToProfile(context);
      //     },
      //     child: Padding(
      //       padding: EdgeInsets.only(
      //         top: 11.h,
      //         left: 20.h,
      //         bottom: 4.h,
      //       ),
      //       child: SvgPicture.asset(
      //         AppAssets.arrowbackblack,
      //       ),
      //     ),
      //   ),
      //   elevation: 0,
      //   backgroundColor: AppColors.bgColor,
      // ),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.h),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.bgColor,
              centerTitle: true,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  HomeNavigationClass.navigateToProfile(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 11.h,
                    left: 20.h,
                    bottom: 4.h,
                  ),
                  child: SvgPicture.asset(
                    AppAssets.arrowbackblack,
                  ),
                ),
              ),
              floating: true,
              pinned: true,
              title: !_isScrolled
                  ? null
                  : Text(
                'My Cards',
                style: AppFonts.titleSubsection,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AuthCubit()..readCreditCard(),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = BlocProvider.of<AuthCubit>(context);

              return state is ReadCreditCardLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : cubit.readCreditCardModel.linkedCards!.isEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 10.h),
                              Text(
                                'My Cards',
                                style: AppFonts.titleScreen,
                              ),
                              SizedBox(height: 11.h),
                              Image.asset(
                                AppAssets.waleet,
                                height: 219.h,
                                width: 219.w,
                              ),
                              SizedBox(height: 24.h),
                              Text(
                                'No payment card found yet',
                                textAlign: TextAlign.center,
                                style: AppFonts.titleSection,
                              ),
                              SizedBox(height: 9.h),
                              Text(
                                'This is how you collect your points on \n everything you buy',
                                textAlign: TextAlign.center,
                                style: AppFonts.bodyLarge,
                              ),
                              SizedBox(height: 220.h),
                              // CustomButton(
                              //   widget: Text(
                              //     'Add Card',
                              //     style: AppFonts.bodyLargeBold.copyWith(
                              //       color: AppColors.whiteColor,
                              //     ),
                              //     textAlign: TextAlign.center,
                              //   ),
                              //   width: 353.w,
                              //   onTap: () {
                              //     HomeNavigationClass.navigateToAddCard(context);
                              //   },
                              // ),
                            ],
                          ),
                        )
                      : NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            overscroll.disallowIndicator();
                            return false;
                          },
                          child: CustomScrollView(
                            controller: _scrollController,
                            slivers: [
                              // SliverAppBar(
                              //   backgroundColor: AppColors.bgColor,
                              //   centerTitle: true,
                              //   elevation: 0,
                              //   leading: GestureDetector(
                              //     onTap: () {
                              //       HomeNavigationClass.navigateToProfile(
                              //           context);
                              //     },
                              //     child: Padding(
                              //       padding: EdgeInsets.only(
                              //         top: 11.h,
                              //         left: 20.h,
                              //         bottom: 4.h,
                              //       ),
                              //       child: SvgPicture.asset(
                              //         AppAssets.arrowbackblack,
                              //       ),
                              //     ),
                              //   ),
                              //   floating: true,
                              //   pinned: true,
                              //   title: !_isScrolled
                              //       ? null
                              //       : Text(
                              //           'My Cards',
                              //           style: AppFonts.titleSubsection,
                              //         ),
                              // ),
                              SliverPadding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                sliver: SliverList(
                                  delegate: SliverChildListDelegate(
                                    [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          // SizedBox(height: 24.h),
                                          Text(
                                            'My Cards',
                                            style: AppFonts.titleScreen,
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 41.h),
                                          ListView.separated(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            separatorBuilder: (context, index) {
                                              return SizedBox(height: 30.h);
                                            },
                                            itemCount: cubit.readCreditCardModel
                                                .linkedCards!.length,
                                            itemBuilder: (context, index) {
                                              String formatCreditCardNumber(
                                                  String cardNumber) {
                                                if (cardNumber == null ||
                                                    cardNumber.length < 16) {
                                                  return 'Invalid card number';
                                                }

                                                final firstFour =
                                                    cardNumber.substring(0, 4);
                                                final lastFour =
                                                    cardNumber.substring(
                                                        cardNumber.length - 4);
                                                const maskedDigits =
                                                    '**** ****';

                                                return '$firstFour $maskedDigits $lastFour';
                                              }

                                              final cardNumber = cubit
                                                  .readCreditCardModel
                                                  .linkedCards![index]
                                                  .cardNumber;
                                              final formattedNumber =
                                                  formatCreditCardNumber(
                                                      cardNumber!);

                                              return cubit
                                                          .readCreditCardModel
                                                          .linkedCards![index]
                                                          .cardType ==
                                                      'Visa'
                                                  ? Center(
                                                      child: Stack(
                                                        children: [
                                                          // (DONE)
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            child: Image.asset(
                                                              AppAssets.visa,
                                                              width: 339.w,
                                                              height: 175.h,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          // (DONE)
                                                          Positioned(
                                                            left: 17.w,
                                                            top: 23.h,
                                                            child: Image.asset(
                                                              AppAssets
                                                                  .PAYMEMNTCARD,
                                                              height: 32.h,
                                                              width: 63.w,
                                                            ),
                                                          ),
                                                          // (DONE)
                                                          Positioned(
                                                            top: 14.h,
                                                            right: 21.w,
                                                            child: SvgPicture
                                                                .asset(
                                                              AppAssets
                                                                  .arrow_vert_icon,
                                                              width: 2.w,
                                                              height: 16.h,
                                                            ),
                                                          ),
                                                          // (DONE)
                                                          Positioned(
                                                            top: 68.78.h,
                                                            left: 20.96.w,
                                                            child: Text(
                                                              'CARD NUMBER',
                                                              style: AppFonts
                                                                  .smallCapslook
                                                                  .copyWith(
                                                                color: AppColors
                                                                    .whiteColor,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 87.78.h,
                                                            left: 20.96.h,
                                                            child: Text(
                                                              formattedNumber,
                                                              style: AppFonts
                                                                  .cardNumber
                                                                  .copyWith(
                                                                color: AppColors
                                                                    .whiteColor,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            left: 20.96.w,
                                                            bottom: 39.02.h,
                                                            child: Text(
                                                              'VALID THROUGH',
                                                              style: AppFonts
                                                                  .smallCapslook
                                                                  .copyWith(
                                                                color: AppColors
                                                                    .whiteColor,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            left: 20.96.w,
                                                            bottom: 18.02.h,
                                                            child: Text(
                                                              cubit
                                                                      .readCreditCardModel
                                                                      .linkedCards![
                                                                          index]
                                                                      .expiryDate ??
                                                                  '...',
                                                              style: AppFonts
                                                                  .capsolButton
                                                                  .copyWith(
                                                                color: AppColors
                                                                    .whiteColor,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            bottom: 14.h,
                                                            right: 16.w,
                                                            child: SvgPicture
                                                                .asset(
                                                              AppAssets
                                                                  .bellaIcon,
                                                              color: AppColors
                                                                  .whiteColor,
                                                              width: 31.w,
                                                              height: 10.h,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : cubit
                                                              .readCreditCardModel
                                                              .linkedCards![
                                                                  index]
                                                              .cardType ==
                                                          'Mastercard'
                                                      ? Center(
                                                          child: Stack(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.r),
                                                                child:
                                                                    Image.asset(
                                                                  AppAssets
                                                                      .master,
                                                                  width: 339.w,
                                                                  height: 175.h,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 14.w,
                                                                top: 26.h,
                                                                child: Image.asset(
                                                                    AppAssets
                                                                        .mastercard),
                                                              ),
                                                              Positioned(
                                                                top: 14.h,
                                                                right: 21.w,
                                                                child: SvgPicture
                                                                    .asset(AppAssets
                                                                        .arrow_vert_icon),
                                                              ),
                                                              Positioned(
                                                                top: 68.78.h,
                                                                left: 20.96.w,
                                                                child: Text(
                                                                  'CARD NUMBER',
                                                                  style: AppFonts
                                                                      .smallCapslook
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .whiteColor,
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                top: 87.78.h,
                                                                left: 20.96.h,
                                                                child: SizedBox(
                                                                  height: 21.h,
                                                                  width: 212.w,
                                                                  child: Text(
                                                                    formattedNumber,
                                                                    style: AppFonts
                                                                        .cardNumber
                                                                        .copyWith(
                                                                      color: AppColors
                                                                          .whiteColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 20.96.w,
                                                                bottom: 38.02.h,
                                                                child: Text(
                                                                  'VALID THROUGH',
                                                                  style: AppFonts
                                                                      .smallCapslook
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .whiteColor,
                                                                    fontSize:
                                                                        12.sp,
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 20.96.w,
                                                                bottom: 15.h,
                                                                child: Text(
                                                                  cubit
                                                                          .readCreditCardModel
                                                                          .linkedCards![
                                                                              index]
                                                                          .expiryDate ??
                                                                      '...',
                                                                  style: AppFonts
                                                                      .capsolButton
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .whiteColor,
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                bottom: 15.49.h,
                                                                right: 21.w,
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  AppAssets
                                                                      .bonoz,
                                                                  color: AppColors
                                                                      .whiteColor,
                                                                  width:
                                                                      41.51.w,
                                                                  height:
                                                                      7.69.h,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : cubit
                                                                  .readCreditCardModel
                                                                  .linkedCards![
                                                                      index]
                                                                  .cardType ==
                                                              'Maestro'
                                                          ? Center(
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.r),
                                                                    child: Image
                                                                        .asset(
                                                                      AppAssets
                                                                          .master,
                                                                      width:
                                                                          339.w,
                                                                      height:
                                                                          175.h,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left: 14.w,
                                                                    top: 26.h,
                                                                    child: Image
                                                                        .asset(
                                                                      AppAssets
                                                                          .meastro,
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    top: 14.h,
                                                                    right: 21.w,
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      AppAssets
                                                                          .arrow_vert_icon,
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    top:
                                                                        68.78.h,
                                                                    left:
                                                                        20.96.w,
                                                                    child: Text(
                                                                      'CARD NUMBER',
                                                                      style: AppFonts
                                                                          .smallCapslook
                                                                          .copyWith(
                                                                        color: AppColors
                                                                            .whiteColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    top:
                                                                        87.78.h,
                                                                    left:
                                                                        20.96.h,
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          21.h,
                                                                      width:
                                                                          212.w,
                                                                      child:
                                                                          Text(
                                                                        formattedNumber,
                                                                        style: AppFonts
                                                                            .cardNumber
                                                                            .copyWith(
                                                                          color:
                                                                              AppColors.whiteColor,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left:
                                                                        20.96.w,
                                                                    bottom:
                                                                        38.02.h,
                                                                    child: Text(
                                                                      'VALID THROUGH',
                                                                      style: AppFonts
                                                                          .smallCapslook
                                                                          .copyWith(
                                                                        color: AppColors
                                                                            .whiteColor,
                                                                        fontSize:
                                                                            12.sp,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left:
                                                                        20.96.w,
                                                                    bottom:
                                                                        15.h,
                                                                    child: Text(
                                                                      formattedNumber,
                                                                      style: AppFonts
                                                                          .capsolButton
                                                                          .copyWith(
                                                                        color: AppColors
                                                                            .whiteColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    bottom:
                                                                        15.49.h,
                                                                    right: 21.w,
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      AppAssets
                                                                          .bonoz,
                                                                      color: AppColors
                                                                          .whiteColor,
                                                                      width:
                                                                          41.51
                                                                              .w,
                                                                      height:
                                                                          7.69.h,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : Center(
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.r),
                                                                    child: Image
                                                                        .asset(
                                                                      AppAssets
                                                                          .master,
                                                                      width:
                                                                          339.w,
                                                                      height:
                                                                          175.h,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left: 14.w,
                                                                    top: 26.h,
                                                                    child: Image
                                                                        .asset(
                                                                      AppAssets
                                                                          .americanexpress,
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    top: 14.h,
                                                                    right: 21.w,
                                                                    child: SvgPicture.asset(
                                                                        AppAssets
                                                                            .arrow_vert_icon),
                                                                  ),
                                                                  Positioned(
                                                                    top:
                                                                        68.78.h,
                                                                    left:
                                                                        20.96.w,
                                                                    child: Text(
                                                                      'CARD NUMBER',
                                                                      style: AppFonts
                                                                          .smallCapslook
                                                                          .copyWith(
                                                                        color: AppColors
                                                                            .whiteColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    top:
                                                                        87.78.h,
                                                                    left:
                                                                        20.96.h,
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          21.h,
                                                                      width:
                                                                          212.w,
                                                                      child:
                                                                          Text(
                                                                        formattedNumber,
                                                                        style: AppFonts
                                                                            .cardNumber
                                                                            .copyWith(
                                                                          color:
                                                                              AppColors.whiteColor,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left:
                                                                        20.96.w,
                                                                    bottom:
                                                                        38.02.h,
                                                                    child: Text(
                                                                      'VALID THROUGH',
                                                                      style: AppFonts
                                                                          .smallCapslook
                                                                          .copyWith(
                                                                        color: AppColors
                                                                            .whiteColor,
                                                                        fontSize:
                                                                            12.sp,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left:
                                                                        20.96.w,
                                                                    bottom:
                                                                        15.h,
                                                                    child: Text(
                                                                      cubit.readCreditCardModel.linkedCards![index]
                                                                              .expiryDate ??
                                                                          '...',
                                                                      style: AppFonts
                                                                          .capsolButton
                                                                          .copyWith(
                                                                        color: AppColors
                                                                            .whiteColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    bottom:
                                                                        15.49.h,
                                                                    right: 21.w,
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      AppAssets
                                                                          .bonoz,
                                                                      color: AppColors
                                                                          .whiteColor,
                                                                      width:
                                                                          41.51
                                                                              .w,
                                                                      height:
                                                                          7.69.h,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                            },
                                          ),
                                          SizedBox(height: 108.h),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
            },
          ),
        ),
      ),
    );
  }
}
