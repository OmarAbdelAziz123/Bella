// import 'package:bella/features/layout/home/managers/home_cubit.dart';
// import 'package:bella/features/layout/wish_list/presentation/widgets/custom_wish_list_when_empty.dart';
// import 'package:bella/features/layout/wish_list/presentation/widgets/lists_view_body.dart';
// import 'package:bella/utils/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class WishListView extends StatelessWidget {
//   const WishListView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//       HomeCubit()
//         ..getWishList(),
//       child: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//
//           return Scaffold(
//             backgroundColor: AppColors.bgColor,
//             appBar: AppBar(
//               title: BlocBuilder<HomeCubit, HomeState>(
//                 builder: (context, state) {
//                   print('test ${context.watch<HomeCubit>().wishListModel.length}');
//                   var cubit = BlocProvider.of<HomeCubit>(context);
//
//                   return Text(cubit.wishListModel.length.toString());
//                 },
//               ),
//             ),
//             // body: state is GetWishListLoadingState
//             //     ? const SafeArea(
//             //         child: Center(
//             //           child: CircularProgressIndicator(
//             //             color: AppColors.primaryColor,
//             //           ),
//             //         ),
//             //       )
//             //     : cubit.wishListModel.isEmpty
//             //         ? const CustomWishListWhenEmpty()
//             //         : const SafeArea(
//             //             child: WishListViewBody(),
//             //           ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:another_flushbar/flushbar.dart';
import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
import 'package:bella/features/layout/wish_list/managers/wish_list_cubit/wish_list_cubit.dart';
import 'package:bella/features/layout/wish_list/presentation/widgets/custom_wish_list_when_empty.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/constants/app_fonts.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishlistView extends StatefulWidget {
  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  // final Map<String, List<WishlistItem>> groupedByCompany = {};

  double total = 0;

  @override
  void initState() {
    // for (var item in BlocProvider.of<HomeCubit>(context).wishListModel) {
    //   String key = item.companyDisplayName ?? '';
    //   if (groupedByCompany.containsKey(key)) {
    //     groupedByCompany[key]!.add(item);
    //   } else {
    //     groupedByCompany[key] = [item];
    //   }
    // }
    // total = BlocProvider.of<HomeCubit>(context)
    //     .wishListModel
    //     .map((item) => item.salePrice)
    //     .reduce((a, b) => a + b);
    //
    // print('Total is $total');
    // print('IN Success Added');
    // BlocProvider.of<HomeCubit>(context).getWishList();
    // print('IN Success Added');
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: BlocBuilder<WishListCubit, WishListState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<WishListCubit>(context);
          return state is WishListListLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : cubit.wishListModel.isEmpty
                  ? const CustomWishListWhenEmpty()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, top: 80.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(height: 80.h),
                                  Text(
                                    'Wishlist',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      height: 1.h,
                                      fontSize: 30.sp,
                                      color: AppColors.black3Color,
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                  SearchBarWidget(
                                    hintText: 'Search',
                                    suffixIcon: Container(
                                      padding: EdgeInsets.only(
                                        right: 6.w,
                                        left: 11.w,
                                        top: 13.h,
                                        bottom: 13.h,
                                      ),
                                      child: SvgPicture.asset(
                                        AppAssets.icon_insearch,
                                        // color: AppColors.,
                                      ),
                                    ),
                                  ),
                                  ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                cubit.wishListModel[index]
                                                    .companyDisplayName!,
                                                style: AppFonts.productName,
                                              ),
                                              Text(
                                                'Save: ${cubit.wishListModel[index].sum} kr',
                                                style: AppFonts.productName
                                                    .copyWith(
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 16.h),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: cubit
                                                .wishListModel[index]
                                                .products!
                                                .length,
                                            itemBuilder: (context, index2) {
                                              return Container(
                                                height: 70.h,
                                                margin: EdgeInsets.only(
                                                  bottom: 12.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    15.r,
                                                  ),
                                                ),
                                                // child: ListTile(
                                                //   leading: Image.network(
                                                //     cubit
                                                //         .wishListModel[index]
                                                //         .products![index2]
                                                //         .productImageLink!,
                                                //     height: 59.h,
                                                //     width: 59.w,
                                                //   ),
                                                //   title: Text(
                                                //     cubit.wishListModel[index]
                                                //         .companyDisplayName!,
                                                //     style:
                                                //         AppFonts.bodyLargeBold,
                                                //   ),
                                                //   subtitle: Text(
                                                //     cubit
                                                //         .wishListModel[index]
                                                //         .products![index2]
                                                //         .productTitle!,
                                                //     style: AppFonts.bodyDefault
                                                //         .copyWith(
                                                //       color: AppColors
                                                //           .grey11Color
                                                //           .withOpacity(0.60),
                                                //     ),
                                                //   ),
                                                //   trailing: GestureDetector(
                                                //     onTap: () async {
                                                //       Flushbar(
                                                //         message:
                                                //             'Item removed everywhere',
                                                //         messageSize: 16.sp,
                                                //         messageColor: AppColors
                                                //             .blackColor,
                                                //         borderRadius:
                                                //             BorderRadius
                                                //                 .circular(
                                                //           12.r,
                                                //         ),
                                                //         duration:
                                                //             const Duration(
                                                //                 seconds: 3),
                                                //         margin: EdgeInsets.only(
                                                //           bottom: 16.h,
                                                //           left: 15.w,
                                                //           right: 15.w,
                                                //         ),
                                                //         isDismissible: false,
                                                //         animationDuration:
                                                //             const Duration(
                                                //                 milliseconds:
                                                //                     300),
                                                //         icon: Icon(
                                                //           Icons
                                                //               .check_circle_outline,
                                                //           color: Colors.black,
                                                //           size: 22.sp,
                                                //         ),
                                                //         shouldIconPulse: false,
                                                //         backgroundColor:
                                                //             const Color(
                                                //                 0xff88fea5),
                                                //         boxShadows: const [
                                                //           BoxShadow(
                                                //             color:
                                                //                 Colors.white38,
                                                //             offset:
                                                //                 const Offset(
                                                //                     0.0, 2.0),
                                                //             blurRadius: 3.0,
                                                //           ),
                                                //         ],
                                                //         mainButton: Text(
                                                //           'Undo',
                                                //           style:
                                                //               GoogleFonts.inter(
                                                //             decoration:
                                                //                 TextDecoration
                                                //                     .underline,
                                                //             color: AppColors
                                                //                 .blackColor,
                                                //             fontWeight:
                                                //                 FontWeight.w600,
                                                //             fontSize: 14.sp,
                                                //           ),
                                                //         ),
                                                //       ).show(context);
                                                //       await cubit
                                                //           .deleteOneItemInCart(
                                                //         id: cubit
                                                //             .wishListModel[
                                                //                 index]
                                                //             .products![index2]
                                                //             .id!,
                                                //         companyDisplayName: cubit
                                                //             .wishListModel[
                                                //                 index]
                                                //             .companyDisplayName!,
                                                //       );
                                                //       // cubit.getWishList();
                                                //     },
                                                //     child: Container(
                                                //       width: 81.w,
                                                //       height: 30.h,
                                                //       decoration: BoxDecoration(
                                                //         borderRadius:
                                                //             BorderRadius
                                                //                 .circular(
                                                //                     300.r),
                                                //         border: Border.all(
                                                //           color: AppColors
                                                //               .grey12Color,
                                                //           width: 1.w,
                                                //         ),
                                                //       ),
                                                //       child: Center(
                                                //         child: Row(
                                                //           mainAxisAlignment:
                                                //               MainAxisAlignment
                                                //                   .spaceEvenly,
                                                //           children: [
                                                //             Image.asset(
                                                //               AppAssets.minuse,
                                                //               color: AppColors
                                                //                   .black3Color,
                                                //             ),
                                                //             Text(
                                                //               'Remove',
                                                //               style: GoogleFonts
                                                //                   .inter(
                                                //                 color: AppColors
                                                //                     .black3Color,
                                                //                 height: 1.h,
                                                //                 fontSize: 12.sp,
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .w600,
                                                //               ),
                                                //             ),
                                                //           ],
                                                //         ),
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                                child: Container(
                                                  width: 353.w,
                                                  height: 70.h,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.r),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 6.h,
                                                          bottom: 5.h,
                                                          left: 8.w,
                                                          right: 14.w,
                                                        ),
                                                        child: Image.network(
                                                          cubit
                                                              .wishListModel[
                                                                  index]
                                                              .products![index2]
                                                              .productImageLink!,
                                                          height: 59.h,
                                                          width: 59.w,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 160.w,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              cubit
                                                                  .wishListModel[
                                                                      index]
                                                                  .products![index2].productTitle!,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: AppFonts
                                                                  .bodyLargeBold
                                                                  .copyWith(
                                                                height: 1.h,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 12.h),
                                                            Text(
                                                              cubit
                                                                  .wishListModel[
                                                                      index]
                                                                  .products![
                                                                      index2]
                                                                  .productTitle!,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: AppFonts
                                                                  .bodyDefault
                                                                  .copyWith(
                                                                color: AppColors
                                                                    .grey11Color
                                                                    .withOpacity(
                                                                        0.60),
                                                                height: 1.h,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Padding(
                                                        padding: EdgeInsets.only(right: 7.w),
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            Flushbar(
                                                              message:
                                                                  'Item removed everywhere',
                                                              messageSize: 16.sp,
                                                              messageColor:
                                                                  AppColors
                                                                      .blackColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                12.r,
                                                              ),
                                                              duration:
                                                                  const Duration(
                                                                      seconds: 3),
                                                              margin:
                                                                  EdgeInsets.only(
                                                                bottom: 16.h,
                                                                left: 15.w,
                                                                right: 15.w,
                                                              ),
                                                              isDismissible:
                                                                  false,
                                                              animationDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          300),
                                                              icon: Icon(
                                                                Icons
                                                                    .check_circle_outline,
                                                                color:
                                                                    Colors.black,
                                                                size: 22.sp,
                                                              ),
                                                              shouldIconPulse:
                                                                  false,
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xff88fea5),
                                                              boxShadows: const [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .white38,
                                                                  offset:
                                                                      const Offset(
                                                                          0.0,
                                                                          2.0),
                                                                  blurRadius: 3.0,
                                                                ),
                                                              ],
                                                            ).show(context);
                                                            await cubit
                                                                .deleteOneItemInCart(
                                                              id: cubit
                                                                  .wishListModel[
                                                                      index]
                                                                  .products![
                                                                      index2]
                                                                  .id!,
                                                              companyDisplayName: cubit
                                                                  .wishListModel[
                                                                      index]
                                                                  .companyDisplayName!,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 81.w,
                                                            height: 30.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          300.r),
                                                              border: Border.all(
                                                                color: AppColors
                                                                    .grey12Color,
                                                                width: 1.4.w,
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  SvgPicture.asset(
                                                                    AppAssets.minuse,
                                                                    color: AppColors
                                                                        .black3Color,
                                                                  ),
                                                                  Text(
                                                                    'Remove',
                                                                    style: AppFonts
                                                                        .bodySmallBold,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 30.h);
                                    },
                                    itemCount: cubit.wishListModel.length,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 64.h),
                          height: 42.h,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.whiteColor.withOpacity(0.18),
                                offset: const Offset(0, 0),
                                spreadRadius: 0,
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total save',
                                    style: AppFonts.bodyLargeBold.copyWith(
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 300.w,
                                    ),
                                    child: Text(
                                      '${cubit.getTotal()} ${cubit.wishListModel[0].products![0].currency}',
                                      overflow: TextOverflow.ellipsis,
                                      style: AppFonts.bodyLargeBold.copyWith(
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
        },
      ),
    );
  }
}

