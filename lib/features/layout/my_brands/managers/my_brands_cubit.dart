import 'dart:developer';
import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:bella/features/layout/home/data/models/see_all_model.dart';
import 'package:bella/features/layout/my_brands/data/models/not_joined_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'my_brands_state.dart';

class MyBrandsCubit extends Cubit<MyBrandsState> {
  MyBrandsCubit() : super(MyBrandsInitialState());

  static MyBrandsCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  SeeAllModel ? allJoined;
  NotJoinedModel? allNotJoined;
  String? logo;
  String display_name = '';
  String termsAndConditions = '';

  Future<void> joinedFunction() async {
    emit(JoinedLoadingState());
    await dioHelper
        .getData(
            endPoint:
                'api/v1/companies/joined/${MyCache.getString(key: CacheKeys.user_Id)}')
        .then((response) {
      print(MyCache.getString(key: CacheKeys.user_Id));
      allJoined = SeeAllModel.fromJson(response.data);
      emit(JoinedSuccessState());
    }).catchError((error) {
      print('Error in Get Joined is $error');
      emit(JoinedErrorState());
    });
  }

  Future<void> notJoinedFunction(BuildContext context) async {
    emit(NotJoinedLoadingState());
    // notJoined.clear();
    await dioHelper
        .getData(
            endPoint:
                'api/v1/companies/not-joined/${MyCache.getString(key: CacheKeys.user_Id)}')
        .then((response) {
      allNotJoined = NotJoinedModel.fromJson(response.data);
      emit(NotJoinedSuccessState());
    }).catchError((error) {
      print('Error in Get Not Joined is $error');
      emit(NotJoinedErrorState());
    });
  }

  Future<void> checkHasJoinedOrNot() async {
    emit(CheckHasJoinedOrNotLoadingState());
    await dioHelper
        .getData(
            endPoint:
                'api/v1/companies/has-joined/${MyCache.getString(key: CacheKeys.user_Id)}/${MyCache.getString(key: CacheKeys.comp_id)}')
        .then((response) {
      if (response.data['has_joined'] == true) {
        emit(CheckHasJoinedOrNotSuccessInTrueState());
      } else if (response.data['has_joined'] == false) {
        emit(CheckHasJoinedOrNotSuccessInFalseState());
      }
    }).catchError((error) {
      print('Error in Check Hase Joined or Not is $error');
      emit(CheckHasJoinedOrNotErrorState());
    });
  }

  Future<void> getTermsAndConditions() async {
    emit(GetTermsAndConditionsLoadingState());
    await dioHelper
        .getData(
            endPoint:
                'api/v1/companies/${MyCache.getString(key: CacheKeys.comp_id)}/terms-and-conditions')
        .then((response) {
      print(response.data);
      logo = response.data['logo'];
      display_name = response.data['display_name'];
      termsAndConditions = response.data['terms_and_conditions'];
      print(termsAndConditions);
      emit(GetTermsAndConditionsSuccessState());
    }).catchError((error) {
      print('Error in Join in Home is $error');
      emit(GetTermsAndConditionsErrorState());
    });
  }

  void clearTermsAndConditionsState() {
    logo = '';
    display_name = '';
    termsAndConditions = '';
    emit(ClearTermsAndConditionsState());
  }
}
