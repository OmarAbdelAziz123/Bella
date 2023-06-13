import 'package:bella/features/auth/presentation/widgets/send_otb_view_body.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';

class SendOTBView extends StatelessWidget {
  const SendOTBView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey4Color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(),
      ),
      body: SendOTBViewBody(),
    );
  }
}
