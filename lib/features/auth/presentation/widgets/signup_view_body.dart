// ignore_for_file: unrelated_type_equality_checks
import 'package:bella/features/auth/presentation/widgets/check_view_body.dart';
import 'package:flutter/services.dart';
import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/custom_button.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({Key? key}) : super(key: key);

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController idController = TextEditingController();

  int maxLength = 10;

  bool readOnly = false;

  String value = '';

  bool isError = false;
  bool isRead = false;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushNamed(context, 'send-otb-screen');
          // if(state is CreateVerificationCodeSuccessState) {
          //   BlocProvider.of<AuthCubit>(context)
          //       .createVerificationCode('01027324902');
          //   // '${MyCache.getString(key: CacheKeys.mobile_number)}');
          //   Navigator.pushReplacementNamed(
          //       context, 'send-otb-screen');
          // // Navigator.pushReplacementNamed(context, 'send-otb-screen');
          // } else if(state is CreateVerificationCodeErrorState) {
          //   SnackBar snackBar = const SnackBar(
          //     content: Text('Create have error'),
          //     backgroundColor: AppColors.errorColor,
          //   );
          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // }

        } else if (state is RegisterErrorState) {
          // SnackBar snackBar = const SnackBar(
          //   content: Text('Email or Phone Number are used'),
          //   backgroundColor: AppColors.errorColor,
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          _showSnackbar();
        }
        // if(state is RegisterSuccessState) {
        //   Navigator.pushReplacementNamed(context, 'send-otb-screen');
        // }
      },
      builder: (context, state) {
        return Form(
          key: signupKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: SizedBox(
                // height: MediaQuery.of(context).size.height / 1.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome ${MyCache.getString(key: CacheKeys.firstName)}!',
                      style: GoogleFonts.darkerGrotesque(
                        height: 0.8.h,
                        color: AppColors.black3Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.sp,
                      ),
                    ),
                    SizedBox(height: 22.h),
                    Text(
                      'Fill in your mobile number and email',
                      style: GoogleFonts.darkerGrotesque(
                        height: 0.5.h,
                        color: AppColors.black3Color,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    // SizedBox(height: 4.h),
                    Text(
                      'to get started!',
                      style: GoogleFonts.darkerGrotesque(
                        height: 1.1.h,
                        color: AppColors.black3Color,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 38.h),
                    Row(
                      children: [
                        Text(
                          'Mobile Number',
                          style: GoogleFonts.darkerGrotesque(
                            height: 1.h,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black2Color,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 11.h),
                    TextFormField(
                      controller: mobileController,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      cursorColor: AppColors.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          value = mobileController.text;
                        });
                      },
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (value.length > 10) {
                          return 'Please enter a valid number between 9 : 10';
                        } else if (value.length < 9) {
                          return 'Please enter a valid number between 9 : 10';
                        }
                        return null;
                      },
                      style: GoogleFonts.darkerGrotesque(
                        fontSize: 20.sp,
                        height: 1.h,
                        color: AppColors.black3Color,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${mobileController.text.length}/$maxLength',
                              style: GoogleFonts.darkerGrotesque(
                                fontWeight: FontWeight.w500,
                                height: 1.h,
                                color: AppColors.black3Color,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 16.w,
                        ),
                        filled: true,
                        fillColor: AppColors.whiteColor.withOpacity(0.9),
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '+20',
                              style: GoogleFonts.darkerGrotesque(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                                height: 1.h,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(
                            color: AppColors.greyColor,
                            width: 1.sp,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(
                            color: AppColors.greyColor,
                            width: 1.sp,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(
                            color: AppColors.errorColor,
                            width: 1.sp,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 1.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 31.h),
                    Row(
                      children: [
                        Text(
                          'Email',
                          style: GoogleFonts.darkerGrotesque(
                            height: 1.h,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black2Color,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 11.h),
                    TextFormField(
                      cursorColor: AppColors.primaryColor,
                      // cursorHeight: 20.h,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email';
                        } else if (!onError(value)) {
                          return 'Please enter valid as example@example.com';
                        }
                        return null;
                      },
                      style: GoogleFonts.darkerGrotesque(
                        fontSize: 20.sp,
                        height: 1.h,
                        color: AppColors.black3Color,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          // bottom: 19.h,
                          left: 16.w,
                          // top: 20.h,
                        ),
                        filled: true,
                        fillColor: AppColors.whiteColor.withOpacity(0.9),
                        // hintText: 'Ex: example@gmail.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(
                            color: AppColors.greyColor,
                            width: 1.sp,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(
                            color: AppColors.greyColor,
                            width: 1.sp,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(
                            color: AppColors.errorColor,
                            width: 1.sp,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(
                            color: AppColors.errorColor,
                            width: 1.sp,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 1.sp,
                          ),
                        ),
                      ),
                    ),
                    // const Spacer(),
                    SizedBox(height: 39.h),
                    state is CreateVerificationCodeLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : CustomButton(
                            widget: Text(
                              'Next',
                              style: GoogleFonts.darkerGrotesque(
                                height: 1.h,
                                color: AppColors.whiteColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            // text: 'Next',
                            width: 353.w,
                            onTap: () async {
                              MyCache.putString(
                                  key: CacheKeys.mobile_number,
                                  value: mobileController.text);
                              if (signupKey.currentState!.validate()) {
                                await BlocProvider.of<AuthCubit>(context)
                                    .registerFun(
                                  emailController.text,
                                  mobileController.text,
                                );
                                // await BlocProvider.of<AuthCubit>(context)
                                //     .createVerificationCode(MyCache.getString(key: CacheKeys.mobile_number));
                                ///
                                // BlocProvider.of<AuthCubit>(context)
                                //     .createVerificationCode(
                                //         '+20${mobileController.text}');
                                // Navigator.pushReplacementNamed(
                                //     context, 'send-otb-screen');
                                // Navigator.pushNamed(context, 'send-otb-screen');
                              }
                            },
                          ),
                    SizedBox(height: 2.8.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showSnackbar() {
    final snackbar = SnackBar(
      elevation: 0,
      content: SizedBox(
        width: double.infinity,
        height: 14.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'The information provided is already used',
              overflow: TextOverflow.clip,
              style: GoogleFonts.darkerGrotesque(
                height: 1.h,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.errorColor,
              ),
            ),
            const Spacer(),
            VerticalDivider(
              color: AppColors.errorColor,
              width: 14.w,
              thickness: 1.2.sp,
            ),
            SizedBox(width: 2.6.w),
            Text(
              'X',
              overflow: TextOverflow.clip,
              style: GoogleFonts.darkerGrotesque(
                height: 1.h,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.errorColor,
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
            //   },
            //   child: SvgPicture.asset(AppAssets.X, height: 14.h),
            // ),
            SizedBox(width: 5.w),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF6EAEA),
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.only(top: 13.5.h, bottom: 13.h, left:  12.w, right: 7.w),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 85, right: 32.w, left: 25.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
        side: BorderSide(
          color: AppColors.errorColor,
          width: 1.w,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

bool onError(String value) {
  return RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+[.]+[com]").hasMatch(value);
}
