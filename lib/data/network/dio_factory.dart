import 'package:clean_architecture_app/app/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory{

static const String APPLICATION_JSON="application/json";
static const String CONTENT_TYPE="content_type";
static const String ACCEPT="accept";
static const String AUTHORIZATION="authorization";
static const String DEFAULT_LANGUAGE="language";

Future<Dio>getDio()async{

  Dio dio=Dio();
  Map<String,String>headers={
    CONTENT_TYPE:APPLICATION_JSON,
    ACCEPT:APPLICATION_JSON,
    AUTHORIZATION:Constants.token,
    DEFAULT_LANGUAGE:"en"


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