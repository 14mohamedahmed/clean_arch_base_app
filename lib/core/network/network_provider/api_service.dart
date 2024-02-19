import 'package:aqarmap/core/network/models/api_error_model.dart';
import 'package:aqarmap/core/network/models/api_success_model.dart';
import 'package:dartz/dartz.dart';

abstract class ApiService {
  Future<Either<ApiErrorModel, ApiSuccessModel>> get(
    String path, {
    Map<String, dynamic> queryParameters = const {},
  });
}
