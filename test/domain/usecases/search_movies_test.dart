

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/usecases/search_moives.dart';

import 'get_trending_movies_test.mocks.dart';

void main() {

  late MockMovieRepository repository ;
  late SearchMovies usecase ;
  setUp(() {
    repository = MockMovieRepository() ;
    usecase  = SearchMovies(repository);
  });
  final tquery = 'inception' ;
  final tMovieList = [
    Movie(id: "1", overview: "overview 1", title:"title 1", posterPath:"posterPath 1"),
    Movie(id: "2", overview: "overview 2", title:"title 2", posterPath:"posterPath 2"),
  ];
  test('should get searched movies from repository ', () async {
    //arrange
    when(repository.searchMovie(tquery)).thenAnswer((_)async => tMovieList);
    //action
    final result  = await usecase(tquery);
    //assert
    expect(result, tMovieList);
    verify(repository.searchMovie(tquery));
    verifyNoMoreInteractions(repository);
  });
  
}