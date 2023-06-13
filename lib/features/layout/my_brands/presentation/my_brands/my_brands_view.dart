import 'package:bella/features/layout/my_brands/presentation/widgets/my_brand_view_body.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBrandsView extends StatelessWidget {
  const MyBrandsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Brands',
          style: GoogleFonts.darkerGrotesque(
            height: 1.h,
            fontWeight: FontWeight.bold,
            fontSize: 28.sp,
            color: AppColors.black3Color,
          ),
        ),
      ),
      body: SafeArea(
        child: MyBrandViewBody(),
      ),
    );
  }
}
