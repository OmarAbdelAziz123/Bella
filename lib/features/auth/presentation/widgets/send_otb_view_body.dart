// ignore_for_file: unrelated_type_equality_checks, null_check_always_fails
import 'dart:async';
import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/custom_button.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'check_view_body.dart';

class SendOTBViewBody extends StatefulWidget {
  SendOTBViewBody({Key? key}) : super(key: key);

  TextEditingController pinController = TextEditingController();

  @override
  State<SendOTBViewBody> createState() => _SendOTBViewBodyState();
}

class _SendOTBViewBodyState extends State<SendOTBViewBody> {
  GlobalKey<FormState> verifyKey = GlobalKey<FormState>();

  int _counter = 60;
  Timer? _timer;
  bool _isButtonDisabled = false;
  bool showErrorText = true;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer!.cancel();
          _isButtonDisabled = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future getOTB() async {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CheckVerificationCodeSuccessState) {
          if (BlocProvider.of<AuthCubit>(context)
                  .checkVerificationCodeModel
                  .verificationStatus ==
              'approved') {
            BlocProvider.of<AuthCubit>(context).createFun(
              social_security_number:
                  MyCache.getString(key: CacheKeys.personalNumber),
              email: MyCache.getString(key: CacheKeys.email),
              first_name: MyCache.getString(key: CacheKeys.firstName),
              full_name: MyCache.getString(key: CacheKeys.fullName),
              phone_number: MyCache.getString(key: CacheKeys.phone_number),
              surname: MyCache.getString(key: CacheKeys.lastName),
            );
            Navigator.pushReplacementNamed(context, 'layout-screen');
            Timer? timer = Timer(const Duration(seconds: 1), () {
              Navigator.of(context, rootNavigator: true).pop();
            });
            AppConstants.showMyDialog2(context).then((value) {
              timer!.cancel();
              timer = null;
            });
          } else if (BlocProvider.of<AuthCubit>(context)
                  .checkVerificationCodeModel
                  .verificationStatus ==
              'pending') {
            SnackBar snackBar = const SnackBar(
                content: Text('Check OTB Again Something Wrong'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        } else if (state is CheckVerificationCodeErrorState) {
          SnackBar snackBar =
              const SnackBar(content: Text('Check OTB Code Failure'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is CreateSuccessState) {
          Navigator.pushReplacementNamed(context, 'layout-screen');
          AppConstants.showMyDialog2(context);
        }
      },
      builder: (context, state) {
        String personalNumber =
            MyCache.getString(key: CacheKeys.personalNumber);
        String fullName = MyCache.getString(key: CacheKeys.fullName);
        String firstName = MyCache.getString(key: CacheKeys.firstName);
        String lastName = MyCache.getString(key: CacheKeys.lastName);
        String email = MyCache.getString(key: CacheKeys.email);
        String phoneNumber = MyCache.getString(key: CacheKeys.phone_number);
        return Form(
          key: verifyKey,
          child: Center(
            child: SizedBox(
              // height: MediaQuery.of(context).size.height / 1.15,
              child: Column(
                children: [
                  // SizedBox(height: 13.h),
                  Text(
                    'Verify your mobile number',
                    style: GoogleFonts.darkerGrotesque(
                      height: 1.h,
                      color: AppColors.black3Color,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        Text(
                          'Enter 6 digit code sent to mobile',
                          style: GoogleFonts.darkerGrotesque(
                            color: AppColors.black3Color,
                            // fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            height: 0.5.h,
                          ),
                        ),
                        Text(
                          '+20${MyCache.getString(key: CacheKeys.mobile_number)}',
                          style: GoogleFonts.darkerGrotesque(
                            color: AppColors.black3Color,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            height: 1.6.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 42.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Pinput(
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      controller: widget.pinController,
                      length: 6,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      focusedPinTheme: PinTheme(
                        height: 40.h,
                        width: 40.w,
                        textStyle: GoogleFonts.darkerGrotesque(
                          fontSize: 30.sp,
                          height: 1.h,
                          color: AppColors.black2Color,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: AppColors.whiteColor,
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.primaryColor,
                          ),
                          // ),
                        ),
                      ),
                      defaultPinTheme: PinTheme(
                        height: 40.h,
                        width: 40.w,
                        textStyle: GoogleFonts.darkerGrotesque(
                          fontSize: 30.sp,
                          height: 1.h,
                          color: AppColors.black2Color,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: AppColors.whiteColor,
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.greyColor,
                          ),
                          // ),
                        ),
                      ),
                      errorPinTheme: PinTheme(
                        height: 40.h,
                        width: 40.w,
                        textStyle: GoogleFonts.darkerGrotesque(
                          fontSize: 30.sp,
                          height: 1.h,
                          color: AppColors.black2Color,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: AppColors.whiteColor,
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.errorColor,
                          ),
                          // ),
                        ),
                      ),
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      onCompleted: (value) async {
                        print('Personal Number is $personalNumber');
                        print('First Name is $firstName');
                        print('Last Name is $lastName');
                        print('Email is $email');
                        print('Phone Number is $phoneNumber');
                        // sleep(Duration(milliseconds: 1500));
                        if (verifyKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).createFun(
                            social_security_number: personalNumber,
                            email: email,
                            first_name: firstName,
                            full_name: fullName,
                            phone_number: phoneNumber,
                            surname: lastName,
                            // personalNumber,
                            // fullName,
                            // firstName,
                            // lastName,
                            // email,
                            // phoneNumber,
                          );
                          setState(() {
                            showErrorText = true;
                          });
                        } else {
                          setState(() {
                            showErrorText = false;
                          });
                        }

                        // BlocProvider.of<AuthCubit>(context)
                        //     .checkVerificationCode(
                        //   widget.pinController.toString(),
                        //   MyCache.getString(
                        //     key: CacheKeys.mobile_number,
                        //   ),
                        //
                        // Navigator.pushReplacementNamed(context, 'layout-screen');
                        // );
                      },
                    ),
                  ),
                  showErrorText == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Oops! the code is wrong/expired \n Please verify your code again.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.darkerGrotesque(
                                fontSize: 15.sp,
                                color: AppColors.errorColor,
                                height: 1,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(height: 124.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!_isButtonDisabled) {
                              setState(() {
                                _isButtonDisabled = true;
                                _counter = 60;
                              });
                              _startTimer();
                            }
                          },
                          child: Text(
                            _isButtonDisabled
                                ? 'Resend code ($_counter) '
                                : 'Resend code ',
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.darkerGrotesque(
                              height: 1.h,
                              fontWeight: FontWeight.bold,
                              decoration: _isButtonDisabled
                                  ? TextDecoration.none
                                  : TextDecoration.underline,
                              color: _isButtonDisabled
                                  ? AppColors.black3Color
                                  : AppColors.primaryColor,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                        Text(
                          _isButtonDisabled
                              ? 'if uou didn\'t receive a'
                              : 'if uou didn\'t receive a verification',
                          style: GoogleFonts.darkerGrotesque(
                            height: 1.h,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black3Color,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // BlocProvider.of<AuthCubit>(context)
                          //     .createVerificationCode(
                          //   MyCache.getString(key: CacheKeys.mobile_number),
                          // );
                          // BlocProvider.of<AuthCubit>(context).createFun(
                          //   MyCache.getString(key: CacheKeys.personalNumber),
                          //   MyCache.getString(key: CacheKeys.fullName),
                          //   MyCache.getString(key: CacheKeys.firstName),
                          //   MyCache.getString(key: CacheKeys.lastName),
                          //   MyCache.getString(key: CacheKeys.email),
                          //   MyCache.getString(key: CacheKeys.phone_number),
                          // );
                          // Navigator.pushReplacementNamed(
                          //     context, 'layout-screen');
                          BlocProvider.of<AuthCubit>(context).createFun(
                            social_security_number: personalNumber,
                            email: email,
                            first_name: firstName,
                            full_name: fullName,
                            phone_number: phoneNumber,
                            surname: lastName,
                            // personalNumber,
                            // fullName,
                            // firstName,
                            // lastName,
                            // email,
                            // phoneNumber,
                          );
                        },
                        child: Text(
                          _isButtonDisabled
                              ? 'verification code. Wait for the code to arrive.'
                              : 'code. Wait for the code to arrive.',
                          style: GoogleFonts.darkerGrotesque(
                            decorationColor: AppColors.black2Color,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                            fontSize: 18.sp,
                            // height: 1.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    widget: state is CreateLoadingState
                        ? const CircularProgressIndicator(
                            color: AppColors.whiteColor,
                          )
                        : Text(
                            'Verify',
                            style: GoogleFonts.darkerGrotesque(
                              height: 1.h,
                              color: AppColors.whiteColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            // textScaleFactor:
                            //     ScaleSize.textScaleFactor(context),
                          ),
                    width: 353.w,
                    onTap: () {
                      if (verifyKey.currentState!.validate()) {
                        setState(() {});
                        // BlocProvider.of<AuthCubit>(context)
                        //     .checkVerificationCode(
                        //   widget.pinController.toString(),
                        //   MyCache.getString(
                        //     key: CacheKeys.mobile_number,
                        //   ),
                        // );
                        if (verifyKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).createFun(
                            social_security_number: personalNumber,
                            email: email,
                            first_name: firstName,
                            full_name: fullName,
                            phone_number: phoneNumber,
                            surname: lastName,
                            // personalNumber,
                            // fullName,
                            // firstName,
                            // lastName,
                            // email,
                            // phoneNumber,
                          );
                          setState(() {
                            showErrorText = true;
                          });
                        } else {
                          setState(() {
                            showErrorText = false;
                          });
                        }
                        // Navigator.pushReplacementNamed(
                        //     context, 'layout-screen');

                        // AppConstants.showMyDialog2(context);
                        // sleep(Duration(seconds: 2));

                        // sleep(Duration(seconds: 1));
                        // Navigator.pushReplacementNamed(context, 'layout-screen');
                        // Future.delayed(Duration(seconds: 2), () {
                        //   Navigator.of(context).pop();
                        // });
                        // Navigator.pushNamed(context, 'send-otb-screen');
                      }
                    },
                  ),
                  SizedBox(height: 35.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  textFieldOTP(
      {required bool first,
      required bool last,
      required TextEditingController otbController}) {
    return SizedBox(
      height: 7.h,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '';
            }
            return null;
          },
          controller: otbController,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 1 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: GoogleFonts.darkerGrotesque(
            height: 0.1.h,
            fontWeight: FontWeight.w800,
            fontSize: 18.sp,
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.whiteColor,
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.28.w, color: AppColors.greyColor),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 0.28.w, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10.sp),
            ),
          ),
        ),
      ),
    );
  }
}
