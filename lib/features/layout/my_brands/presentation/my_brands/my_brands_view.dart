// ignore_for_file: must_be_immutable
import 'package:bella/features/layout/my_brands/presentation/widgets/my_brand_view_body.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBrandsView extends StatelessWidget {
  String routeName = '/brands';
  MyBrandsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80.h),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Text(
              'Brands',
              style: AppFonts.titleScreen,
            ),
          ),
        ),
      ),
      body: const SafeArea(
        child: MyBrandViewBody(),
      ),
    );
  }
}
