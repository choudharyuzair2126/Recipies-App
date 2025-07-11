import 'package:dio/dio.dart';
import 'package:recipie_app/Services/recipiemodel.dart';
import 'package:retrofit/retrofit.dart';

part 'apiservices.g.dart';

@RestApi(baseUrl: 'https://www.themealdb.com/api/json/v1/1')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/search.php?s')
  Future<RecipieApi> getRecipie();
}
