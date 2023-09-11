import 'package:aqarmap/core/network/api_constance.dart';
import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.baseUrl = ApiConstance.baseUrl;
    options.headers.addAll({
      "accept": "application/json",
      "content-type": "application/json",
    });
    // We need here to add authorization to request header If user currentlu authorize
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    // Handle global error when request not success
    if (response.statusCode != 200) {
      late String message;
      switch (response.statusCode) {
        case 401:
          message = "You are not authorized";
          // redirect ti login page
          break;
        case 404:
          message =
              "You do not have access to this feature. Please contact your system administrator to proceed";
          break;
        case 422:
          // handle response errors
          message = response.data['errors'];
          break;
        case 400:
        case 500:
        case 503:
          message =
              "We have been notified of this mistake and we are looking to fix it.";
          break;
        default:
          message = "An unknown error occurred";
          break;
      }
      if (message.isNotEmpty) {
        // shoud return here the error in model like snackbar with error message
      }
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    String message;
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        message = "";
        break;
      case DioExceptionType.sendTimeout:
        message = "";
        break;
      case DioExceptionType.receiveTimeout:
        message = "";
        break;
      case DioExceptionType.cancel:
        message = "";
        break;
      case DioExceptionType.badCertificate:
        message = "";
        break;
      case DioExceptionType.badResponse:
        message = "";
        break;
      case DioExceptionType.connectionError:
        message = "";
        break;
      case DioExceptionType.unknown:
        message = "";
        break;
    }
    // shoud return here the error in model like snackbar with error message
  }
}
