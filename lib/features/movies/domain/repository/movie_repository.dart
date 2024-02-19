import 'package:aqarmap/core/error/failure.dart';
import 'package:aqarmap/features/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> popularMovies();
}
