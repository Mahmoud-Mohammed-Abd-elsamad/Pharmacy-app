import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<Response> get({required String url}) async {
    Response response = await _dio.get(url);
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
      {required String url, required Map<String, dynamic> data}) async {
    Response response = await _dio.put(
      url,
      data: data,
    );
    return response;
  }

  Future<Response> delete({required String url}) async {
    Response response = await _dio.delete(url);
    return response;
  }
}
