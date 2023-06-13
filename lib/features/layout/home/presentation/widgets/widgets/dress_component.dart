import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Dressign extends StatelessWidget {
  final String name, precentage, img;

  const Dressign({
    Key? key,
    required this.name,
    required this.precentage,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.4,
      height: size.height / 3,
      padding: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black2Color.withOpacity(0.1),
            blurRadius: 0.1,
            spreadRadius: 0.2,
            offset: const Offset(0, 5),
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: Image.asset(img),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.orangeColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          precentage,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.darkerGrotesque(
                            height: 1,
                            color: Colors.white,

                            fontWeight: FontWeight.w600,
                            fontSize: 13.6.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.darkerGrotesque(
                          height: 0.8,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 14.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
