import 'package:aqarmap/core/network/api_constance.dart';
import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "accept": "application/json",
      "content-type": "application/json",
      "Authorization": "Bearer ${ApiConstance.authToken}"
    });
    // We need here to add authorization to request header If user currently authorize
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Handle global error when request not success
    late String message;
    if (response.statusCode == 200) {
      handler.next(response);
      return;
    }
    switch (response.statusCode) {
      case 401:
        message = "You are not authorized";
        break;
      case 404:
        message =
            "You do not have access to this feature. Please contact your system administrator to proceed";
        break;
      case 422:
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
    handler.reject(DioException(
      requestOptions: response.requestOptions,
      response: response,
    ));
    // this message should be displayed for
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message;
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        message =
            "Connection timed out. Please check your internet connection.";
        break;
      case DioExceptionType.sendTimeout:
        message = "Sending request timed out. Please try again later.";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receiving response timed out. Please try again later.";
        break;
      case DioExceptionType.cancel:
        message = "Request has been canceled.";
        break;
      case DioExceptionType.badCertificate:
        message =
            "Invalid SSL certificate. Please contact with technical support.";
        break;
      case DioExceptionType.badResponse:
        message = "An error occurred. Please contact with technical support.";
        break;
      case DioExceptionType.connectionError:
        message =
            "Error establishing a connection. Please check your internet connection.";
        break;
      case DioExceptionType.unknown:
        message = "An unknown error occurred. Please try again later.";
        break;
      default:
        message = "An error occurred. Please try again later.";
    }
    handler.reject(err);
  }
}
