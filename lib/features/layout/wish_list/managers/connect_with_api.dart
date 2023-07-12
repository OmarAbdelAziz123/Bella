// import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
// import 'package:bella/features/auth/data/data_provider/local/cache.dart';
// import 'package:bella/features/auth/data/data_provider/remote/dio_helper.dart';
// import 'package:bella/features/layout/wish_list/data/get_wish_list.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// class WishlistApi {
//   final DioHelper dio = DioHelper();
//
//   Future<List<WishlistItem>> getWishlistItems() async {
//     final response = await dio.getData(
//         endPoint: 'api/v1/basket/${MyCache.getString(key: CacheKeys.user_Id)}');
//     return (response.data['wishlist'] as List)
//         .map((item) => WishlistItem.fromJson(item))
//         .toList();
//   }
// }
//
// class WishlistProvider extends ChangeNotifier {
//   final WishlistApi _wishlistApi = WishlistApi();
//   List<WishlistItem> _items = [];
//   final Map<String, List<WishlistItem>> groupedByCompany = {};
//
//   List<WishlistItem> get items => _items;
//
//   Future<void> fetchWishlistItems() async {
//     print('Fetch function is called');
//     _items = await _wishlistApi.getWishlistItems();
//     print('Fetch function success');
//     groupedByCompany.clear();
//     getGroupedWishListByCompany();
//     notifyListeners();
//   }
//
//   void getGroupedWishListByCompany() {
//     groupedByCompany.clear();
//     for (var item in _items) {
//       String key = item.companyDisplayName;
//       if (groupedByCompany.containsKey(key)) {
//         groupedByCompany[key]!.add(item);
//       } else {
//         groupedByCompany[key] = [item];
//       }
//     }
//     print(groupedByCompany.length);
//   }
//
//   double getTotal() {
//     double total = 0;
//
//     total = _items.map((item) => item.salePrice).reduce((a, b) => a + b);
//
//     return total;
//   }
//
//   bool changeColor(String id) {
//     final bool result = _items.any((product) => product.productId == id);
//     return result;
//   }
//
//   final DioHelper dio = DioHelper();
//
//   bool _isLoading = false;
//
//   bool get isLoading => _isLoading;
//
//   Future<void> addToCart({
//     required String company_logo_link,
//     required String company_display_name,
//     required String product_id,
//     required String product_image_link,
//     required String product_title,
//     required dynamic regular_price,
//     required dynamic sale_price,
//     required String currency,
//   }) async {
//     try {
//       print('Function add to cart is called');
//       final response = await dio.postData(
//         endPoint: '/api/v1/basket/add_to_basket',
//         body: {
//           "user_id": MyCache.getString(key: CacheKeys.user_Id),
//           "company_id": MyCache.getString(key: CacheKeys.comp_id),
//           "company_logo_link": company_logo_link,
//           "company_display_name": company_display_name,
//           "product_id": product_id,
//           "product_image_link": product_image_link,
//           "product_title": product_title,
//           "regular_price": regular_price,
//           "sale_price": sale_price,
//           "currency": currency
//         },
//       );
//       print('Function add to cart is success');
//       await Future.delayed(const Duration(milliseconds: 500));
//       _items = (response.data['wishlist'] as List)
//           .map((item) => WishlistItem.fromJson(item))
//           .toList();
//       getGroupedWishListByCompany();
//       notifyListeners();
//     } catch (error) {
//       print('Error in add to cart is $error');
//       throw error;
//     }
//   }
//
//   Future<void> deleteOneItemInCart({String? id}) async {
//     print('Delete function is called');
//     try {
//       final response = await dio.deleteData(
//           endPoint: 'api/v1/basket/delete_from_basket',
//           body: {
//             "id": id,
//             "user_id": MyCache.getString(key: CacheKeys.user_Id)
//           });
//       print('Delete function is success');
//       _items = (response.data['wishlist'] as List)
//           .map((item) => WishlistItem.fromJson(item))
//           .toList();
//       getGroupedWishListByCompany();
//       notifyListeners();
//     } catch (error) {
//       print('Error in Delete in cart is $error');
//       throw error;
//     }
//   }
// }
//
// class CartProvider with ChangeNotifier {
//   final DioHelper dio = DioHelper();
// }
