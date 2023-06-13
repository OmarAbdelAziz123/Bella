import 'package:bella/config/app_routes.dart';
import 'package:bella/features/auth/managers/auth_cubit.dart';
import 'package:bella/features/layout/home/managers/home_cubit.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/scan/managers/scan_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizer/sizer.dart';

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
            BlocProvider(create: (context) => AuthCubit()),
            BlocProvider(create: (context) => ScanCubit()),
            BlocProvider(create: (context) => HomeCubit()..getRecommended()..getAllCompanies()),
            BlocProvider(create: (context) => MyBrandsCubit()..joinedFunction()..notJoinedFunction()),
          ],
          child: MaterialApp(
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
