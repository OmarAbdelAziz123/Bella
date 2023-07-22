// import 'package:bella/features/layout/home/presentation/profie_view.dart';
// import 'package:bella/utils/constants/app_assets.dart';
// import 'package:bella/utils/constants/app_fonts.dart';
// import 'package:bella/utils/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class MyCardView extends StatelessWidget {
//   const MyCardView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 54.h),
//               Container(
//                 height: 560,
//                 width: 353,
//                 decoration: BoxDecoration(
//                   color: AppColors.whiteColor,
//                   borderRadius: BorderRadius.circular(20.r),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(),
//                     Column(
//                       children: [
//                         Image.asset(
//                           AppAssets.qrCode2,
//                           width: 228.w,
//                           height: 226.h,
//                         ),
//                         SizedBox(height: 18.h),
//                         Text(
//                           'Mark AL-Jumaily',
//                           style: AppFonts.titleSubsection.copyWith(
//                             color: AppColors.blackColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 30.w, vertical: 20.h),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SvgPicture.asset(
//                             AppAssets.arroww,
//                             height: 24.h,
//                             width: 24.w,
//                           ),
//                           SvgPicture.asset(
//                             AppAssets.infoCircle4,
//                             height: 24.h,
//                             width: 24.w,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 18.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       navigatePop(context);
//                     },
//                     child: Container(
//                       padding: EdgeInsets.only(
//                         left: 28.w,
//                         right: 24.h,
//                         top: 24.h,
//                         bottom: 24.h,
//                       ),
//                       decoration: BoxDecoration(
//                         color: AppColors.whiteColor,
//                         borderRadius: BorderRadius.circular(300.r),
//                       ),
//                       child: Row(
//                         children: [
//                           SvgPicture.asset(
//                             AppAssets.close,
//                             height: 12.h,
//                             width: 12.w,
//                             color: AppColors.blackColor,
//                           ),
//                           SizedBox(width: 4.w),
//                           Text(
//                             'Close',
//                             style: AppFonts.bodyLargeBold,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void navigatePop(BuildContext context) {
//     Navigator.pushReplacement(
//       context,
//       PageRouteBuilder(
//         transitionDuration: const Duration(milliseconds: 250),
//         pageBuilder: (_, __, ___) => const ProfileView(),
//         transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
//           return SlideTransition(
//             position: Tween<Offset>(
//               begin: const Offset(0, -1),
//               end: Offset.zero,
//             ).animate(animation),
//             child: child,
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/custom_button.dart';
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
  @override
  Widget build(BuildContext context) {
    void navigateToProfile(BuildContext context) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => ProfileView(),
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

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              navigateToProfile(context);
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
        ),
      ),
      body: BlocProvider(
        create: (context) => AuthCubit()..readCreditCard(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = BlocProvider.of<AuthCubit>(context);

            return state is ReadCreditCardLoadingState
                ? Center(
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
                            CustomButton(
                              widget: Text(
                                'Add Card',
                                style: AppFonts.bodyLargeBold.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              width: 353.w,
                              onTap: () {
                                // if (verifyKey.currentState!.validate()) {
                                //   setState(() {});
                                //   if (verifyKey.currentState!.validate()) {
                                //     BlocProvider.of<AuthCubit>(context).createFun(
                                //       social_security_number: personalNumber,
                                //       email: email,
                                //       first_name: firstName,
                                //       full_name: fullName,
                                //       phone_number: phoneNumber,
                                //       surname: lastName,
                                //     );
                                //     setState(() {
                                //       showErrorText = true;
                                //     });
                                //   } else {
                                //     setState(() {
                                //       showErrorText = false;
                                //     });
                                //   }
                                // }
                                // Navigator.pushNamed(context, 'add-card-in-home-screen');
                                navigateToAddCard(context);
                              },
                            ),
                          ],
                        ),
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
                                String formatCreditCardNumber(
                                    String cardNumber) {
                                  if (cardNumber == null ||
                                      cardNumber.length < 16) {
                                    return 'Invalid card number';
                                  }

                                  final firstFour = cardNumber.substring(0, 4);
                                  final lastFour = cardNumber
                                      .substring(cardNumber.length - 4);
                                  final maskedDigits = '**** ****';

                                  return '$firstFour $maskedDigits $lastFour';
                                }

                                final cardNumber = cubit.readCreditCardModel
                                    .linkedCards![index].cardNumber;
                                final formattedNumber =
                                    formatCreditCardNumber(cardNumber!);

                                return cubit.readCreditCardModel
                                            .linkedCards![index].cardType ==
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
                                              child: Image.asset(
                                                  AppAssets.PAYMEMNTCARD),
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
                                              child: Container(
                                                height: 21.h,
                                                width: 212.w,

                                                ///
                                                child: Text(
                                                  formattedNumber ?? '...',
                                                  // '${widget.cardNumber.substring(0, 4)} **** **** ${widget.cardNumber.substring(10)}',
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
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 20.96.w,
                                              bottom: 15.h,
                                              child: Text(
                                                cubit
                                                        .readCreditCardModel
                                                        .linkedCards![index]
                                                        .expiryDate ??
                                                    '...',
                                                // widget.expiryDate,
                                                // '07/30',
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
                                                      AppAssets
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
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 87.78.h,
                                                  left: 20.96.h,
                                                  child: Container(
                                                    height: 21.h,
                                                    width: 212.w,
                                                    child: Text(
                                                      formattedNumber ?? '...',
                                                      // '${widget.cardNumber.substring(0, 4)} **** **** ${widget.cardNumber.substring(10)}',
                                                      style: AppFonts.cardNumber
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
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 20.96.w,
                                                  bottom: 15.h,
                                                  child: Text(
                                                    cubit
                                                            .readCreditCardModel
                                                            .linkedCards![index]
                                                            .expiryDate ??
                                                        '...',
                                                    // widget.expiryDate,
                                                    style: AppFonts.capsolButton
                                                        .copyWith(
                                                      color:
                                                          AppColors.whiteColor,
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
                                        : cubit
                                                    .readCreditCardModel
                                                    .linkedCards![index]
                                                    .cardType ==
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
                                                        AppAssets
                                                            .arrow_vert_icon,
                                                      ),
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
                                                      child: Container(
                                                        height: 21.h,
                                                        width: 212.w,
                                                        child: Text(
                                                          formattedNumber ??
                                                              '...',
                                                          // '${widget.cardNumber.substring(0, 4)} **** **** ${widget.cardNumber.substring(10)}',
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
                                                          fontSize: 12.sp,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 20.96.w,
                                                      bottom: 15.h,
                                                      child: Text(
                                                        formattedNumber ??
                                                            '...',
                                                        // widget.expiryDate,
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
                                                      child: SvgPicture.asset(
                                                        AppAssets.bonoz,
                                                        color: AppColors
                                                            .whiteColor,
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
                                                      child: Container(
                                                        height: 21.h,
                                                        width: 212.w,
                                                        child: Text(
                                                          formattedNumber ??
                                                              '...',
                                                          // '${widget.cardNumber.substring(0, 4)} **** **** ${widget.cardNumber.substring(10)}',
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
                                                          fontSize: 12.sp,
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
                                                        // widget.expiryDate,
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
                                                      child: SvgPicture.asset(
                                                        AppAssets.bonoz,
                                                        color: AppColors
                                                            .whiteColor,
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
                          // SizedBox(height: 41.h),
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
                                navigateToAddCard(context);
                              },
                            ),
                          ),
                        ],
                      );
          },
        ),
      ),
    );
  }

  void navigateToAddCard(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => AddCardInHomeView(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
