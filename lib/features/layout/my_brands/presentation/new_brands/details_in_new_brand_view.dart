import 'package:bella/features/layout/my_brands/presentation/new_brands/widgets/details_in_new_brand_view_body.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsInNewBrandView extends StatelessWidget {
  const DetailsInNewBrandView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      child: Stack(
        children: [
          Image.asset(AppAssets.bannerTest),
          Positioned(
            top: 5.h,
            left: 8.w,
            child: SvgPicture.asset(AppAssets.arrowContainer),
          ),
          Positioned(
            top: 5.h,
            right: 8.w,
            child: SvgPicture.asset(AppAssets.infoCircle),
          ),
          const Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: DetailsInNewBrandViewBody(),
            ),
          ),
        ],
      ),
    );
  }
}
