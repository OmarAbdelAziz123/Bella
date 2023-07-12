import 'package:bella/features/layout/scan/managers/scan_cubit.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ScanView extends StatelessWidget {
  const ScanView({Key? key}) : super(key: key);

  final Color overlayColor = AppColors.black2Color;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ScanCubit, ScanState>(
      listener: (context, state) {
        if (state is San2SuccessState) {
          BlocProvider.of<ScanCubit>(context).getScanFunction(context);
        } else if (state is San2ErrorState) {
          print('Error in Scan');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor, BlendMode.srcIn),
                  child: Lottie.asset(
                    AppAssets.scanSquare,
                    height: 350.h,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 50.h),
                Text(
                  'Press on scan tab',
                  style: AppFonts.titleSubsection,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
