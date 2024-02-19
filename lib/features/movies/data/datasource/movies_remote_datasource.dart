import 'package:aqarmap/core/error/exceptions.dart';
import 'package:aqarmap/core/network/api_constance.dart';
import 'package:aqarmap/core/network/network_provider/api_service.dart';
import 'package:aqarmap/features/movies/data/models/movie_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> popularMovies();
}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  final ApiService apiService;
  MoviesRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<MovieModel>> popularMovies() async {
    final response = await apiService.get(ApiConstance.popularMovies);
    return response.fold(
      (l) {
        print("l=> $l");
        throw ServerException(errorModel: l);
      },
      (r) {
        return List<MovieModel>.from(
          (r.data['results'] as List).map(
            (movie) => MovieModel.fromJson(movie),
          ),
        );
      },
    );
  }
}
