import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmacy_app/core/api/end_points.dart';
import 'package:http/http.dart' as http;
import '../../../../core/error/failures.dart';
import '../models/register_body.dart';
import '../models/register_mode.dart';

abstract class RegisterDataSource {
  Future<Either<FailureError, RegisterModel>> registerUser(
      RegisterBody registerBody);
}

class RemoteRegisterDataSource extends RegisterDataSource {
  @override
  Future<Either<FailureError, RegisterModel>> registerUser(
      RegisterBody registerBody) async {
    final dio = Dio();

    final response =
    await dio.post(
      EndPoints.baseUrl + EndPoints.register,
      data: {
        "Email": registerBody.email,
        "FullName": registerBody.name,
        "Password": registerBody.password
      },
    );
    // await http.post(
    //   Uri.parse(EndPoints.baseUrl + EndPoints.register),
    //   body: jsonEncode(<String, String>{
    //     "Email": registerBody.email,
    //     "FullName": registerBody.name,
    //     "Password": registerBody.password
    //   }),
    // );
    log(response.statusCode.toString());

    print(">>>>>>>>>>>> ${response.data.toString()} ${response.statusCode}");
    print("Email: ${registerBody.email}");
    if (response.statusCode == 200) {
      print(response.data.toString());
      log(response.statusCode.toString());

      // RegisterModel registerModel = RegisterModel.fromJson(
      //     jsonDecode(response.data) as Map<String, dynamic>);

      RegisterModel registerModel = RegisterModel.fromJson(
          response.data as Map<String, dynamic>);
      log("right print");

      return Right(registerModel);
    } else {
      log("left print");

      // If the server did not return a 200 OK response,
      // then throw an exception.
      return Left(FailureError(response.statusCode.toString()));
    }
  }
}

class LocalRegisterDataSource extends RegisterDataSource {
  @override
  Future<Either<FailureError, RegisterModel>> registerUser(
      RegisterBody registerBody) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
