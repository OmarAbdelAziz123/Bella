import 'package:bella/features/layout/offers/managers/myoffers_cubit.dart';
import 'package:bella/features/layout/offers/presentation/widgets/offers_view_body.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OffersView extends StatefulWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {

  @override
  void initState() {
    print('Get All Offffff');
    BlocProvider.of<MyoffersCubit>(context)
        .getAllPersonalOffersByUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Offers',
          style: GoogleFonts.darkerGrotesque(
            fontWeight: FontWeight.bold,
            height: 1.h,
            color: AppColors.black3Color,
            fontSize: 28.sp,
          ),
        ),
      ),
      body: const OffersViewBody(),
    );
  }
}
