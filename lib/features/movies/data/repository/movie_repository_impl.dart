import 'package:aqarmap/core/error/exceptions.dart';
import 'package:aqarmap/core/error/failure.dart';
import 'package:aqarmap/features/movies/data/datasource/movies_remote_datasource.dart';
import 'package:aqarmap/features/movies/data/models/movie_model.dart';
import 'package:aqarmap/features/movies/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MoviesRemoteDataSource _moviesRemoteDataSource;
  MovieRepositoryImpl(this._moviesRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieModel>>> popularMovies() async {
    try {
      final result = await _moviesRemoteDataSource.popularMovies();
      return Right(result);
    } on ServerException catch (faliure) {
      return Left(ServerFailure(faliure.errorModel.statusMessage));
    }
  }
}
