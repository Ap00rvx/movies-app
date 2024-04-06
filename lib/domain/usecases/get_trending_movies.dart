

import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

class GetTrendingMovies {
final MovieRepository repository ;

  GetTrendingMovies(this.repository);
  Future<List<Movie>>call()async {
    return await repository.getTrendingMovies();
  }


}