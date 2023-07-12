import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class bulidSliverAppBar extends StatelessWidget {
  bulidSliverAppBar({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 1,
      expandedHeight: 100,
      stretch: true,
      pinned: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        //centerTitle: true,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SearchBarWidget(hintText: 'Search product or store'),
        ),

      ),

    );
  }
}