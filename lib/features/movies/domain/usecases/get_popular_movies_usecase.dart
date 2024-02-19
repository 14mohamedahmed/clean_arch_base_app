import 'package:aqarmap/core/error/failure.dart';
import 'package:aqarmap/features/movies/domain/entities/movie.dart';
import 'package:aqarmap/features/movies/domain/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMoviesUseCase {
  final MovieRepository _movieRepository;
  GetPopularMoviesUseCase(this._movieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await _movieRepository.popularMovies();
  }
}
