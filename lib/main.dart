// ignore_for_file: unnecessary_type_check
import 'dart:async';
import 'package:bella/bella_app/bella_app.dart';
import 'package:bella/bloc_observer.dart';
import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/utils/styles/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: AppColors.black2Color,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  /// To Get IP Address
  Timer.periodic(const Duration(seconds: 5), (timer) async {
    try {
      for (var interface in await NetworkInterface.list()) {
        if (!interface.name.contains('lo')) {
          for (var address in interface.addresses) {
            if (address is InternetAddress && !address.isLinkLocal) {
              MyCache.putString(key: CacheKeys.ipAddress, value: address.address);
              //   print('IP address: ${MyCache.getString(key: CacheKeys.ipAddress)}');
              return;
            }
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting IP address: $e');
      }
    }
  });
  await MyCache.init();
  Bloc.observer = MyBlocObserver();
  runApp(const BellaApp());
}