import 'package:aqarmap/core/error/exceptions.dart';
import 'package:aqarmap/core/network/api_constance.dart';
import 'package:aqarmap/core/network/dio_client.dart';
import 'package:aqarmap/core/network/error_message_model.dart';
import 'package:aqarmap/features/auth/data/models/user_model.dart';
import 'package:aqarmap/features/auth/domain/usecases/sign_in_usecase.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserModel> signIn(SignInParameter parameter);
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  final DioClient _client;
  AuthRemoteDataSource(this._client);

  @override
  Future<UserModel> signIn(SignInParameter parameter) async {
    final response = await _client.dio.get(ApiConstance.signIn);
    if (response.statusCode == 200) {
      // This is for example and It will be changed later
      return UserModel.fromJson(response.data['user']);
    } else {
      // should update ErrorMessageModel model with response attributes
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
