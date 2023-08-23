import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/layout/home/home_navigation_functions/home_navigation_functions.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_member_only.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/custom_recommended_products.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/verification_an_email_widget.dart';
import 'package:bella/features/layout/wish_list/managers/wish_list_cubit/wish_list_cubit.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List items = [];
  bool loading = false, allLoaded = false;

  final ScrollController scrollController = ScrollController();

  mockFetch() async {
    if (allLoaded) {
      return;
    }
    setState(() {
      loading = true;
    });
    // await BlocProvider.of<HomeCubit>(context).getRecommendedProducts();
    // items =
    await Future.delayed(const Duration(microseconds: 500));
    List newData = items.length > 60
        ? []
        : List.generate(20, (index) => 'List Item ${index + items.length}');
    if (newData.isNotEmpty) {
      items.addAll(newData);
    }
    setState(() {
      loading = false;
      allLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    mockFetch();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !loading) {
        mockFetch();
      } else {}
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: BlocBuilder<WishListCubit, WishListState>(
        builder: (context, state) {
          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
              return SafeArea(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: AppColors.blackColor,
                                  )),
                            ],
                          ),
                          // Column(
                          //   children: [
                          //     Padding(
                          //       padding: EdgeInsets.only(
                          //         top: 20.h,
                          //         bottom: 25.h,
                          //         right: 20.w,
                          //         left: 20.w,
                          //       ),
                          //       child: Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           SvgPicture.asset(AppAssets.BellaIcon),
                          //           GestureDetector(
                          //             onTap: () {
                          //               HomeNavigationClass
                          //                   .navigateToProfileScreen(context);
                          //             },
                          //             child: SizedBox(
                          //               width: 30.h,
                          //               height: 26.h,
                          //               child: SvgPicture.asset(
                          //                 AppAssets.userIcon,
                          //                 height: 26.h,
                          //                 width: 26.w,
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     const VerificationAnEmailWidget(),
                          //     Container(
                          //       height: 50.h,
                          //       width: 353.w,
                          //       decoration: BoxDecoration(
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: AppColors.blackColor
                          //                 .withOpacity(0.15),
                          //             spreadRadius: 0,
                          //             blurRadius: 14,
                          //             offset: const Offset(0, 4),
                          //           ),
                          //         ],
                          //       ),
                          //       child: SearchBarWidget(
                          //         hintText: 'Search',
                          //       ),
                          //     ),
                          //     SizedBox(height: 20.h),
                          //     SizedBox(
                          //       height: 35.h,
                          //       child: NotificationListener<
                          //           OverscrollIndicatorNotification>(
                          //         onNotification: (overscroll) {
                          //           overscroll.disallowIndicator();
                          //           return false;
                          //         },
                          //         child: ListView.builder(
                          //           padding: EdgeInsets.only(left: 13.w),
                          //           scrollDirection: Axis.horizontal,
                          //           itemCount: 6,
                          //           itemBuilder: (context, index) {
                          //             return Container(
                          //               height: 35.h,
                          //               padding: EdgeInsets.symmetric(
                          //                 horizontal: 13.w,
                          //               ),
                          //               margin: EdgeInsets.only(
                          //                 right: index == 0 ? 8.w : 8.w,
                          //               ),
                          //               decoration: BoxDecoration(
                          //                 color: AppColors.bgColor,
                          //                 border: Border.all(
                          //                   width: 0.65.w,
                          //                   color: index == 0
                          //                       ? AppColors.bgColor
                          //                       : const Color(0xff444B67)
                          //                           .withOpacity(0.6),
                          //                 ),
                          //                 borderRadius:
                          //                     BorderRadius.circular(10.r),
                          //               ),
                          //               child: Center(
                          //                 child: AppConstants.texts[index],
                          //               ),
                          //             );
                          //           },
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(height: 20.h),
                          //   ],
                          // ),
                          // LayoutBuilder(
                          //   builder: (p0, p1) {
                          //     if (items.isNotEmpty) {
                          //       return ListView.separated(
                          //         physics: const NeverScrollableScrollPhysics(),
                          //         itemCount: items.length + (allLoaded ? 1 : 0),
                          //         separatorBuilder: (context, index) {
                          //           return const Divider(
                          //             height: 1,
                          //           );
                          //         },
                          //         shrinkWrap: true,
                          //         itemBuilder: (context, index) {
                          //           if (index < items.length) {
                          //             return ListTile(
                          //               title: Text(items[index]),
                          //             );
                          //           } else {
                          //             return SizedBox(
                          //               width: p1.maxWidth,
                          //               height: 50,
                          //               child: const Center(
                          //                 child: Text('Nothing more to load'),
                          //               ),
                          //             );
                          //           }
                          //         },
                          //       );
                          //     } else {
                          //       return const SizedBox(
                          //         child: Center(
                          //           child: CircularProgressIndicator(
                          //             color: AppColors.primaryColor,
                          //           ),
                          //         ),
                          //       );
                          //     }
                          //   },
                          // )
                          LayoutBuilder(
                            builder: (p0, p1) {
                              if (items.isNotEmpty) {
                                return ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: items.length + (allLoaded ? 1 : 0),
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      height: 1,
                                    );
                                  },
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    if (index < items.length) {
                                      return ListTile(
                                        title: Text(items[index]),
                                      );
                                    } else {
                                      return SizedBox(
                                        width: p1.maxWidth,
                                        height: 50,
                                        child: const Center(
                                          child: Text('Nothing more to load'),
                                        ),
                                      );
                                    }
                                  },
                                );
                              } else {
                                return const SizedBox(
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    loading
                        ? const Positioned(
                            left: 200,
                            bottom: 0,
                            child: SizedBox(
                              height: 80,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
