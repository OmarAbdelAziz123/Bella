import 'package:bella/features/layout/my_brands/presentation/widgets/company_details_view_body.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyDetailsView extends StatelessWidget {
  const CompanyDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70.h),
        child: AppBar(
          backgroundColor: AppColors.bgColor,
          elevation: 0,
        ),
      ),
      body: const SafeArea(
        child: CompanyDetailsViewBody(),
      ),
    );
  }
}
