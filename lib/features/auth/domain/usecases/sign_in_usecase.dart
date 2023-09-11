import 'package:aqarmap/core/error/failure.dart';
import 'package:aqarmap/core/usecase/base_usecase.dart';
import 'package:aqarmap/features/auth/domain/enitites/user.dart';
import 'package:aqarmap/features/auth/domain/repository/base_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignInUseCase extends BaseUseCase<User, SignInParameter> {
  final BaseAuthRepository _authRepositories;
  SignInUseCase(this._authRepositories);

  @override
  Future<Either<Failure, User>> call(SignInParameter parameters) async {
    return await _authRepositories.signIn(parameters);
  }
}

class SignInParameter extends Equatable {
  final String phoneNumber;
  const SignInParameter({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}
