import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/features/auth/presentation/widgets/add_card_view_body.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/custom_button.dart';
import 'package:bella/features/layout/home/presentation/widgets/my_cards_screen.dart';
import 'package:bella/features/layout/home/presentation/widgets/my_id_view.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCardInHomeView extends StatefulWidget {
  const AddCardInHomeView({Key? key}) : super(key: key);

  @override
  State<AddCardInHomeView> createState() => _AddCardInHomeViewState();
}

class _AddCardInHomeViewState extends State<AddCardInHomeView> {
  TextEditingController controller = TextEditingController();

  TextEditingController monthController = TextEditingController();

  TextEditingController yearController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();

  FocusNode cvvFocusNode = FocusNode();

  final yearFocusNode = FocusNode();

  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
        // centerTitle: true,
        //       title: Padding(
        //       padding: EdgeInsets.only(top: 28.h),
        //   child: Text(
        //     'Almost done!',
        //     textAlign: TextAlign.center,
        //     style: AppFonts.titleScreen,
        //   ),
        // ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AddCreditCardSuccessState) {
            print('Success');
            BlocProvider.of<AuthCubit>(context).readCreditCard();
            navigateToMyCard(context, controller.text,
                '${monthController.text}${yearController.text}');
          } else if (state is AddCreditCardErrorState) {
            print('Error');
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<AuthCubit>(context);

          return Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 39.h),
                Text(
                  'Add your card',
                  textAlign: TextAlign.center,
                  style: AppFonts.titleSection,
                ),
                SizedBox(height: 14.h),
                Text(
                  'This is how you collect your \n points on everything you buy',
                  textAlign: TextAlign.center,
                  style: AppFonts.bodyLarge,
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    'Card Number',
                    textAlign: TextAlign.left,
                    style: AppFonts.bodyDefault
                        .copyWith(color: AppColors.black2Color),
                  ),
                ),
                SizedBox(height: 14.h),

                /// Card Number
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextFormField(
                    controller: controller,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.number,
                    style: AppFonts.bodyDefault
                        .copyWith(color: AppColors.black3Color, height: 1.5.h),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This card is already in use. Please try other one.';
                      } else if (value.isNotEmpty) {
                        final firstDigit = value[0];
                        final firstTwoDigits = value.substring(0, 2);

                        if (firstDigit == null ||
                            (firstDigit != '3' &&
                                firstDigit != '4' &&
                                firstDigit != '5' &&
                                firstDigit != '6') ||
                            (firstDigit == '3' &&
                                (firstTwoDigits != '34' && firstTwoDigits != '37'))) {
                          return 'Please enter a valid card number';
                        }
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 16.w, top: 20.h, bottom: 20.h),
                      filled: true,
                      fillColor: AppColors.whiteColor.withOpacity(0.9),
                      hintText: '4539 5534 0002 0169',
                      hintStyle: AppFonts.bodyDefault.copyWith(
                        color: AppColors.black2Color,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 1.w,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          color: AppColors.greyColor,
                          width: 1.w,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          color: AppColors.greyColor,
                          width: 1.w,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          color: AppColors.errorColor,
                          width: 1.w,
                        ),
                      ),
                    ),
                    // onChanged: (value) {
                    //   String formattedValue = value.replaceAll(RegExp(r'\D'), '');
                    //   // Remove all non-digits
                    //   if (formattedValue.length > 0) {
                    //     formattedValue = formattedValue.replaceAllMapped(
                    //       RegExp(r'.{4}'),
                    //           (match) => '${match.group(0)} ',
                    //     ); // Add a space after every 4 digits
                    //   }
                    //   creditCardController.value = TextEditingValue(
                    //     text: formattedValue,
                    //     selection: TextSelection.collapsed(offset: formattedValue.length),
                    //   );
                    // },
                    onChanged: (value) {
                      String formattedValue =
                          value.replaceAll(RegExp(r'\D'), '');
                      if (formattedValue.length > 0) {
                        formattedValue = formattedValue.replaceAllMapped(
                          RegExp(r'.{4}'),
                          (match) => '${match.group(0)} ',
                        );
                      }

                      if (formattedValue.length > 19) {
                        formattedValue = formattedValue.substring(0, 19);
                      }

                      controller.value = TextEditingValue(
                        text: formattedValue,
                        selection: TextSelection.collapsed(
                            offset: formattedValue.length),
                      );
                    },
                    onEditingComplete: () {
                      String value =
                          controller.text.replaceAll(RegExp(r'\D'), '');
                      if (value.length >= 19) {
                        // Set the focus to the next field
                        cvvFocusNode.requestFocus();
                      }
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(19),
                    ],
                  ),
                ),
                SizedBox(height: 31.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    'Expiry Date',
                    textAlign: TextAlign.left,
                    style: AppFonts.bodyDefault.copyWith(
                      color: AppColors.black2Color,
                    ),
                  ),
                ),
                SizedBox(height: 11.h),

                /// Expiry Date
                Padding(
                  padding: EdgeInsets.only(left: 21.w),
                  child: Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: AppColors.white2Color,
                            width: 1.w,
                          ),
                        ),
                        child: TextFormField(
                          controller: yearController,
                          focusNode: yearFocusNode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            _DateFormatter(),
                          ],

                          cursorColor: AppColors.primaryColor,
                          style: AppFonts.bodyDefault.copyWith(
                              color: AppColors.black3Color, height: 1.5.h),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: AppColors.whiteColor.withOpacity(0.9),
                            hintText: 'MM / YY',
                            hintStyle: AppFonts.bodyDefault.copyWith(
                              color: AppColors.black2Color,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                                width: 0.w,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: AppColors.greyColor,
                                width: 0.w,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: AppColors.greyColor,
                                width: 0.w,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: AppColors.errorColor,
                                width: 1.w, // set the width of the error border
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains('/')) {
                              return 'Invalid Date';
                            }
                            final dateParts = value.split('/');
                            if (dateParts.length != 2 ||
                                dateParts[0].length != 2 ||
                                dateParts[1].length != 2) {
                              return 'Invalid Date';
                            }
                            return null;
                          },
                          onEditingComplete: () {
                            yearFocusNode.unfocus();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomButton(
                    widget: state is AddCreditCardLoadingState
                        ? SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: CircularProgressIndicator(
                              strokeWidth: 4.w,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.whiteColor,
                              ),
                            ),
                          )
                        : Row(
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
                      if (key.currentState!.validate()) {
                        cubit.addCreditCard(
                            credit_card_number: controller.text,
                            expiry_date: yearController.text.toString());
                        // print('Expiry Date is = ${monthController.text}${yearController.text}');
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void navigateToMyCard(BuildContext context, String cardNumber, expiryDate) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => MyCardView(),
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
}

class _DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      final nonZeroIndex = i + 1;
      if (nonZeroIndex == 2 && text.length > 2) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    if (string.length > 5) {
      string = string.substring(0, 5);
    }

    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
