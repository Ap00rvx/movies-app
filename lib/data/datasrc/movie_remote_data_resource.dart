
import 'package:movie_app/data/model/movie_model.dart';

abstract class MovieRemoteDataSource{
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> searchMoives();

}