import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:bella/features/layout/home/presentation/widgets/terms_and_conditions.dart';
import 'package:bella/features/layout/scan/datat/check_model.dart';
import 'package:bella/features/layout/scan/presentation/final_view_in_scan.dart';
import 'package:bella/features/layout/scan/presentation/scan_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitialState());

  static ScanCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  var getResult = 'QR Code Result';

  int currentIndex = 0;

  bool? hasJoined;

  CheckModel checkModel = CheckModel();

  Future<void> getScanFunction(BuildContext context) async {
    emit(ScanLoadingState());
    await dioHelper
        .getData(
            endPoint:
                '/api/v1/companies/has-joined/${MyCache.getString(key: CacheKeys.user_Id)}/${MyCache.getString(key: CacheKeys.comp_id)}')
        .then((response) {
      print(response.data);
      if (response.data['has_joined'] == true) {
        /// Success
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FinalViewInScan(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScanView(),
                  ),
                );
              },
              hasJoined: response.data['has_joined'],
            ),
          ),
        );
      }
      else if (response.data['has_joined'] == false) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 250),
            pageBuilder: (context, animation, secondaryAnimation) {
              return TermsAndConditions(
                companyId: MyCache.getString(key: CacheKeys.comp_id),
                flow: 'Scan',
                hasJoined: response.data['has_joined'],
                onCancelButtonInFinalScreen: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScanView(),
                    ),
                  );
                },
                initialView: 'Scan', /// todo :
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 250),
                      pageBuilder: (_, __, ___) {
                        return FinalViewInScan(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScanView(),
                              ),
                            );
                          },
                          hasJoined: response.data['has_joined'],
                          // display_name: ,
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
                },
              );
            },
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
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
        print('False in Has Joined');
        emit(ScanSuccessFalseState());
      }
    }).catchError((error) {
      print(error);
      emit(ScanErrorState());
    });
  }

  void scanQRCode() async {
    try {
      const options = ScanOptions(
        useCamera: 0,
        autoEnableFlash: false,
      );
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#8367F4',
        'Cancel',
        false,
        ScanMode.QR,
      );

      getResult = qrCode;
      print("QRCode_Result:--");
      List list = qrCode.split('|');
      print(list[0]);
      MyCache.putString(key: CacheKeys.comp_id, value: list[0]);
      print('**********');
      print(MyCache.getString(key: CacheKeys.comp_id));
      print('**********');
      emit(San2SuccessState());
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
      emit(San2ErrorState());
    }
  }

  Future<void> postJoinCompany() async {
    emit(PostJoinCompanyLoadingState());
    await dioHelper.postData(endPoint: 'api/v1/companies/join', body: {
      "company_id": MyCache.getString(key: CacheKeys.comp_id),
      "user_id": MyCache.getString(key: CacheKeys.user_Id),
    }).then((response) {
      emit(PostJoinCompanySuccessState());
    }).catchError((error) {
      print(error);
      emit(PostJoinCompanyErrorState());
    });
  }
}
