// ignore_for_file: use_build_context_synchronously

import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/utils/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DioHelper {
  Dio dio = Dio();

  Future<Response> getData({required String endPoint}) async {
    Response response = await dio.get(
      AppConstants.baseUrl + endPoint,
      options: Options(
        headers: {
          "x-api-key": "6c20f27d-1f96-4be9-ac5d-b582305474a6",
        },
      ),
    );
    return response;
  }

  Future<Response> postData({
    bool handleError = true,
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Response response = await dio.post(
        AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(
          headers: {
            "x-api-key": "6c20f27d-1f96-4be9-ac5d-b582305474a6",
          },
        ),
      );
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
      } else if (response.statusCode == 403) {}
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<Response> postDataWithoutAuth({
    bool handleError = true,
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Response response = await dio.post(
        AppConstants.baseUrl + endPoint,
        data: body,
      );
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
      } else if (response.statusCode == 403) {
        if (kDebugMode) {
          print(response.data);
        }
      }
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    return await dio.put('${AppConstants.baseUrl}$endPoint',
        data: body,
        options: Options(
          headers: {
            "authorization":
                "Bearer ${MyCache.getString(key: CacheKeys.token)}",
          },
        ));
  }

  Future<Response> patchData({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    return await dio.patch('${AppConstants.baseUrl}$endPoint',
        data: body,
        options: Options(headers: {
          "x-api-key": "6c20f27d-1f96-4be9-ac5d-b582305474a6",
        }));
  }

  Future<Response> deleteFromCart({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    return await dio.put('${AppConstants.baseUrl}$endPoint',
        data: body,
        options: Options(
          headers: {
            "authorization":
                "Bearer ${MyCache.getString(key: CacheKeys.token)}",
          },
        ));
  }

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? body,
    // String? token,
  }) async {
    return await dio.delete(AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: {
          "x-api-key": "6c20f27d-1f96-4be9-ac5d-b582305474a6",
        }));
  }

  static void logout(BuildContext context) async {
    await MyCache.clearShared();
    Navigator.pushReplacementNamed(context, 'checkScreen');
  }
}
