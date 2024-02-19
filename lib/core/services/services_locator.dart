import 'package:aqarmap/core/network/network_provider/api_service.dart';
import 'package:aqarmap/core/network/network_provider/dio_api_service_impl.dart';
import 'package:aqarmap/features/auth/data/datasource/base_auth_remote_datasource.dart';
import 'package:aqarmap/features/auth/data/repository/auth_repository.dart';
import 'package:aqarmap/features/auth/domain/repository/base_auth_repository.dart';
import 'package:aqarmap/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:aqarmap/features/movies/data/datasource/movies_remote_datasource.dart';
import 'package:aqarmap/features/movies/data/repository/movie_repository_impl.dart';
import 'package:aqarmap/features/movies/domain/repository/movie_repository.dart';
import 'package:aqarmap/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Network Calls
    sl.registerLazySingleton<ApiService>(() => DioApiServiceImpl());

    /// Bloc *Define as registerFactory*

    /// Use Cases *Define as registerLazySingleton*
    sl.registerLazySingleton(() => SignInUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));

    /// Repository *Define as registerLazySingleton*
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
    sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));

    /// DATA SOURCE *Define as registerLazySingleton*
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource(sl()));
    sl.registerLazySingleton<MoviesRemoteDataSource>(
        () => MoviesRemoteDataSourceImpl(sl()));
  }
}
