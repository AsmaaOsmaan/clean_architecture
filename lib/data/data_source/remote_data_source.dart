import 'package:clean_architecture_app/data/app_api.dart';
import 'package:clean_architecture_app/data/network/requestes.dart';
import 'package:clean_architecture_app/data/responses.dart';
import 'package:flutter/material.dart';

abstract class RemoteDataSource{
  Future<AuthenticationResponse>login(LoginRequest loginRequest);

}
class RemoDataSourceImp implements RemoteDataSource{
  final AppServiceClient _appServiceClient;
  RemoDataSourceImp(this._appServiceClient);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest)async {
   return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }
  
}