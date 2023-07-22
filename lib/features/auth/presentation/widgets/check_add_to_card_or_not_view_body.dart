import 'package:bella/features/auth/presentation/widgets/widgets/custom_button.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckAddToCardOrNotViewBody extends StatelessWidget {
  const CheckAddToCardOrNotViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 73.h),
        Text(
          'Important!',
          textAlign: TextAlign.center,
          style: AppFonts.titleScreen,
        ),
        SizedBox(height: 30.h),
        Text(
          'Adding payment card is the way to \n identify your purchases and collect\n points',
          textAlign: TextAlign.center,
          style: AppFonts.bodyLarge,
        ),
        SizedBox(height: 83.h),
        Image.asset(
          AppAssets.waleet,
          height: 219.h,
          width: 219.w,
        ),
        SizedBox(height: 33.h),
        Text(
          'You can still add your card in the your\n profile page.',
          textAlign: TextAlign.center,
          style: AppFonts.bodyLarge,
        ),
        SizedBox(height: 146.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
              Navigator.pushReplacementNamed(context, 'add-card-screen');
            },
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomButtonOutlined(
            widget: Text(
              ' Take Me Home',
              style: AppFonts.bodyLargeBold.copyWith(
                color: AppColors.primaryColor,
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
              Navigator.pushReplacementNamed(context, 'layout-screen');
            },
            color: AppColors.bgColor,
          ),
        ),
      ],
    );
  }
}