/// Custom Container In Cart View
class CustomContainerInCartView extends StatelessWidget {
  String productTitle;
  String productImageLink;
  void Function()? onTap;

  CustomContainerInCartView({
    Key? key,
    required this.productTitle,
    required this.productImageLink,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353.w,
      height: 70.h,
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 8.w,
              bottom: 5.h,
              top: 6.h,
            ),
            child: Image.network(
              productImageLink,
              width: 59.w,
              height: 59.h,
            ),
          ),
          SizedBox(width: 14.w),
          SizedBox(
            width: 115.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productTitle,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    color: AppColors.black3Color,
                    height: 1.h,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Up to 50% rabatt',
                  style: GoogleFonts.inter(
                    color: AppColors.grey11Color.withOpacity(0.6),
                    height: 1.h,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 69.w),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 81.w,
              height: 30.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(300.r),
                border: Border.all(
                  color: AppColors.grey12Color,
                  width: 1.w,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      AppAssets.minuse,
                      color: AppColors.black3Color,
                    ),
                    Text(
                      'Remove',
                      style: GoogleFonts.inter(
                        color: AppColors.black3Color,
                        height: 1.h,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom Row Show Company Name
class CustomRowShowCompanyName extends StatelessWidget {
  String nameOfCompany;
  dynamic savingAmount;

  CustomRowShowCompanyName({
    Key? key,
    required this.nameOfCompany,
    required this.savingAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          nameOfCompany,
          style: GoogleFonts.inter(
            color: AppColors.black3Color,
            height: 1.h,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Save: $savingAmount kr',
          style: GoogleFonts.inter(
            color: AppColors.blackColor,
            height: 1.h,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class WishListCompanyComponent extends StatelessWidget {
  String nameOfCompany;

  // List<Wishlist2> list;
  void Function()? onTap;

  WishListCompanyComponent({
    Key? key,
    required this.nameOfCompany,
    // required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Widget> _buildChildrenList() {
    //   List<Widget> children = [];
    //   double total = 0;

    // total = list.map((item) => item.salePrice).reduce((a, b) => a + b);

    //   children.add(
    //     CustomRowShowCompanyName(
    //       nameOfCompany: nameOfCompany,
    //       savingAmount: total,
    //     ),
    //   );
    //   children.add(SizedBox(height: 16.h));
    //   for (var product in list) {
    //     children.add(
    //       BlocBuilder<HomeCubit, HomeState>(
    //         builder: (context, state) {
    //           var cubit = BlocProvider.of<HomeCubit>(context);
    //           return CustomContainerInCartView(
    //             onTap: () async {
    //               cubit.deleteOneItemInCart(id: product.id);
    //               // await Future.delayed(Duration(seconds: 3));
    //               // Provider.of<WishlistProvider>(context, listen: false)
    //               //     .fetchWishlistItems();
    //             },
    //             productTitle: product.products![product].productTitle!,
    //             productImageLink: product.productImageLink,
    //           );
    //         },
    //       ),
    //     );
    //   }
    //   return children;
    // }

    return Column(
        // children: ,
        );
  }
}
