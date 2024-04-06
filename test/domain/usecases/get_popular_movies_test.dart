
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/usecases/get_popular_movies.dart';

import 'get_trending_movies_test.mocks.dart';

void main() {
  late MockMovieRepository repository ;
  late GetPopularMovies usecase ;
  setUp(() {
    repository = MockMovieRepository() ;
    usecase  = GetPopularMovies(repository);
  });


  final tMovieList = [
    Movie(id: "1", overview: "overview 1", title:"title 1", posterPath:"posterPath 1"),
    Movie(id: "2", overview: "overview 2", title:"title 2", posterPath:"posterPath 2"),
  ];

  test('should get popular movies from api ', () async {
    //arrange
    when(repository.getPopularMovies()).thenAnswer((_)async => tMovieList);
    //action
    final result  = await usecase();
    //assert
    expect(result, tMovieList);
    verify(repository.getPopularMovies());
    verifyNoMoreInteractions(repository);
  });
}