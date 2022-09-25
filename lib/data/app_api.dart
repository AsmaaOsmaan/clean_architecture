
import 'package:clean_architecture_app/app/constant.dart';
import 'package:clean_architecture_app/data/responses.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient{
factory AppServiceClient(Dio dio,{String baseUrl})=_AppServiceClient;
@POST("/customer/login")
Future<AuthenticationResponse>login(
    @Field("email") String email, @Field("password") String password
    );
}