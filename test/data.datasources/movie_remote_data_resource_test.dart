
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http ;

import 'package:mockito/annotations.dart';
import 'package:movie_app/data/datasrc/movie_remote_data_resource.dart';

import 'movie_remote_data_resource_test.mocks.dart';
@GenerateNiceMocks([MockSpec<http.Client>()])
void main(){
    late MockClient httpclient ;
    late MovieRemoteDataSource source;
    setUp(() {
      httpclient = MockClient();
      source = MovieRemoteDataSource();
    });

}