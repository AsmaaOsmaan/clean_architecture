import 'package:clean_architecture_app/app/app_prefrences.dart';
import 'package:clean_architecture_app/app/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


 const String APPLICATION_JSON="application/json";
 const String CONTENT_TYPE="content_type";
 const String ACCEPT="accept";
 const String AUTHORIZATION="authorization";
 const String DEFAULT_LANGUAGE="language";

class DioFactory{
AppPreferences _appPreferences;
DioFactory(this._appPreferences);


Future<Dio>getDio()async{
String language=await _appPreferences.getAppLanguage();
  Dio dio=Dio();
  Map<String,String>headers={
    CONTENT_TYPE:APPLICATION_JSON,
    ACCEPT:APPLICATION_JSON,
    AUTHORIZATION:Constants.token,
    DEFAULT_LANGUAGE:language


  };
  dio.options=BaseOptions(
baseUrl: Constants.baseUrl,
    headers: headers,
    receiveTimeout: Constants.apiTimeOut,
    sendTimeout: Constants.apiTimeOut
  );

  if(!kReleaseMode){
    dio.interceptors.add(PrettyDioLogger( requestBody: true,requestHeader: true,responseHeader: true));
  }
return dio;
}
}