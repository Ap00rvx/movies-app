import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

class SearchMovies{
  final MovieRepository repository ;

  SearchMovies(this.repository);
  Future<List<Movie>> call (String query )async {
    return await repository.searchMovie(query);
  }
}