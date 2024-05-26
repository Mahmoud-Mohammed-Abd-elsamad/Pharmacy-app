
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:farmacy_app/core/utils/assets.dart';
final Dio _dio = Dio();

class ApiServices {


  // Future<Response> ublaodImage()async{
  //   log("log called  ublaodImage " );
  //
  //   try{
  //     FormData formData = FormData.fromMap({
  //       "image":Assets.imageTestData3
  //     });
  //     var response = await _dio.post("https://autistic-children.vercel.app/user/profilepic/664a05753c6bf85792a71738",
  //         data: formData,options: Options(
  //             contentType:Headers.multipartFormDataContentType, // "multipart/form-data; boundary=<calculated when request is sent>",
  //             headers: {
  //               "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NGEwNTc1M2M2YmY4NTc5MmE3MTczOCIsInJvbGUiOiJBZG1pbiIsImlhdCI6MTcxNjIxMDQ1OSwiZXhwIjoxNzE4ODAyNDU5fQ.62usGn2hJiF2hdstPsGuttpxXBoJi02cR8abbL8GoWo"
  //             }
  //         ));
  //     log("Statuscode"+response.statusCode.toString());
  //     return response;
  //   }catch(e){
  //     log("error catch "+e.toString());
  //     return Future(() => Response(requestOptions: RequestOptions()));
  //   }
  //
  // }

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
