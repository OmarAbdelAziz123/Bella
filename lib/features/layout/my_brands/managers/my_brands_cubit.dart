import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:bella/features/layout/home/data/models/all_companies.dart';
import 'package:bella/features/layout/home/data/models/see_all_model.dart';
import 'package:bella/features/layout/my_brands/data/models/not_joined_model.dart';
import 'package:bella/features/layout/my_brands/presentation/my_brands/my_brands_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'my_brands_state.dart';

class MyBrandsCubit extends Cubit<MyBrandsState> {
  MyBrandsCubit() : super(MyBrandsInitialState());

  static MyBrandsCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  List<Companies> allCompanies = [];
  List<CompaniesNotJoined> notJoined = [];

  String logo = '';
  String display_name = '';
  String termsAndConditions = '';

  Future<void> joinedFunction() async {
    emit(JoinedLoadingState());
    await dioHelper
        .getData(
            endPoint:
                // 'api/v1/companies/joined/48f9f0ef-f3ff-45eb-bba4-c78d18a424a7')
                'api/v1/companies/joined/${MyCache.getString(key: CacheKeys.user_Id)}')
        .then((response) {
          print(MyCache.getString(key: CacheKeys.user_Id));
      print(response.data);
      response.data['companies'].forEach((oneCompany) {
        allCompanies.add(Companies.fromJson(oneCompany));
      });
      emit(JoinedSuccessState());
    }).catchError((error) {
      print('Error in Get Joined is $error');
      emit(JoinedErrorState());
    });
  }

  Future<void> notJoinedFunction() async {
    emit(NotJoinedLoadingState());
    await dioHelper
        .getData(
            endPoint:
                // 'api/v1/companies/not-joined/48f9f0ef-f3ff-45eb-bba4-c78d18a424a7')
                'api/v1/companies/not-joined/${MyCache.getString(key: CacheKeys.user_Id)}')
        .then((response) {
      print(response.data);
      response.data['companies'].forEach((oneCompanyNotJoined) {
        notJoined.add(CompaniesNotJoined.fromJson(oneCompanyNotJoined));
      });
      emit(NotJoinedSuccessState());
    }).catchError((error) {
      print('Error in Get Not Joined is $error');
      emit(NotJoinedErrorState());
    });
  }

  Future<void> getTermsAndConditions() async {
    emit(GetTermsAndConditionsLoadingState());
    await dioHelper
        .getData(
            endPoint:
                'api/v1/companies/${MyCache.getString(key: CacheKeys.comp_id)}/terms-and-conditions')
        // 'api/v1/companies/517644bf-faf4-4568-8305-8ae77b07ebfc/terms-and-conditions')
        .then((response) {
      print(response.data);
      logo = response.data['logo'];
      display_name = response.data['display_name'];
      termsAndConditions = response.data['terms_and_conditions'];
      emit(GetTermsAndConditionsSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetTermsAndConditionsErrorState());
    });
  }

// Future<void> getTermsAndConditions() async {
//   emit(GetTermsAndConditionsLoadingState());
//   await dioHelper.getData(endPoint: '');
// }
}
