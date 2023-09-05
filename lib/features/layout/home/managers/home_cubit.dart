// ignore_for_file: non_constant_identifier_names
import 'dart:developer';
import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:bella/features/layout/home/data/models/company_profile.dart';
import 'package:bella/features/layout/home/data/models/error_model.dart';
import 'package:bella/features/layout/home/data/models/get-recommended.dart';
import 'package:bella/features/layout/home/data/models/get_company_products_model.dart';
import 'package:bella/features/layout/home/data/models/get_recommended_products_model.dart';
import 'package:bella/features/layout/home/data/models/receipts_model.dart';
import 'package:bella/features/layout/home/data/models/see_all_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  SeeAllModel? allCompanies;
  GetRecommendedModel? recommended;

  GetRecommendedProductsModel? getRecommendedProductsModel;
  List<RecommendedProducts> loadMoreRecommendedProducts = [];
  List<RecommendedProducts> productsByCategory = [];

  GetCompanyProductsModel? getCompanyProductsModel;
  ErrorModel? errorModel;
  CompanyProfile? companyProfile;

  List<Receipts> receipts = [];

  int index = 0;

  /// Get Recommended
  Future<void> getRecommended() async {
    emit(GetRecommendedLoadingState());
    if (kDebugMode) {
      print('User id is ${{MyCache.getString(key: CacheKeys.userId)}}');
    }
    await dioHelper
        .getData(
            endPoint:
                '/api/v1/timeline/recommended_companies/${MyCache.getString(key: CacheKeys.user_Id)}')
        .then((response) {
      recommended = GetRecommendedModel.fromJson(response.data);
      emit(GetRecommendedSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in Get Recommended is $error');
        recommended = null;
        print('--------');
        print(recommended);
        print('--------');
      }
      emit(GetRecommendedErrorState());
    });
  }

  Future<void> getRecommendedProducts({int? pageNumber, int? pageSize}) async {
    emit(GetAllRecommendedProductsLoadingState());
    dioHelper
        .getData(
            endPoint: 'api/v1/timeline/recommended_products/${{
      MyCache.getString(key: CacheKeys.userId)
    }}?page_number=$pageNumber&limit=$pageSize')
        .then((response) {
      getRecommendedProductsModel =
          GetRecommendedProductsModel.fromJson(response.data);

      for (var element in getRecommendedProductsModel!.recommendedProducts!) {
        loadMoreRecommendedProducts.add(element);
      }

      log('In Get Recommended Products Function');
      emit(GetAllRecommendedProductsSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in get all recommended products is $error');
      }
      emit(GetAllRecommendedProductsErrorState());
    });
  }

  Future<void> getCompanyProducts() async {
    emit(GetCompanyProductsLoadingState());
    await dioHelper
        .getData(
            endPoint:
                'api/v1/products/company/${MyCache.getString(key: CacheKeys.comp_id)}')
        .then((response) {
      if (kDebugMode) {
        print(response.data);
      }
      getCompanyProductsModel = GetCompanyProductsModel.fromJson(response.data);
      emit(GetCompanyProductsSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in get company product is $error');
      }
      emit(GetCompanyProductsErrorState());
    });
  }

  /// See All
  Future<void> getAllCompanies() async {
    emit(GetAllCompaniesLoadingState());
    await dioHelper
        .getData(
            endPoint:
                '/api/v1/companies/not-joined/${MyCache.getString(key: CacheKeys.user_Id)}')
        .then((response) {
      if (kDebugMode) {
        print(response.data);
      }
      allCompanies = SeeAllModel.fromJson(response.data);
      emit(GetAllCompaniesSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('error in get all companies $error');
      }
      emit(GetAllCompaniesErrorState());
    });
  }

  Future<void> companyProfileFunc() async {
    emit(CompanyProfileLoadingState());
    await dioHelper
        .getData(
            endPoint:
                'api/v1/companies/${MyCache.getString(key: CacheKeys.comp_id)}/${MyCache.getString(key: CacheKeys.user_Id)}')
        .then((response) {
      if (kDebugMode) {
        print('Response in Reward is ${response.data}');
      }
      companyProfile = CompanyProfile.fromJson(response.data);
      emit(CompanyProfileSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in Reward is $error');
      }
      emit(CompanyProfileErrorState());
    });
  }

  Future<void> resetCompanyProfile() async {
    emit(ResetLoadingState());
    companyProfile = CompanyProfile();
    emit(ResetSuccessState());
  }

  Future<void> getProductsByCategory({
    String? categoryName,
    int? pageNumber,
    int? limit,
  }) async {
    emit(GetProductsByCategpryLoadingState());
    var url =
        'api/v1/products/${MyCache.getString(key: CacheKeys.comp_id)}/category/$categoryName?page_number=$pageNumber&limit=$limit';
    log(url);
    await dioHelper.getData(endPoint: url).then(
      (response) {
        getRecommendedProductsModel =
            GetRecommendedProductsModel.fromJson(response.data);

        for (var element in getRecommendedProductsModel!.recommendedProducts!) {
          productsByCategory.add(element);
        }

        log('------------');
        log(productsByCategory.length.toString());

        emit(GetProductsByCategprySuccessState());
      },
    ).catchError((error) {
      print('error in products by category is $error');
      emit(GetProductsByCategpryErrorState());
    });
  }

  Future<void> resetProductsByCategory() async {
    productsByCategory.clear();
  }
  
  /// Get All Receipts
 Future<void> getAllReceipts() async {
    emit(GetAllReceiptsLoadingState());
    receipts.clear();
    await dioHelper.getData(endPoint: 'api/v1/receipts/company/${MyCache.getString(key: CacheKeys.comp_id)}/${MyCache.getString(key: CacheKeys.userId)}').then((value) {
      value.data['receipts'].forEach((oneReceipt) {
        receipts.add(Receipts.fromJson(oneReceipt));
      });
      print(value.data);
      emit(GetAllReceiptsSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetAllReceiptsErrorState());
    });
 }
}
