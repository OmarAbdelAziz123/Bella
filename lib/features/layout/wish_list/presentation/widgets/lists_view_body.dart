// // ignore_for_file: depend_on_referenced_packages
// import 'package:bella/features/layout/home/data/models/get_wish_list_model.dart';
// import 'package:bella/features/layout/home/managers/home_cubit.dart';
// import 'package:bella/features/layout/home/presentation/widgets/widgets/search_bar_widget.dart';
// import 'package:bella/features/layout/wish_list/managers/wish_list_cubit/wish_list_cubit.dart';
// import 'package:bella/features/layout/wish_list/presentation/widgets/custom_wish_list_when_empty.dart';
// import 'package:bella/utils/constants/app_assets.dart';
// import 'package:bella/utils/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class WishListViewBody extends StatefulWidget {
//   const WishListViewBody({Key? key}) : super(key: key);
//
//   @override
//   State<WishListViewBody> createState() => _WishListViewBodyState();
// }
//
// class _WishListViewBodyState extends State<WishListViewBody> {
//   final Map<String, List<Wishlist>> groupedByCompany = {};
//
//   double total = 0;
//
//   @override
//   void initState() {
//     // BlocProvider.of<HomeCubit>(context).getWishList();
//
//     // if (BlocProvider.of<HomeCubit>(context).wishListModel.isNotEmpty) {
//     //   for (var item in BlocProvider.of<HomeCubit>(context).wishListModel) {
//     //     String key = '${item.companyDisplayName}';
//     //     if (groupedByCompany.containsKey(key)) {
//     //       groupedByCompany[key]!.add(item);
//     //     } else {
//     //       groupedByCompany[key] = [item];
//     //     }
//     //   }
//     //   total = BlocProvider.of<HomeCubit>(context)
//     //       .wishListModel
//     //       .map((item) => item.salePrice)
//     //       .reduce((a, b) => a + b);
//     //   print('Total is $total');
//     //   // BlocProvider.of<HomeCubit>(context).getWishList();
//     // }
//
//     // print(
//     //     'Length of Wish List is = ${BlocProvider.of<HomeCubit>(context).wishListModel.length}');
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeCubit()..getWishList(),
//       child: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           var wishListCubit = BlocProvider.of<HomeCubit>(context);
//           return state is GetWishListLoadingState
//               ? const Scaffold(
//                   body: Center(
//                     child: CircularProgressIndicator(
//                       color: AppColors.primaryColor,
//                     ),
//                   ),
//                 )
//               : wishListCubit.wishListModel.isEmpty
//                   ? const CustomWishListWhenEmpty()
//                   : Scaffold(
//                       body: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: SingleChildScrollView(
//                               child: Padding(
//                                 padding:
//                                     EdgeInsets.only(left: 20.w, right: 20.w),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SizedBox(height: 38.h),
//                                     Text(
//                                       'Wishlist',
//                                       style: GoogleFonts.inter(
//                                         fontWeight: FontWeight.w600,
//                                         height: 1.h,
//                                         fontSize: 30.sp,
//                                         color: AppColors.black3Color,
//                                       ),
//                                     ),
//                                     SizedBox(height: 30.h),
//                                     SearchBarWidget(
//                                       hintText: 'Search',
//                                       suffixIcon: Container(
//                                         padding: EdgeInsets.only(
//                                           right: 6.w,
//                                           left: 11.w,
//                                           top: 13.h,
//                                           bottom: 13.h,
//                                         ),
//                                         child: SvgPicture.asset(
//                                           AppAssets.icon_insearch,
//                                           // color: AppColors.,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(height: 30.h),
//                                     ListView.separated(
//                                       physics:
//                                           const NeverScrollableScrollPhysics(),
//                                       shrinkWrap: true,
//                                       itemBuilder: (context, index) {
//                                         print(wishListCubit);
//
//                                         List<Widget> children = [];
//
//                                         groupedByCompany.forEach((key, value) {
//                                           children.add(
//                                             WishListCompanyComponent(
//                                               nameOfCompany: key,
//                                               list: value,
//                                             ),
//                                           );
//                                         });
//
//                                         return children[index];
//                                       },
//                                       separatorBuilder: (context, index) {
//                                         return SizedBox(height: 30.h);
//                                       },
//                                       itemCount: groupedByCompany.length,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 62.h,
//                             decoration: BoxDecoration(
//                               color: AppColors.whiteColor,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: AppColors.whiteColor.withOpacity(0.18),
//                                   offset: const Offset(0, 0),
//                                   spreadRadius: 0,
//                                   blurRadius: 7,
//                                 ),
//                               ],
//                             ),
//                             child: Center(
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Total save',
//                                       style: GoogleFonts.inter(
//                                         color: AppColors.blackColor,
//                                         height: 1.h,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 18.sp,
//                                       ),
//                                     ),
//                                     Container(
//                                       // width: 100.w,
//                                       constraints: BoxConstraints(
//                                         maxWidth: 300.w,
//                                       ),
//                                       child: Text(
//                                         '$total kr',
//                                         overflow: TextOverflow.ellipsis,
//                                         style: GoogleFonts.inter(
//                                           color: AppColors.error2Color,
//                                           height: 1.h,
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 26.sp,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//         },
//       ),
//     );
//   }
// }
//
// /// Custom Container In Cart View
// class CustomContainerInCartView extends StatelessWidget {
//   String productTitle;
//   String productImageLink;
//   void Function()? onTap;
//
//   CustomContainerInCartView({
//     Key? key,
//     required this.productTitle,
//     required this.productImageLink,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 353.w,
//       height: 70.h,
//       margin: EdgeInsets.only(bottom: 12.h),
//       decoration: BoxDecoration(
//         color: AppColors.whiteColor,
//         borderRadius: BorderRadius.circular(15.r),
//       ),
//       child: Row(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//               left: 8.w,
//               bottom: 5.h,
//               top: 6.h,
//             ),
//             child: Image.network(
//               productImageLink,
//               width: 59.w,
//               height: 59.h,
//             ),
//           ),
//           SizedBox(width: 14.w),
//           SizedBox(
//             width: 115.w,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   productTitle,
//                   overflow: TextOverflow.ellipsis,
//                   style: GoogleFonts.inter(
//                     color: AppColors.black3Color,
//                     height: 1.h,
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 12.h),
//                 Text(
//                   'Up to 50% rabatt',
//                   style: GoogleFonts.inter(
//                     color: AppColors.grey11Color.withOpacity(0.6),
//                     height: 1.h,
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: 69.w),
//           GestureDetector(
//             onTap: onTap,
//             child: Container(
//               width: 81.w,
//               height: 30.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(300.r),
//                 border: Border.all(
//                   color: AppColors.grey12Color,
//                   width: 1.w,
//                 ),
//               ),
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Image.asset(
//                       AppAssets.minuse,
//                       color: AppColors.black3Color,
//                     ),
//                     Text(
//                       'Remove',
//                       style: GoogleFonts.inter(
//                         color: AppColors.black3Color,
//                         height: 1.h,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// Custom Row Show Company Name
// class CustomRowShowCompanyName extends StatelessWidget {
//   String nameOfCompany;
//   dynamic savingAmount;
//
//   CustomRowShowCompanyName({
//     Key? key,
//     required this.nameOfCompany,
//     required this.savingAmount,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           nameOfCompany,
//           style: GoogleFonts.inter(
//             color: AppColors.black3Color,
//             height: 1.h,
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         Text(
//           'Save: $savingAmount kr',
//           style: GoogleFonts.inter(
//             color: AppColors.blackColor,
//             height: 1.h,
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class WishListCompanyComponent extends StatelessWidget {
//   String nameOfCompany;
//   List<Wishlist> list;
//   void Function()? onTap;
//
//   WishListCompanyComponent({
//     Key? key,
//     required this.nameOfCompany,
//     required this.list,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _buildChildrenList() {
//       List<Widget> children = [];
//       double total = 0;
//
//       total = list.map((item) => item.salePrice).reduce((a, b) => a + b);
//
//       children.add(
//         CustomRowShowCompanyName(
//           nameOfCompany: nameOfCompany,
//           savingAmount: total,
//         ),
//       );
//       children.add(SizedBox(height: 16.h));
//       for (var product in list) {
//         children.add(BlocConsumer<HomeCubit, HomeState>(
//           listener: (context, state) {
//             if (state is DeleteOneItemFromCartSuccessState) {
//               print('Refresh');
//               BlocProvider.of<HomeCubit>(context).getWishList();
//               print('Refresh');
//             }
//           },
//           builder: (context, state) {
//             var cubit = BlocProvider.of<HomeCubit>(context);
//             return CustomContainerInCartView(
//               onTap: () {
//                 cubit.deleteOneItemInCart(id: product.id!);
//               },
//               productTitle: product.productTitle!,
//               productImageLink: product.productImageLink!,
//             );
//           },
//         ));
//       }
//       return children;
//     }
//
//     return Column(
//       children: _buildChildrenList(),
//     );
//   }
// }
