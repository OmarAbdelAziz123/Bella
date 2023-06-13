import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({
    Key? key,
    required this.onPageChanged,
    required this.pageController,
  }) : super(key: key);
  final PageController pageController;
  final void Function(int)? onPageChanged;

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final GlobalKey<CarouselSliderState> _sliderKey = GlobalKey();

  List<String> images = [
    AppAssets.banner1,
    AppAssets.banner1,
    AppAssets.banner1,
    AppAssets.banner1,
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 136.h,
          width: double.infinity,
          child: CarouselSlider(
            key: _sliderKey,
            items: images.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(imageUrl);
                },
              );
            }).toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              viewportFraction: 0.8,
            ),
          ),
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              width: 7.w,
              height: 7.h,
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index
                    ? AppColors.black3Color
                    : AppColors.grey3Color,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
