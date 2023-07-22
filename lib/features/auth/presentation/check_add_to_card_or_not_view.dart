import 'package:bella/features/auth/presentation/widgets/check_add_to_card_or_not_view_body.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';

class CheckAddToCardOrNotView extends StatelessWidget {
  const CheckAddToCardOrNotView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CheckAddToCardOrNotViewBody(),
    );
  }
}
