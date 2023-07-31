// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously, non_constant_identifier_names

import 'dart:io';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:bella/features/auth/data/models/DetailsErrorModel.dart';
import 'package:bella/features/auth/data/models/LoggedModel.dart';
import 'package:bella/features/layout/home/data/models/read_credit_card_model.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/data_provider/local/cach_keys.dart';
import '../data/models/chech_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  DetailsErrorModel detailsErrorModel = DetailsErrorModel();

  CheckVerificationCodeModel checkVerificationCodeModel =
      CheckVerificationCodeModel();

  ReadCreditCardModel readCreditCardModel = ReadCreditCardModel();

  Future<void> loginBank(BuildContext context) async {
    emit(LoginBankLoadingState());
    await dioHelper
        .postData(
            endPoint:
                'api/v1/bankid/auth/${MyCache.getString(key: CacheKeys.ipAddress)}')
        .then((response) {
      if (kDebugMode) {
        print('Response in Login Bank $response');
      }
      MyCache.putString(
          key: CacheKeys.orderID, value: response.data['orderRef']);
      if (kDebugMode) {
        print('-------');
        print('The Response is ${response.data}');
        print(response.data['autoStartToken']);
      }
      MyCache.putString(
          key: CacheKeys.tok, value: response.data['autoStartToken']);
      if (kDebugMode) {
        print('-------');
      }
      emit(LoginBankSuccessState(
          loginBank: response.data['autoStartToken'],
          logged: loggedBank(context)));
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in Login Bank');
        emit(LoginBankErrorState());
      }
    });
  }

  bool isExist = false;

  /// Create Id and Verified Email and First Name
  Future<void> getUserDetails() async {
    emit(CreateIdAndLoadingState());
    await dioHelper
        .getData(
            endPoint:
                'api/v1/accounts/user/${MyCache.getString(key: CacheKeys.user_Id)}')
        .then((response) {
      MyCache.putString(key: CacheKeys.userId, value: response.data['id']);
      MyCache.putBoolean(
          key: CacheKeys.emailVerified, value: response.data['email_verified']);
      MyCache.putString(
          key: CacheKeys.firstName, value: response.data['first_name']);
      if (kDebugMode) {
        print(response.data);
      }
      emit(CreateIdAndSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in Create Id and ... is $error');
      }
      emit(CreateIdAndErrorState());
    });
  }

  Future<void> checkUserExistOrNot() async {
    emit(CheckExistOrNotLoadingState());
    await dioHelper.postData(endPoint: 'api/v1/accounts/exists', body: {
      'social_security_number':
          MyCache.getString(key: CacheKeys.personalNumber),
    }).then((response) {
      if (kDebugMode) {
        print('The Response of Check Exist is ${response.data}');
      }
      MyCache.putString(
          key: CacheKeys.user_Id, value: response.data['user_id']);
      if (kDebugMode) {
        print('uuuuuuuuuuuuuusssssssssssssssssseeeeeeer id');
        print(MyCache.getString(key: CacheKeys.user_Id));
        print('uuuuuuuuuuuuuusssssssssssssssssseeeeeeer id');
      }
      emit(CheckVerificationCodeSuccessState());

      /// Create New Func ///
      getUserDetails();
      isExist = true;
      if (kDebugMode) {
        print(isExist);
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Have Error in Check Exist or Not is $error');
      }
      emit(CheckVerificationCodeErrorState());
      isExist = false;
      if (kDebugMode) {
        print(isExist);
      }
    });
  }

  Future<void> loggedBank(BuildContext context) async {
    await dioHelper.postData(
        endPoint:
            'api/v1/bankid/collect/${MyCache.getString(key: CacheKeys.orderID)}',
        body: {}).then((response) async {
      if (kDebugMode) {
        print('Response in Login Bank $response');
      }
      if (response.data['status'] == 'complete') {
        emit(
          LoggedBankSuccessState(
            loggedModel: LoggedModel.fromJson(response.data),
          ),
        );

        /// Personal Info
        MyCache.putString(
          key: CacheKeys.personalNumber,
          value: response.data['user']['personalNumber'],
        );
        if (kDebugMode) {
          print(
            'The Personal Number is ${MyCache.getString(key: CacheKeys.personalNumber)}');
        }

        /// Full Name
        MyCache.putString(
          key: CacheKeys.fullName,
          value: response.data['user']['name'],
        );
        if (kDebugMode) {
          print('The Full Name is ${MyCache.getString(key: CacheKeys.fullName)}');
        }

        /// First Name
        MyCache.putString(
          key: CacheKeys.firstName,
          value: response.data['user']['givenName'],
        );
        if (kDebugMode) {
          print(
            'The First Name is ${MyCache.getString(key: CacheKeys.firstName)}');
        }

        /// Last Name
        MyCache.putString(
          key: CacheKeys.lastName,
          value: response.data['user']['surname'],
        );
        if (kDebugMode) {
          print('The Last Name is ${MyCache.getString(key: CacheKeys.lastName)}');
        }

        /// Success 200

        await BlocProvider.of<AuthCubit>(context).checkUserExistOrNot();
        if (isExist == true) {
          getUserDetails();
          Navigator.pushReplacementNamed(context, 'layout-screen');
        }

        /// Error 404
        else {
          Navigator.pushReplacementNamed(context, 'signup-screen');
        }
      } else if (response.data['status'] == 'pending') {
        await BlocProvider.of<AuthCubit>(context).loggedBank(context);
      } else if (response.data['status'] == 'failed') {
        sleep(const Duration(seconds: 2));
        Navigator.pushNamed(context, 'on-boarding-screen');
        AppConstants.showMyDialogError(context);
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
        print('Error in Logged Bank');
      }
      emit(LoggedBankErrorState());
    });
  }

  Future<void> registerFun(String email, String phone) async {
    emit(RegisterLoadingState());
    await dioHelper
        .postData(endPoint: 'api/v1/accounts/email_phone_exists', body: {
      "phone_number": phone,
      "email": email,
    }).then((response) {
      MyCache.putString(key: CacheKeys.phone_number, value: phone);
      MyCache.putString(key: CacheKeys.email, value: email);
      if (kDebugMode) {
        print(response.data);
      }
      emit(RegisterSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Have Error in Register is $error');
      }
      emit(RegisterErrorState());
    });
  }

  Future<void> createVerificationCode(String mobileNumber) async {
    emit(CreateVerificationCodeLoadingState());
    await dioHelper.postData(
        endPoint: '/api/v1/accounts/create_phone_verification',
        body: {
          'phone_number': '+20$mobileNumber',
        }).then((response) {
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 200) {
        emit(CreateVerificationCodeSuccessState());
      } else if (response.statusCode == 400) {
        if (kDebugMode) {
          print(response.data);
        }
        emit(CreateVerificationCodeErrorState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in Create Verification is $error');
      }
      emit(CreateVerificationCodeErrorState());
    });
  }

  Future<void> checkVerificationCode(
      String otbNumber, String mobileNumber) async {
    emit(CheckVerificationCodeLoadingState());
    await dioHelper
        .postData(endPoint: '/api/v1/mobile_number/check_verification', body: {
      'otp_code': otbNumber,
      'mobile_number': mobileNumber,
    }).then((response) {
      if (kDebugMode) {
        print(response.data);
      }
      checkVerificationCodeModel =
          CheckVerificationCodeModel.fromJson(response.data);
      emit(CheckVerificationCodeSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in Check Verification is $error');
      }
      emit(CheckVerificationCodeErrorState());
    });
  }

  Future<void> createFun({
    required String social_security_number,
    required String full_name,
    required String first_name,
    required String surname,
    required String email,
    required String phone_number,
  }) async {
    emit(CreateLoadingState());
    await dioHelper.postData(endPoint: 'api/v1/accounts/create', body: {
      "social_security_number": social_security_number,
      "full_name": full_name,
      "first_name": first_name,
      "surname": surname,
      "email": email,
      "phone_number": phone_number,
    }).then((response) {
      if (kDebugMode) {
        print(response.data);
        print('--------------------');
        print(response.data['email_verified']);
      }
      MyCache.putBoolean(
          key: CacheKeys.emailVerified, value: response.data['email_verified']);
      MyCache.putString(
          key: CacheKeys.userId, value: response.data['id'].toString());
      if (kDebugMode) {
        print(MyCache.getBoolean(
            key: CacheKeys.emailVerified, defaultValue: false));
        print(MyCache.getString(key: CacheKeys.userId));
        print('--------------------');
      }
      emit(CreateSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in Create is $error');
      }
      emit(CreateErrorState());
    });
  }

  Future<void> addCreditCard({
    required String credit_card_number,
    required String expiry_date,
  }) async {
    emit(AddCreditCardLoadingState());
    await dioHelper.postData(endPoint: 'api/v1/credit_card/', body: {
      "user_id": MyCache.getString(key: CacheKeys.userId),
      "credit_card_number": credit_card_number,
      "expiry_date": expiry_date,
    }).then((response) {
      if (kDebugMode) {
        print(response.data);
      }
      emit(AddCreditCardSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in Add Credit Card is $error');
      }
      emit(AddCreditCardErrorState());
    });
  }

  Future<void> readCreditCard() async {
    emit(ReadCreditCardLoadingState());
    await dioHelper
        .getData(
            endPoint:
                'api/v1/credit_card/${MyCache.getString(key: CacheKeys.userId)}')
        .then((response) {
      if (kDebugMode) {
        print(response.data);
      }
      readCreditCardModel = ReadCreditCardModel.fromJson(response.data);
      emit(ReadCreditCardSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in Read Credit card is $error');
      }
      emit(ReadCreditCardErrorState());
    });
  }
}
