import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/custom_button.dart';
import 'package:bella/features/layout/home/presentation/widgets/add_card_in_home_view.dart';
import 'package:bella/features/layout/home/presentation/widgets/my_id_view.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCardsScreen extends StatefulWidget {
  final String cardNumber, expiryDate;

  const MyCardsScreen({
    Key? key,
    required this.cardNumber,
    required this.expiryDate,
  }) : super(key: key);

  @override
  State<MyCardsScreen> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  @override
  void initState() {
    super.initState();
  }

  void navigateToScreen5(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const AddCardInHomeView(),
        transitionsBuilder: (_, animation, __, child) {
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
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const MyCardView(),
        transitionsBuilder: (_, animation, __, child) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            // Navigator.pop(context);
            navigateToScreen5(context);
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
        elevation: 0,
        backgroundColor: AppColors.bgColor,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<AuthCubit>(context);

          return cubit.readCreditCardModel.linkedCards!.isEmpty
              ? const Center(
                  child: Text('Empty'),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        'My Cards',
                        style: AppFonts.titleScreen,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 46.h),

                    SizedBox(
                      height: 500.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            cubit.readCreditCardModel.linkedCards!.length,
                        itemBuilder: (context, index) {
                          return cubit.readCreditCardModel.linkedCards![index]
                                      .cardType ==
                                  'Visa'
                              ? Center(
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        AppAssets.visa,
                                        width: 339.w,
                                        height: 175.h,
                                      ),
                                      Positioned(
                                        left: 14.w,
                                        top: 26.h,
                                        child:
                                            Image.asset(AppAssets.PAYMEMNTCARD),
                                      ),
                                      Positioned(
                                        top: 14.h,
                                        right: 21.w,
                                        child: SvgPicture.asset(
                                            AppAssets.arrow_vert_icon),
                                      ),
                                      Positioned(
                                        top: 68.78.h,
                                        left: 20.96.w,
                                        child: Text(
                                          'CARD NUMBER',
                                          style:
                                              AppFonts.smallCapslook.copyWith(
                                            color: AppColors.whiteColor,
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
                                            '${widget.cardNumber.substring(0, 4)} **** **** ${widget.cardNumber.substring(10)}',
                                            style: AppFonts.cardNumber.copyWith(
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 20.96.w,
                                        bottom: 38.02.h,
                                        child: Text(
                                          'VALID THROUGH',
                                          style:
                                              AppFonts.smallCapslook.copyWith(
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 20.96.w,
                                        bottom: 15.h,
                                        child: Text(
                                          widget.expiryDate,
                                          // '07/30',
                                          style: AppFonts.capsolButton.copyWith(
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 15.49.h,
                                        right: 21.w,
                                        child: SvgPicture.asset(
                                          AppAssets.bonoz,
                                          color: AppColors.whiteColor,
                                          width: 41.51.w,
                                          height: 7.69.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : cubit.readCreditCardModel.linkedCards![index]
                                          .cardType ==
                                      'Mastercard'
                                  ? Center(
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            AppAssets.master,
                                            width: 339.w,
                                            height: 175.h,
                                          ),
                                          Positioned(
                                            left: 14.w,
                                            top: 26.h,
                                            child: Image.asset(
                                                AppAssets.mastercard),
                                          ),
                                          Positioned(
                                            top: 14.h,
                                            right: 21.w,
                                            child: SvgPicture.asset(
                                                AppAssets.arrow_vert_icon),
                                          ),
                                          Positioned(
                                            top: 68.78.h,
                                            left: 20.96.w,
                                            child: Text(
                                              'CARD NUMBER',
                                              style: AppFonts.smallCapslook
                                                  .copyWith(
                                                color: AppColors.whiteColor,
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
                                                '${widget.cardNumber.substring(0, 4)} **** **** ${widget.cardNumber.substring(10)}',
                                                style: AppFonts.cardNumber
                                                    .copyWith(
                                                  color: AppColors.whiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 20.96.w,
                                            bottom: 38.02.h,
                                            child: Text(
                                              'VALID THROUGH',
                                              style: AppFonts.smallCapslook
                                                  .copyWith(
                                                color: AppColors.whiteColor,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 20.96.w,
                                            bottom: 15.h,
                                            child: Text(
                                              widget.expiryDate,
                                              style: AppFonts.capsolButton
                                                  .copyWith(
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 15.49.h,
                                            right: 21.w,
                                            child: SvgPicture.asset(
                                              AppAssets.bonoz,
                                              color: AppColors.whiteColor,
                                              width: 41.51.w,
                                              height: 7.69.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : cubit.readCreditCardModel
                                              .linkedCards![index].cardType ==
                                          'Maestro'
                                      ? Center(
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                AppAssets.master,
                                                width: 339.w,
                                                height: 175.h,
                                              ),
                                              Positioned(
                                                left: 14.w,
                                                top: 26.h,
                                                child: Image.asset(
                                                  AppAssets.meastro,
                                                ),
                                              ),
                                              Positioned(
                                                top: 14.h,
                                                right: 21.w,
                                                child: SvgPicture.asset(
                                                  AppAssets.arrow_vert_icon,
                                                ),
                                              ),
                                              Positioned(
                                                top: 68.78.h,
                                                left: 20.96.w,
                                                child: Text(
                                                  'CARD NUMBER',
                                                  style: AppFonts.smallCapslook
                                                      .copyWith(
                                                    color: AppColors.whiteColor,
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
                                                    '${widget.cardNumber.substring(0, 4)} **** **** ${widget.cardNumber.substring(10)}',
                                                    style: AppFonts.cardNumber
                                                        .copyWith(
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 20.96.w,
                                                bottom: 38.02.h,
                                                child: Text(
                                                  'VALID THROUGH',
                                                  style: AppFonts.smallCapslook
                                                      .copyWith(
                                                    color: AppColors.whiteColor,
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 20.96.w,
                                                bottom: 15.h,
                                                child: Text(
                                                  widget.expiryDate,
                                                  style: AppFonts.capsolButton
                                                      .copyWith(
                                                    color: AppColors.whiteColor,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 15.49.h,
                                                right: 21.w,
                                                child: SvgPicture.asset(
                                                  AppAssets.bonoz,
                                                  color: AppColors.whiteColor,
                                                  width: 41.51.w,
                                                  height: 7.69.h,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Center(
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                AppAssets.master,
                                                width: 339.w,
                                                height: 175.h,
                                              ),
                                              Positioned(
                                                left: 14.w,
                                                top: 26.h,
                                                child: Image.asset(
                                                  AppAssets.americanexpress,
                                                ),
                                              ),
                                              Positioned(
                                                top: 14.h,
                                                right: 21.w,
                                                child: SvgPicture.asset(
                                                    AppAssets.arrow_vert_icon),
                                              ),
                                              Positioned(
                                                top: 68.78.h,
                                                left: 20.96.w,
                                                child: Text(
                                                  'CARD NUMBER',
                                                  style: AppFonts.smallCapslook
                                                      .copyWith(
                                                    color: AppColors.whiteColor,
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
                                                    '${widget.cardNumber.substring(0, 4)} **** **** ${widget.cardNumber.substring(10)}',
                                                    style: AppFonts.cardNumber
                                                        .copyWith(
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 20.96.w,
                                                bottom: 38.02.h,
                                                child: Text(
                                                  'VALID THROUGH',
                                                  style: AppFonts.smallCapslook
                                                      .copyWith(
                                                    color: AppColors.whiteColor,
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 20.96.w,
                                                bottom: 15.h,
                                                child: Text(
                                                  widget.expiryDate,
                                                  style: AppFonts.capsolButton
                                                      .copyWith(
                                                    color: AppColors.whiteColor,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 15.49.h,
                                                right: 21.w,
                                                child: SvgPicture.asset(
                                                  AppAssets.bonoz,
                                                  color: AppColors.whiteColor,
                                                  width: 41.51.w,
                                                  height: 7.69.h,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomButton(
                        widget: Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.creditCard,
                              width: 24.w,
                              height: 24.h,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Add Card',
                              style: AppFonts.bodyLargeBold.copyWith(
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        width: 353.w,
                        onTap: () {
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
