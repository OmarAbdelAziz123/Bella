import 'package:bella/features/auth/presentation/widgets/add_card_view_body.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 28.h),
          child: Text(
            'Almost done!',
            textAlign: TextAlign.center,
            style: AppFonts.titleScreen,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'check-add-to-card-or-not');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Text(
                'Skip',
                style: AppFonts.capsolButton.copyWith(
                  letterSpacing: 0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: const AddCardViewBody(),
    );
  }
}
