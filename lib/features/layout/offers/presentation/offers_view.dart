import 'package:bella/features/layout/offers/presentation/widgets/offers_view_body.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Offers',
          style: GoogleFonts.darkerGrotesque(
            fontWeight: FontWeight.bold,
            height: 1.h,
            color: AppColors.black3Color,
            fontSize: 28.sp,
          ),
        ),
      ),
      body: const OffersViewBody(),
    );
  }
}
