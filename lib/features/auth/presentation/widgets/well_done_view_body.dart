import 'package:bella/features/auth/presentation/widgets/check_view_body.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/login_button_widget.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WellDoneViewBody extends StatelessWidget {
  const WellDoneViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 88.h),
        Image.asset(
          AppAssets.hand,
          height: 382.h,
          width: 382.w,
        ),
        SizedBox(height: 33.h),
        SizedBox(
          width: 351.w,
          height: 158.h,
          child: Column(
            children: [
              Text(
                'Well done!\n :)'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Futura LT Condensed Extra Bold',
                  color: AppColors.black3Color,
                  fontWeight: FontWeight.w700,
                  fontSize: 50.sp,
                  letterSpacing: -2.sp,
                  height: 1.16.h,
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: 246.w,
                child: Text(
                  'Your account has been created \n successfully!',
                  textAlign: TextAlign.center,
                  style: AppFonts.bodyLarge.copyWith(
                    height: 1.5.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 102.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginButtonWidget(
                textWidget: Text(
                  'Log in with BankID',
                  style: AppFonts.bodyLargeBold.copyWith(
                    color: AppColors.whiteColor,
                  ),
                  textAlign: TextAlign.center,
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                ),
                width: 353.h,
                onTap: () {
                  Navigator.pushNamed(context, 'layout-screen');
                }),
          ],
        ),
      ],
    );
  }
}
