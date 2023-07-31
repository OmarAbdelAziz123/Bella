import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/presentation/widgets/company_profile_screen.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/widgets/widgets/custom_container_in_my_brands.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarView1 extends StatelessWidget {
  const TabBarView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarWidget(hintText: 'Search brands'),
        SizedBox(height: 18.h),
        Flexible(
          child: BlocConsumer<MyBrandsCubit, MyBrandsState>(
            listener: (context, state) {
              if (state is JoinedErrorState) {
                SnackBar snak =
                const SnackBar(content: Text("Error in Joined"));
                ScaffoldMessenger.of(context).showSnackBar(snak);
              }
            },
            builder: (context, state) {
              var cubit = BlocProvider.of<MyBrandsCubit>(context);

              return cubit.allJoined == null
                  ? Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 144.h),
                  Text(
                    'No brands found yet',
                    style: AppFonts.titleSection.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'All your joined brands will appear here',
                    style: AppFonts.bodyLarge.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              )
                  : NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.allJoined!.companies!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 11,
                    mainAxisSpacing: 11.h,
                  ),
                  itemBuilder: (context, index) {
                    var list = cubit.allJoined!.companies![index];
                    return CustomContainerInMyBrands(
                      onTap: () {
                        MyCache.putString(
                          key: CacheKeys.comp_id,
                          value: cubit.allJoined!.companies![index].id!,
                        );
                        navigateToCompanyProfile(
                            list.logo!, list.displayName!, context);
                      },
                      image: list.logo.toString(),
                      text: list.displayName.toString(),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void navigateToCompanyProfile(
      String logo, String displayName, BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, __, ___) {
          return CompanyProfileScreen(
            display_name: displayName,
            logo: logo,
            initialScreen: 'MyBrands',
            onBack: () {
              Navigator.pop(context);
            },
          );
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}
