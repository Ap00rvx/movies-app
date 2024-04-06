
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_trending_movies.dart';
import 'package:mockito/annotations.dart';

import 'get_trending_movies_test.mocks.dart';


@GenerateNiceMocks([MockSpec<MovieRepository>()])

void main() {
  late GetTrendingMovies usecase;
  late MockMovieRepository repository ;
  setUp(()  {
    repository = MockMovieRepository() ;
    usecase = GetTrendingMovies(repository);
  });
  final tMovieList = [
    Movie(id: "1", overview: "overview 1", title:"title 1", posterPath:"posterPath 1"),
    Movie(id: "2", overview: "overview 2", title:"title 2", posterPath:"posterPath 2"),
  ];
test('should get trending movies from api ', () async {
  //arrange
  when(repository.getTrendingMovies()).thenAnswer((_)async => tMovieList);
  //action
  final result  = await usecase();
  //assert
  expect(result, tMovieList);
  verify(repository.getTrendingMovies());
  verifyNoMoreInteractions(repository);
  });
}
