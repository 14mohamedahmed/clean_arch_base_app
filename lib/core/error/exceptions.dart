import 'package:aqarmap/core/network/models/api_error_model.dart';

class ServerException implements Exception {
  final ApiErrorModel errorModel;

  const ServerException({
    required this.errorModel,
  });
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({
    required this.message,
  });
}
