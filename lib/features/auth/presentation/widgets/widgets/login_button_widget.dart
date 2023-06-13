// ignore_for_file: must_be_immutable
import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginButtonWidget extends StatelessWidget {
  void Function()? onTap;
  final double width;
  final Widget textWidget;

  LoginButtonWidget(
      {Key? key, required this.onTap, required this.width, required this.textWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: width,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.logo),
                SizedBox(width: 10.w),
                textWidget,
              ],
            ),
          ),
        );
      },
    );
  }
}
