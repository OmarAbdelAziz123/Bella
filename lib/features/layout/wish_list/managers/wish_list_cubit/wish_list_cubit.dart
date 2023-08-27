// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:bella/features/layout/wish_list/data/get_wish_list.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitialState());

  DioHelper dioHelper = DioHelper();

  List<Wishlist2> wishListModel = [];
  List<Wishlist2> wishListModelCopy = [];

  Future<void> getWishList() async {
    wishListModel.clear();
    emit(WishListListLoadingState());
    await dioHelper
        .getData(
            endPoint:
                'api/v1/basket/${MyCache.getString(key: CacheKeys.user_Id)}')
        .then((response) {
      response.data['wishlist'].forEach((wish) {
        wishListModel.add(Wishlist2.fromJson(wish));
      });
      if (kDebugMode) {
        print('Wish LIST LENGTH IN GET IS ${wishListModel.length}');
      }
      emit(WishListListSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in Get Wish List is $error');
      }
      emit(WishListErrorState());
    });
  }

  Future<void> deleteOneItemInCart({
    required String productId,
    required String companyDisplayName,
    required String onTapSource,
  }) async {
    String? objectId;

    if (onTapSource == 'WishListScreen') {
      objectId = productId;
    } else {
      objectId = getObjectIdInWishlist(productId: productId);
    }

    await dioHelper
        .deleteData(endPoint: 'api/v1/basket/delete_from_basket', body: {
      "id": objectId,
      "user_id": MyCache.getString(key: CacheKeys.user_Id),
    }).then((response) {
      if (kDebugMode) {
        print('Wish LIST LENGTH IN DELETE IS ${wishListModel.length}');
      }
      wishListModelCopy.clear();
      response.data['wishlist'].forEach((wish) {
        wishListModelCopy.add(Wishlist2.fromJson(wish));
      });

      wishListModel = wishListModelCopy;

      emit(WishListListSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in Delete in cart is $error');
      }
      emit(WishListErrorState());
    });
  }

  Future<void> addToCart({
    required String company_logo_link,
    required String company_display_name,
    required String product_id,
    required String product_image_link,
    required String product_title,
    required double regular_price,
    required double sale_price,
    required String currency,
    required double saving_in_SEK,
  }) async {
    // wishListModelCopy.clear();
    emit(WishListListLoadingState());
    await dioHelper.postData(endPoint: '/api/v1/basket/add_to_basket', body: {
      "user_id": MyCache.getString(key: CacheKeys.user_Id),
      "company_id": MyCache.getString(key: CacheKeys.comp_id),
      "company_logo_link": company_logo_link,
      "company_display_name": company_display_name,
      "product_id": product_id,
      "product_image_link": product_image_link,
      "product_title": product_title,
      "regular_price": regular_price,
      "sale_price": sale_price,
      "saving_in_SEK": saving_in_SEK,
      "currency": currency,
    }).then((response) {
      // if (kDebugMode) {
      //   print('Function add to cart is success');
      // }

      wishListModelCopy.clear();
      response.data['wishlist'].forEach((wish) {
        wishListModelCopy.add(Wishlist2.fromJson(wish));
      });

      wishListModel = wishListModelCopy;

      // response.data['wishlist'].forEach((wish) {
      //   wishListModelCopy.add(Wishlist2.fromJson(wish));
      // });
      // if (kDebugMode) {
      //   print('Wish LIST LENGTH IN ADD IS ${wishListModel.length}');
      // }
      // wishListModel = wishListModelCopy;
      emit(WishListListSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print('Error in add to cart is $error');
      }
      emit(WishListErrorState());
    });
  }

  dynamic getTotal() {
    dynamic total = 0;

    for (var element in wishListModel) {
      total += element.sum;
    }
    return total;
  }

  bool checkProductInWishList({required String productId}) {
    bool found = false;

    for (var item in wishListModel) {
      for (var product in item.products!) {
        if (productId == product.productId) {
          found = true;
          break;
        }
      }
    }
    return found;
  }

  String getObjectIdInWishlist({required String productId}) {
    var objectId = "";

    for (var item in wishListModel) {
      for (var product in item.products!) {
        if (productId == product.productId) {
          objectId = product.id!;
          break;
        }
      }
    }
    return objectId;
  }
}
