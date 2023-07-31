import 'package:bella/features/auth/presentation/widgets/signup_view_body.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey4Color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Register',
          style: AppFonts.titleScreen,
        ),
        leading: Container(),
      ),
      body: const SignupViewBody(),
    );
  }
}
