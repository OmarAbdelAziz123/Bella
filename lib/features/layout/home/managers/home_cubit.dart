import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:bella/features/layout/home/data/models/get-recommended.dart';
import 'package:bella/features/layout/home/data/models/see_all_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  List<RecommendedCompanies> recommended = [];
  List<Companies> allCompanies = [];

  /// Get Recommended
  Future<void> getRecommended() async {
    recommended.clear();
    emit(GetRecommendedLoadingState());
    print('User id is ${{MyCache.getString(key: CacheKeys.userId)}}');
    await dioHelper
        .getData(
            endPoint:
                // '/api/v1/timeline/recommended_companies/48f9f0ef-f3ff-45eb-bba4-c78d18a424a7')
                '/api/v1/timeline/recommended_companies/${MyCache.getString(key: CacheKeys.user_Id)}')
        .then((response) {
      print(response.data);
      response.data['companies'].forEach((oneRecommended) {
        recommended.add(RecommendedCompanies.fromJson(oneRecommended));
      });
      emit(GetRecommendedSuccessState());
    }).catchError((error) {
      print('Error in Get Recommended is $error');
      emit(GetRecommendedErrorState());
    });
  }

  /// See All
  Future<void> getAllCompanies() async {
    allCompanies.clear();
    emit(GetAllCompaniesLoadingState());
    await dioHelper
        .getData(
            // endPoint: '/api/v1/companies/not-joined/48f9f0ef-f3ff-45eb-bba4-c78d18a424a7',)
            endPoint: '/api/v1/companies/not-joined/${MyCache.getString(key: CacheKeys.user_Id)}')
        .then((response) {
      print(response.data);
      response.data['companies'].forEach((oneCompany) {
        allCompanies.add(Companies.fromJson(oneCompany));
      });
      emit(GetAllCompaniesSuccessState());
    }).catchError((error) {
      print('error in get all companies $error');
      emit(GetAllCompaniesErrorState());
    });
  }

  Future<void> getCompanyProfile() async {
    emit(GetAllCompaniesLoadingState());
    await dioHelper.getData(endPoint: 'api/v1/companies/join').then((response) {
      print(response.data);
      emit(GetAllCompaniesSuccessState());
    }).catchError((error) {
      print('Error in Get Company Profile is $error');
      emit(GetCompanyProfileErrorState());
    });
  }

  Future<void> createJoinInAccept(String companyId) async {
    emit(CreateJoinLoadingState());
    await dioHelper.postData(endPoint: 'api/v1/companies/join', body: {
      'company_id': companyId,
      'user_id': MyCache.getString(key: CacheKeys.user_Id),
    }).then((response) {
      print(response.data);
      emit(CreateJoinSuccessState());
    }).catchError((error) {
      print('Error in Joined is $error');
      emit(CreateJoinErrorState());
    });
  }
}