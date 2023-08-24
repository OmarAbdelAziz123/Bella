import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/home/presentation/home_view.dart';
import 'package:bella/features/layout/home/presentation/widgets/terms_and_conditions.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/my_brands/my_brands_view.dart';
import 'package:bella/features/layout/offers/managers/myoffers_cubit.dart';
import 'package:bella/features/layout/offers/presentation/offers_view.dart';
import 'package:bella/features/layout/scan/managers/scan_cubit.dart';
import 'package:bella/features/layout/scan/presentation/scan_view.dart';
import 'package:bella/features/layout/wish_list/presentation/wish_list.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

int currentIndex = 0;

class LayoutView extends StatefulWidget {

  LayoutView({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

// class _LayoutViewState extends State<LayoutView> {
//   bool isScanFeatureEnabled = false;
//
//   // List<Widget> tabs = [
//   //   const HomeView(),
//   //   MyBrandsView(),
//   //   const ScanView(),
//   //   const OffersView(),
//   //   WishlistView(),
//   // ];
//
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<MyBrandsCubit>(context).joinedFunction();
//     BlocProvider.of<MyBrandsCubit>(context).notJoinedFunction(context);
//     BlocProvider.of<HomeCubit>(context).getAllCompanies();
//   }
//
//   var getResult = 'QR Code Result';
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       backgroundColor: AppColors.bgColor,
//       tabBar: CupertinoTabBar(
//         height: 60.h,
//         onTap: (index) async {
//           if (index == 1 &&
//               Navigator.of(context).canPop() &&
//               ModalRoute.of(context)!.settings.name ==
//                   TermsAndConditions().toString()) {
//             Navigator.of(context).pop();
//           }
//           if (index == 2) {
//             BlocProvider.of<ScanCubit>(context).scanQRCode();
//           }
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         currentIndex: currentIndex,
//         items: [
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(AppAssets.homeIcon),
//             activeIcon: SvgPicture.asset(
//               AppAssets.homeIcon,
//               color: AppColors.primaryColor,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               AppAssets.myBrandIcon,
//               color: AppColors.blackColor,
//             ),
//             activeIcon: SvgPicture.asset(
//               AppAssets.myBrandIcon,
//               color: AppColors.primaryColor,
//             ),
//             label: 'Brands',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(AppAssets.scanIcon),
//             activeIcon: SvgPicture.asset(
//               AppAssets.scanIcon,
//               color: AppColors.primaryColor,
//             ),
//             label: 'Scan',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               AppAssets.offersIcon,
//               color: AppColors.black2Color,
//             ),
//             activeIcon: SvgPicture.asset(
//               AppAssets.offersIcon,
//               color: AppColors.primaryColor,
//             ),
//             label: 'My Offers',
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               AppAssets.listIcon,
//               color: AppColors.black2Color,
//             ),
//             activeIcon: SvgPicture.asset(
//               AppAssets.listIcon,
//               color: AppColors.primaryColor,
//             ),
//             label: 'Wishlist',
//           ),
//         ],
//         activeColor: AppColors.primaryColor,
//         inactiveColor: AppColors.black2Color,
//       ),
//       tabBuilder: (context, index) {
//         switch (index) {
//           case 0:
//             return CupertinoTabView(
//               builder: (context) => const HomeView(),
//             );
//           case 1:
//             return CupertinoTabView(
//               builder: (context) => MyBrandsView(),
//             );
//           case 2:
//             return CupertinoTabView(
//               builder: (context) => const ScanView(),
//             );
//           case 3:
//             return CupertinoTabView(
//               builder: (context) => const OffersView(),
//             );
//           case 4:
//             return CupertinoTabView(
//               builder: (context) => WishlistView(),
//             );
//           default:
//             return CupertinoTabView(
//               builder: (context) => const HomeView(),
//             );
//         }
//       },
//     );
//   }
//
//   void scanQRCode() async {
//     try {
//       final qrCode = await FlutterBarcodeScanner.scanBarcode(
//           '#8367F4', 'Cancel', true, ScanMode.QR);
//       setState(() {
//         getResult = qrCode;
//       });
//       if (kDebugMode) {
//         print("QRCode_Result:--");
//         print(qrCode);
//       }
//     } on PlatformException {
//       getResult = 'Failed to scan QR Code.';
//     }
//   }
// }

class _LayoutViewState extends State<LayoutView> {
  bool isScanFeatureEnabled = false;

  List<Widget> tabs = [
    const HomeView(),
    // const Test(),
    MyBrandsView(),
    const ScanView(),
    const OffersView(),
    const WishlistView(),
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MyBrandsCubit>(context).joinedFunction();
    BlocProvider.of<MyBrandsCubit>(context).notJoinedFunction(context);
    BlocProvider.of<HomeCubit>(context).getAllCompanies();
    /// Call My Offers
    BlocProvider.of<MyoffersCubit>(context).getAllPersonalOffersByUsers();
  }

  var getResult = 'QR Code Result';

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: AppColors.bgColor,
      tabBar: CupertinoTabBar(
        height: 60.h,
        onTap: (index) async {
          if (index == 1 &&
              Navigator.of(context).canPop() &&
              ModalRoute.of(context)!.settings.name ==
                  TermsAndConditions().toString()) {
            Navigator.of(context).pop();
          }
          if (index == 2 && isScanFeatureEnabled) { // Only allow scanning if feature is enabled
            BlocProvider.of<ScanCubit>(context).scanQRCode();
          }
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.homeIcon),
            activeIcon: SvgPicture.asset(
              AppAssets.homeIcon,
              color: AppColors.primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.myBrandIcon,
              color: AppColors.blackColor,
            ),
            activeIcon: SvgPicture.asset(
              AppAssets.myBrandIcon,
              color: AppColors.primaryColor,
            ),
            label: 'Brands',
          ),
          if (isScanFeatureEnabled) // Only show Scan screen if enabled
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.scanIcon),
              activeIcon: SvgPicture.asset(
                AppAssets.scanIcon,
                color: AppColors.primaryColor,
              ),
              label: 'Scan',
            ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.offersIcon,
              color: AppColors.black2Color,
            ),
            activeIcon: SvgPicture.asset(
              AppAssets.offersIcon,
              color: AppColors.primaryColor,
            ),
            label: 'My Offers',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.listIcon,
              color: AppColors.black2Color,
            ),
            activeIcon: SvgPicture.asset(
              AppAssets.listIcon,
              color: AppColors.primaryColor,
            ),
            label: 'Wishlist',
          ),
        ],
        activeColor: AppColors.primaryColor,
        inactiveColor: AppColors.black2Color,
      ),
      tabBuilder: (context, index) {
        List<Widget> filteredTabs = isScanFeatureEnabled
            ? tabs
            : tabs.where((tab) => tab.runtimeType != ScanView).toList();

        if (filteredTabs.length <= index) {
          return const SizedBox();
        }

        return CupertinoTabView(
          builder: (context) => filteredTabs[index],
        );
      },
    );
  }
}