// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:bella/features/layout/home/data/models/error_model.dart';
import 'package:bella/features/layout/home/data/models/get-recommended.dart';
import 'package:bella/features/layout/home/data/models/get_company_products_model.dart';
import 'package:bella/features/layout/home/data/models/get_recommended_products_model.dart';
import 'package:bella/features/layout/home/data/models/get_wish_list_model.dart';
import 'package:bella/features/layout/home/data/models/see_all_model.dart';
import 'package:bella/features/layout/wish_list/data/get_wish_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  // final Map<String, List<WishlistItem>> groupedByCompany = {};

  SeeAllModel? allCompanies;
  GetRecommendedModel? recommended;
  GetRecommendedProductsModel? getRecommendedProductsModel;
  GetCompanyProductsModel? getCompanyProductsModel;
  ErrorModel? errorModel;

  // List<WishlistItem> wishListModel = [];

  /// Get Recommended
  Future<void> getRecommended() async {
    emit(GetRecommendedLoadingState());
    print('User id is ${{MyCache.getString(key: CacheKeys.userId)}}');
    await dioHelper
        .getData(
            endPoint:
                '/api/v1/timeline/recommended_companies/${MyCache.getString(key: CacheKeys.user_Id)}')
        .then((response) {
      recommended = GetRecommendedModel.fromJson(response.data);
      emit(GetRecommendedSuccessState());
    }).catchError((error) {
      print('Error in Get Recommended is $error');
      emit(GetRecommendedErrorState());
    });
  }

  Future<void> getRecommendedProducts() async {
    emit(GetAllRecommendedProductsLoadingState());
    await dioHelper
        .getData(
            endPoint: 'api/v1/timeline/recommended_products/${{
      MyCache.getString(key: CacheKeys.userId)
    }}')
        .then((response) {
      print(response.data);
      getRecommendedProductsModel =
          GetRecommendedProductsModel.fromJson(response.data);
      emit(GetAllRecommendedProductsSuccessState());
    }).catchError((error) {
      print('Error in get all recommended products is $error');
      emit(GetAllRecommendedProductsErrorState());
    });
  }

  Future<void> getCompanyProducts() async {
    emit(GetCompanyProductsLoadingState());
    // await dioHelper.getData(endPoint: 'api/v1/products/company/3332d5fd-ad45-43ca-9b5d-8c6f05f024de').then((response) {
    await dioHelper
        .getData(
            endPoint:
                'api/v1/products/company/${MyCache.getString(key: CacheKeys.comp_id)}')
        .then((response) {
      print(response.data);
      getCompanyProductsModel = GetCompanyProductsModel.fromJson(response.data);
      emit(GetCompanyProductsSuccessState());
    }).catchError((error) {
      // errorModel = ErrorModel.fromJson(error);
      print('Error in get company product is $error');
      // print('Error in get company product is ${errorModel!.detail}');
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
      print(response.data);
      allCompanies = SeeAllModel.fromJson(response.data);
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

  // Future<Wishlist> getWishList() async {
  //   emit(GetWishListLoadingState());
  //   await dioHelper
  //       .getData(
  //       endPoint:
  //       'api/v1/basket/${MyCache.getString(key: CacheKeys.user_Id)}')
  //       .then((response) {
  //     print('Response in Get Wish List is ${response.data}');
  //     // wishListModel = GetWishListModel.fromJson(response.data);
  //     return GetWishListModel.fromJson(response.data);
  //     emit(GetWishListSuccessState());
  //   }).catchError((error) {
  //     print('Error in Get Wish List is $error');
  //     return [];
  //     emit(GetWishListErrorState());
  //   });
  // }

  // Future<List<Wishlist>?> getWishList() async {
  //   emit(GetWishListLoadingState());
  //   try {
  //     final response = await dioHelper.getData(
  //         endPoint: 'api/v1/basket/${MyCache.getString(key: CacheKeys.user_Id)}');
  //     print('Response in Get Wish List is ${response.data}');
  //     wishListModel = Wishlist.fromJson(response.data);
  //     emit(GetWishListSuccessState());
  //     return wishListModel;
  //   } catch (error) {
  //     print('Error in Get Wish List is $error');
  //     emit(GetWishListErrorState());
  //     return null;
  //   }
  // }

  // Future<List<Wishlist>?> getWishList() async {
  //   emit(GetWishListLoadingState());
  //   try {
  //     final response = await dioHelper.getData(
  //         endPoint: 'api/v1/basket/${MyCache.getString(key: CacheKeys.user_Id)}');
  //     print('Response in Get Wish List is ${response.data}');
  //     final wishlistItems = List<Map<String, dynamic>>.from(response.data);
  //     wishListModel = wishlistItems
  //         .map((item) => Wishlist.fromJson(item))
  //         .toList();
  //     emit(GetWishListSuccessState());
  //     return wishListModel;
  //   } catch (error) {
  //     print('Error in Get Wish List is $error');
  //     emit(GetWishListErrorState());
  //     return null;
  //   }
  // }

  // Future<void> getWishList() async {
  //   emit(GetWishListLoadingState());
  //   wishListModel.clear();
  //   try {
  //     final response = await dioHelper.getData(
  //         endPoint: 'api/v1/basket/${MyCache.getString(key: CacheKeys.user_Id)}');
  //     print('Response in Get Wish List is ${response.data}');
  //     // final wishlistItems = response.data is List
  //     //     ? List<Map<String, dynamic>>.from(response.data)
  //     //     : [response.data];
  //     // wishListModel = wishlistItems
  //     //     .map((item) => Wishlist.fromJson(item))
  //     //     .toList();
  //     wishListModel = response.data['wishlist'].map((item) => Wishlist.fromJson(item))
  //         .toList();
  //     print('Wish List is $wishListModel');
  //     emit(GetWishListSuccessState());
  //     // return wishListModel;
  //   } catch (error) {
  //     print('Error in Get Wish List is $error');
  //     emit(GetWishListErrorState());
  //     // return null;
  //   }
  // }

  // Future<void> getWishList() async {
  //   emit(GetWishListLoadingState());
  //   wishListModel.clear();
  //   // try {
  //   //   final response = await dioHelper.getData(
  //   //       endPoint: 'api/v1/basket/${MyCache.getString(key: CacheKeys.user_Id)}');
  //   //   print('Response in Get Wish List is ${response.data}');
  //   //   if (response.data['wishlist'] is List) {
  //   //     wishListModel = List<Wishlist>.from(response.data['wishlist']
  //   //         .map((item) => Wishlist.fromJson(item)));
  //   //     print('Wish List is $wishListModel');
  //   //     emit(GetWishListSuccessState(wishList: wishListModel));
  //   //   } else {
  //   //     print('Error in Get Wish List: Wishlist is not a list');
  //   //     emit(GetWishListErrorState());
  //   //   }
  //   // } catch (error) {
  //   //   print('Error in Get Wish List is $error');
  //   //   emit(GetWishListErrorState());
  //   // }
  //   await dioHelper
  //       .getData(
  //           endPoint:
  //               'api/v1/basket/${MyCache.getString(key: CacheKeys.user_Id)}')
  //       .then((response) {
  //     response.data['wishlist'].forEach((wish) {
  //       wishListModel.add(WishlistItem.fromJson(wish));
  //     });
  //       // String? key = item.companyDisplayName;
  //       // if (groupedByCompany.containsKey(key)) {
  //       //   groupedByCompany[key]!.add(item);
  //       // } else {
  //       //   groupedByCompany[key!] = [item];
  //       // }
  //     emit(GetWishListSuccessState(wishList: wishListModel));
  //   }).catchError((error) {
  //     print('Error in Get Wish List is $error');
  //     emit(GetWishListErrorState());
  //   });
  // }

  // Future<void> deleteOneItemInCart({required String id}) async {
  //   emit(DeleteOneItemFromCartLoadingState());
  //   await dioHelper
  //       .deleteData(endPoint: 'api/v1/basket/delete_from_basket', body: {
  //     "id": id,
  //     "user_id": MyCache.getString(key: CacheKeys.user_Id),
  //   }).then((response) {
  //     print(response.data);
  //     emit(DeleteOneItemFromCartSuccessState());
  //   }).catchError((error) {
  //     print('Error in Delete in cart is $error');
  //     emit(DeleteOneItemFromCartErrorState());
  //   });
  // }
}
