class ApiSuccessModel {
  final int statusCode;
  final String message;
  final dynamic data;

  const ApiSuccessModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });
}
