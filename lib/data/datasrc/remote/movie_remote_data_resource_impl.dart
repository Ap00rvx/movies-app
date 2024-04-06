
import 'dart:convert';

import 'package:movie_app/data/datasrc/movie_remote_data_resource.dart';
import 'package:movie_app/data/model/movie_model.dart';
import 'package:http/http.dart' as http ;
import 'package:movie_app/secret.dart';
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client ;

  MovieRemoteDataSourceImpl(this.client);

  static const BASE_URL =  "https://api.themoviedb.org/3";


  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response  = await client.get(Uri.parse("$BASE_URL/movie/popular?api_key=$MOVIE_API_KEY"));
    if (response.statusCode == 200 ){
      final jsonData = json.decode(response.body) ;
      final movies = (jsonData['results'] as List).map((movie) => MovieModel.fromJson(movie)).toList();
      return movies;
    }
    else {
      print("Unable to fetch data, status code : ${response.statusCode}");
      return [];
    }


  }

  @override
  Future<List<MovieModel>> getTrendingMovies() {
    // TODO: implement getTrendingMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> searchMoives() {
    // TODO: implement searchMoives
    throw UnimplementedError();
  }

}