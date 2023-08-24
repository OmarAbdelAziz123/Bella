import 'package:bella/config/app_routes.dart';
import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/offers/managers/myoffers_cubit.dart';
import 'package:bella/features/layout/scan/managers/scan_cubit.dart';
import 'package:bella/features/layout/wish_list/managers/wish_list_cubit/wish_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BellaApp extends StatelessWidget {
  const BellaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthCubit()..readCreditCard()),
            BlocProvider(create: (context) => ScanCubit()),
            BlocProvider(
                create: (context) => HomeCubit()
                  ..getRecommended()
                  ..getRecommendedProducts()
                  ..getCompanyProducts()
                  ..companyProfileFunc()),
            BlocProvider(create: (context) => MyBrandsCubit()),
            BlocProvider(create: (context) => WishListCubit()..getWishList()),
            BlocProvider(
                create: (context) =>
                    MyoffersCubit()..getAllPersonalOffersByUsers()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bella App',
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: 'splash-screen',
          ),
        );
      },
    );
  }
}
