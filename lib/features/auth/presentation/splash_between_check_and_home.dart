import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashBetweenCheckAndHome extends StatefulWidget {
  const SplashBetweenCheckAndHome({Key? key}) : super(key: key);

  @override
  State<SplashBetweenCheckAndHome> createState() =>
      _SplashBetweenCheckAndHomeState();
}

class _SplashBetweenCheckAndHomeState extends State<SplashBetweenCheckAndHome> {
  @override
  void initState() {
    navigationToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome Again',
              style: GoogleFonts.darkerGrotesque(
                color: AppColors.black2Color,
                height: 1,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigationToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, 'layout-screen');
      },
    );
  }
}
