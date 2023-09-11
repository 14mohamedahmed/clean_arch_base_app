import 'package:aqarmap/core/error/exceptions.dart';
import 'package:aqarmap/core/error/failure.dart';
import 'package:aqarmap/features/auth/data/datasource/base_auth_remote_datasource.dart';
import 'package:aqarmap/features/auth/domain/enitites/user.dart';
import 'package:aqarmap/features/auth/domain/repository/base_auth_repository.dart';
import 'package:aqarmap/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:dartz/dartz.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDataSource _authRemoteDataSource;
  AuthRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, User>> signIn(SignInParameter parameter) async {
    final result = await _authRemoteDataSource.signIn(parameter);
    try {
      return Right(result);
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorMessageModel.statusMessage));
    }
  }
}
