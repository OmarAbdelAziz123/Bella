import 'package:bella/features/auth/presentation/widgets/well_done_view_body.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';

class WellDoneView extends StatelessWidget {
  const WellDoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: WellDoneViewBody(),
    );
  }
}
