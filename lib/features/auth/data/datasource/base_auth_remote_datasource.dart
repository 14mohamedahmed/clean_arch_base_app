import 'package:aqarmap/core/error/exceptions.dart';
import 'package:aqarmap/core/network/api_constance.dart';
import 'package:aqarmap/core/network/network_provider/api_service.dart';
import 'package:aqarmap/features/auth/data/models/user_model.dart';
import 'package:aqarmap/features/auth/domain/usecases/sign_in_usecase.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserModel> signIn(SignInParameter parameter);
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSource(this.apiService);

  @override
  Future<UserModel> signIn(SignInParameter parameter) async {
    final response = await apiService.get(ApiConstance.popularMovies);
    return response.fold(
      (l) {
        throw ServerException(errorModel: l);
      },
      (r) {
        return UserModel.fromJson(const {});
      },
    );
  }
}
