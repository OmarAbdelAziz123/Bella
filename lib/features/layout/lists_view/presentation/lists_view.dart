import 'package:bella/features/layout/lists_view/presentation/widgets/lists_view_body.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListsView extends StatelessWidget {
  const ListsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      // appBar: AppBar(
      //   title: Text(
      //     'Wishlist',
      //     style: GoogleFonts.darkerGrotesque(
      //       fontWeight: FontWeight.w800,
      //       height: 1,
      //       fontSize: 18.sp,
      //       color: AppColors.black3Color,
      //     ),
      //   ),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: const SafeArea(child: ListsViewBody()),
    );
  }
}
