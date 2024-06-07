
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:farmacy_app/core/utils/assets.dart';
 //final Dio _dio = Dio();

class ApiServices {
  final Dio _dio = Dio();
  Future<Response> get({required String url}) async {
    Response response = await _dio.get(url);
    return response;
  }
  Future<Response> getWithBody({required String url,required Map<String, dynamic> data,required String token}) async {
    Response response = await _dio.get(url,data:data,options: Options(headers: {"Authorization": "Bearer $token"}));
    return response;
  }
  Future<Response> post(
      {required String url,
      required Map<String, dynamic> data,
      required String token,
      String? contentType,
      Map<String, String>? headers}) async {
    Response response = await _dio.post(url,
        data: data,
        options: Options(
          contentType: contentType,
          headers: headers??{"Authorization": "Bearer $token"},
        ));
    return response;
  }

  Future<Response> put(
      {required String url, required dynamic data,Options? options }) async {
    Response response = await _dio.put(
      url,
      data: data,
      options: options
    );
    return response;
  }

  Future<Response> delete({required String url}) async {
    Response response = await _dio.delete(url);
    return response;
  }


}
