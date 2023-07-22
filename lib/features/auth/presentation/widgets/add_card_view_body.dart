import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/custom_button.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/text_form_fiel_widget.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCardViewBody extends StatefulWidget {
  AddCardViewBody({Key? key}) : super(key: key);

  @override
  State<AddCardViewBody> createState() => _AddCardViewBodyState();
}

class _AddCardViewBodyState extends State<AddCardViewBody> {
  TextEditingController creditCardController = TextEditingController();

  TextEditingController monthController = TextEditingController();

  TextEditingController yearController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();

  FocusNode cvvFocusNode = FocusNode();

  final yearFocusNode = FocusNode();

  bool visible = false;

  //Navigator.pushReplacementNamed(
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AddCreditCardSuccessState) {
          print('Success');
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
              SizedBox(height: 40.h),
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
                  style:
                      AppFonts.bodyDefault.copyWith(color: AppColors.black2Color),
                ),
              ),
              SizedBox(height: 14.h),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.w),
              //   child: TextFormField(
              //       controller: creditCardController,
              //       cursorColor: AppColors.primaryColor,
              //       keyboardType: TextInputType.number,
              //       style: AppFonts.bodyDefault
              //           .copyWith(color: AppColors.black3Color, height: 1.5.h),
              //       decoration: InputDecoration(
              //         contentPadding:
              //             EdgeInsets.only(left: 16.w, top: 20.h, bottom: 20.h),
              //         filled: true,
              //         fillColor: AppColors.whiteColor.withOpacity(0.9),
              //         hintText: '4539 5534 0002 0169',
              //         hintStyle: AppFonts.bodyDefault.copyWith(
              //           color: AppColors.black2Color,
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.r),
              //           borderSide: BorderSide(
              //             color: AppColors.primaryColor,
              //             width: 1.w,
              //           ),
              //         ),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.r),
              //           borderSide: BorderSide(
              //             color: AppColors.greyColor,
              //             width: 1.w,
              //           ),
              //         ),
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.r),
              //           borderSide: BorderSide(
              //             color: AppColors.greyColor,
              //             width: 1.w,
              //           ),
              //         ),
              //         errorBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.r),
              //           borderSide: BorderSide(
              //             color: AppColors.errorColor,
              //             width: 1.w,
              //           ),
              //         ),
              //       ),
              //       onChanged: (value) {
              //         if (value.length == 14) {
              //           // when two digits are entered, set the focus to the year TextFormField
              //           yearFocusNode.requestFocus();
              //         }
              //       }),
              // ),
              /// Card Number
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TextFormField(
                  controller: creditCardController,
                  cursorColor: AppColors.primaryColor,
                  keyboardType: TextInputType.number,
                  style: AppFonts.bodyDefault
                      .copyWith(color: AppColors.black3Color, height: 1.5.h),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This card is already in use. Please try other one.';
                    }
                    else if (value.isNotEmpty) {
                      final firstDigit = int.tryParse(value[0]);
                      if (firstDigit == null || (firstDigit != 2 && firstDigit != 3 && firstDigit != 4)) {
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
                    String formattedValue = value.replaceAll(RegExp(r'\D'), '');
                    if (formattedValue.length > 0) {
                      formattedValue = formattedValue.replaceAllMapped(
                        RegExp(r'.{4}'),
                            (match) => '${match.group(0)} ',
                      );
                    }

                    if (formattedValue.length > 19) {
                      formattedValue = formattedValue.substring(0, 19);
                    }

                    creditCardController.value = TextEditingValue(
                      text: formattedValue,
                      selection: TextSelection.collapsed(
                          offset: formattedValue.length),
                    );
                  },
                  onEditingComplete: () {
                    String value =
                    creditCardController.text.replaceAll(RegExp(r'\D'), '');
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
                          if (value == null || value.isEmpty || !value.contains('/')) {
                            return 'Invalid Date';
                          }
                          final dateParts = value.split('/');
                          if (dateParts.length != 2 || dateParts[0].length != 2 || dateParts[1].length != 2) {
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
              /// 3
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
                    if (key.currentState!.validate()) {
                      cubit.addCreditCard(
                          credit_card_number: creditCardController.text,
                          expiry_date: '$monthController/$yearController');
                      Navigator.pushNamed(context, 'well-done-screen');
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
                    }

                  },
                ),
              ),
            ],
          ),
        );
      },
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
