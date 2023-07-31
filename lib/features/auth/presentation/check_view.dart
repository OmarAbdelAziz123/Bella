import 'package:bella/features/auth/presentation/widgets/check_view_body.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';

class CheckView extends StatelessWidget {
  const CheckView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CheckViewBody(),
    );
  }
}
