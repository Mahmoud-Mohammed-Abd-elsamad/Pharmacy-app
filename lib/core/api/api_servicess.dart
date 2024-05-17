import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<Response> get({required String url})async{
    Response response = await _dio.get(url);
    return response;
  }

  Future<Response> post(
      {required String url,
      required Map<String, dynamic> data,required String token,
       String? contentType }) async {
    Response response = await _dio.post(url, data: data, options: Options(contentType: contentType));
    return response;
  }

}
