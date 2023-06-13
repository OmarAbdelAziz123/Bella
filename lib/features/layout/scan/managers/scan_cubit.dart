import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:bella/features/layout/my_brands/managers/my_brands_cubit.dart';
import 'package:bella/features/layout/scan/datat/check_model.dart';
import 'package:bella/features/layout/scan/presentation/terms_and_conditions_view_in_scan.dart';
import 'package:bella/features/layout/scan/presentation/widgets/terms_and_conditions_view_in_scan_body.dart';
import 'package:bloc/bloc.dart';
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

  bool? hasJoined;

  CheckModel checkModel = CheckModel();

  Future<void> getScanFunction(BuildContext context) async {
    emit(ScanLoadingState());
    await dioHelper
        .getData(
            endPoint:
                '/api/v1/companies/has-joined/${MyCache.getString(key: CacheKeys.user_Id)}/${MyCache.getString(key: CacheKeys.comp_id)}')
        // '/api/v1/companies/has-joined/${MyCache.getString(key: CacheKeys.user_Id)}/${MyCache.getString(key: CacheKeys.comp_id)}')
        .then((response) {
      print(response.data);
      // hasJoined = response.data['has_joined'];
      if (response.data['has_joined'] == true) {
        /// Success
      }
      else if (response.data['has_joined'] == false) {
        /// Error
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => TermsAndConditionsViewInScan(),
        //   ),
        // );
        ///
        BlocProvider.of<MyBrandsCubit>(context).getTermsAndConditions();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TermsAndConditionsViewInScanBody(),
          ),
        );      }
      emit(ScanSuccessState());
    }).catchError((error) {
      print(error);
      emit(ScanErrorState());
    });
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      // if (!mounted) return;

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
      // "user_id": "517644bf-faf4-4568-8305-8ae77b07ebfc"
    }).then((response) {
      print(response.data);
      emit(PostJoinCompanySuccessState());
    }).catchError((error) {
      print(error);
      emit(PostJoinCompanyErrorState());
    });
  }
}
