import 'package:bella/features/auth/presentation/widgets/check_view_body.dart';
import 'package:bella/features/auth/presentation/widgets/widgets/custom_button.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ListsViewBody extends StatelessWidget {
  const ListsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                'Wishlist',
                style: GoogleFonts.darkerGrotesque(
                  fontWeight: FontWeight.bold,
                  height: 1.h,
                  color: AppColors.black3Color,
                  fontSize: 28.sp,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 160.w,
                height: 160.h,
                margin: EdgeInsets.only(top: 66.h, bottom: 24.h),
                padding: EdgeInsets.only(top: 43.42.h, bottom: 43.42.h, left: 49.94.w, right: 46.86.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300.r),
                  color: AppColors.grey6Color,
                ),
                child: SvgPicture.asset(AppAssets.icon, height: 65.15.h, width: 55.38.w),
              ),
            ),
            Center(
              child: Text(
                'There is no wishlist yet',
                textAlign: TextAlign.center,
                style: GoogleFonts.darkerGrotesque(
                  color: AppColors.blackColor,
                  fontSize: 18.sp,
                  height: 1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 53.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButton(
                widget: Text(
                  'Create new wishlist',
                  style: GoogleFonts.darkerGrotesque(
                    height: 1.h,
                    color: AppColors.whiteColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  // textScaleFactor: ScaleSize.textS/caleFactor(context),
                ),
                width: double.infinity,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
