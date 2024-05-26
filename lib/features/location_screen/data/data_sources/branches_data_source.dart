import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:farmacy_app/core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../models/branch_model.dart';

abstract class BranchesDataSource {
  Future<Either<FailureError, List<BranchModel>>> getBranchesByAddress(
      String stateName);

}

class RemoteBranchesDataSource implements BranchesDataSource {
  @override
  Future<Either<FailureError, List<BranchModel>>> getBranchesByAddress(
      String stateName) async {
    log("getBranchesByAddress data source called stateName $stateName ========================");
    final Dio _dio = Dio();


      _dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'User-Agent': 'PostmanRuntime/7.39.0',
      };


      const String baseUrl = 'your_base_url_here';
      const String endpoint = '/api/Branches/GetByCityAndState';
      final String url = EndPoints.baseUrl + EndPoints.getBranches;

      final Map<String, String> body = {
        'City': "Cairo",
        'State': stateName,
      };

      try {
        Response response = await _dio.get(
          url,
          data: body,
        );
        print(response.data);

        if(response.statusCode == 200){
          var items = response.data;
          return Right(items.map<BranchModel>((e) => BranchModel.fromJson(e)).toList());
        }else{
          return Left(FailureError(response.data));
        }
      } catch (e) {
        print('Error: ${e.toString()}');
        log('Error: ${e.toString()}');
        return Left(FailureError(e.toString()));
      }
    }

}