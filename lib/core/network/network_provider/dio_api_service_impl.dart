import 'package:aqarmap/core/network/api_constance.dart';
import 'package:aqarmap/core/network/interceptors/dio_interceptor.dart';
import 'package:aqarmap/core/network/models/api_error_model.dart';
import 'package:aqarmap/core/network/models/api_success_model.dart';
import 'package:aqarmap/core/network/network_provider/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DioApiServiceImpl extends ApiService {
  DioApiServiceImpl() {
    _dio.interceptors.add(DioInterceptor());
    _dio.options.validateStatus = (status) {
      return true;
    };
  }
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstance.baseUrl));

  @override
  Future<Either<ApiErrorModel, ApiSuccessModel>> get(
    String path, {
    Map<String, dynamic> queryParameters = const {},
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return Right(ApiSuccessModel(
        statusCode: response.statusCode!,
        // here, we should to pass the response message to display it for the user if needed
        message: response.statusMessage!,
        data: response.data,
      ));
    } on DioException catch (error) {
      return Left(ApiErrorModel.fromJson(error.response!.data));
    }
  }
}
