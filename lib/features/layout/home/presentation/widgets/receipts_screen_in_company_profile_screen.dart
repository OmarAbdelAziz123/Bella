// ignore_for_file: must_be_immutable

import 'package:bella/features/layout/home/data/models/receipts_model.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/widgets/receipts_details_screen)in_company_profile_screen.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReceiptsScreenInCompanyProfileScreen extends StatefulWidget {
  String companyLogo, title;

  ReceiptsScreenInCompanyProfileScreen({
    Key? key,
    required this.companyLogo,
    required this.title,
  }) : super(key: key);

  @override
  State<ReceiptsScreenInCompanyProfileScreen> createState() =>
      _ReceiptsScreenInCompanyProfileScreenState();
}

class _ReceiptsScreenInCompanyProfileScreenState
    extends State<ReceiptsScreenInCompanyProfileScreen> {
  void navigateToReceiptDetailsScreenInCompanyProfileScreen(Receipts receipts) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) => ReceiptDetailsScreenInCompanyProfileScreen(
          title: widget.title,
          companyLogo: widget.companyLogo,
          receipts: receipts,
        ),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllReceipts(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<HomeCubit>(context);

          return Scaffold(
            backgroundColor: AppColors.bgColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(AppAssets.back),
              ),
              centerTitle: true,
              title: ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: AppConstants.showNetworkImage(
                  image: widget.companyLogo,
                  width: 31.h,
                  height: 31.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 27.w),
                  width: 20.w,
                  height: 16.h,
                  child: SvgPicture.asset(AppAssets.more),
                ),
              ],
            ),
            body: state is GetAllReceiptsLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : cubit.receipts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'No receipts found yet',
                              style: AppFonts.titleSection,
                            ),
                            Text(
                              'All your receipts will appear here',
                              style: AppFonts.bodyLarge,
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Receipts',
                                style: AppFonts.titleScreen,
                              ),
                              SizedBox(height: 40.h),
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: cubit.receipts.length,
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: 39.w,
                                        right: 0,
                                        top: 16.h,
                                        bottom: 16.h),
                                    child: Image.asset(AppAssets.Vector123),
                                  );
                                },
                                itemBuilder: (context, index) {
                                  Receipts item = cubit.receipts[index];

                                  return InkWell(
                                    onTap: () {
                                      navigateToReceiptDetailsScreenInCompanyProfileScreen(
                                          item);
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.receipt,
                                          width: 28.w,
                                          height: 28.h,
                                        ),
                                        SizedBox(width: 10.w),
                                        SizedBox(
                                          width: 140.w,
                                          child: Text(
                                            // '20. august',
                                            item.date!,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppFonts.productName,
                                          ),
                                        ),
                                        SizedBox(width: 34.w),
                                        SizedBox(
                                          width: 140.w,
                                          child: Text(
                                            // '1283,80 kr',
                                            '${item.total} kr',
                                            textAlign: TextAlign.right,
                                            style: AppFonts.productPrice,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }
}
