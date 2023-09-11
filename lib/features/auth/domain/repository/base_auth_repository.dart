import 'package:aqarmap/core/error/failure.dart';
import 'package:aqarmap/features/auth/domain/enitites/user.dart';
import 'package:aqarmap/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, User>> signIn(SignInParameter parameter);
}
