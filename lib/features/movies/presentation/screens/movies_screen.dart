import 'dart:developer';

import 'package:aqarmap/core/services/services_locator.dart';
import 'package:aqarmap/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    getPopularMovies();
  }

  getPopularMovies() async {
    GetPopularMoviesUseCase getPopularMoviesUseCase =
        GetPopularMoviesUseCase(sl());
    var response = await getPopularMoviesUseCase();
    response.fold((l) => log(l.message), (r) => log(r.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        getPopularMovies();
      }),
      body: Container(),
    );
  }
}
