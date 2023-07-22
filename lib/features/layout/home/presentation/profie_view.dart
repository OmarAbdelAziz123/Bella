import 'package:bella/features/layout/home/presentation/home_view.dart';
import 'package:bella/features/layout/home/presentation/widgets/profile_view_body.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            navigatePop(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: SvgPicture.asset(
              AppAssets.arrowbackblack,
              // width: 43.w,
              // height: 43.h,
            ),
          ),
        ),
      ),
      body: const ProfileViewBody(),
    );
  }

  void navigatePop(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => const HomeView(),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}
