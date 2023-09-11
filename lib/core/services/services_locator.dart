import 'package:aqarmap/core/network/dio_client.dart';
import 'package:aqarmap/features/auth/data/datasource/base_auth_remote_datasource.dart';
import 'package:aqarmap/features/auth/data/repository/auth_repository.dart';
import 'package:aqarmap/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Network Calls
    sl.registerSingleton<DioClient>(DioClient());

    /// Bloc *Define as registerFactory*

    /// Use Cases *Define as registerLazySingleton*
    sl.registerLazySingleton(() => SignInUseCase(sl()));

    /// Repository *Define as registerLazySingleton*
    sl.registerLazySingleton(<BaseAuthRepository>() => AuthRepository(sl()));

    /// DATA SOURCE *Define as registerLazySingleton*
    sl.registerLazySingleton(
        <BaseAuthRemoteDataSource>() => AuthRemoteDataSource(sl()));
  }
}
