import 'package:bella/features/layout/home/presentation/home_view.dart';
import 'package:bella/features/layout/lists_view/presentation/lists_view.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/my_brands/presentation/my_brands/my_brands_view.dart';
import 'package:bella/features/layout/offers/presentation/offers_view.dart';
import 'package:bella/features/layout/scan/managers/scan_cubit.dart';
import 'package:bella/features/layout/scan/presentation/scan_view.dart';
import 'package:bella/utils/constants/app_assets.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  List<Widget> tabs = [
    const HomeView(),
    const MyBrandsView(),
    const ScanView(),
    const OffersView(),
    const ListsView(),
  ];

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<MyBrandsCubit>(context).getTermsAndConditions();
  }
  var getResult = 'QR Code Result';

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: AppColors.bgColor,
      tabBar: CupertinoTabBar(
        height: 60.h,
        onTap: (index) {
          if(index == 2) {
            // scanQRCode();
            BlocProvider.of<ScanCubit>(context).scanQRCode();
            // BlocProvider.of<ScanCubit>(context).getScanFunction(context);
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
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => const HomeView(),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => const MyBrandsView(),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => const ScanView(),
            );
          case 3:
            return CupertinoTabView(
              builder: (context) => const OffersView(),
            );
          case 4:
            return CupertinoTabView(
              builder: (context) => const ListsView(),
            );
          default:
            return CupertinoTabView(
              builder: (context) => const HomeView(),
            );
        }
      },
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      // if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }
}


