import 'package:clean_architecture_app/data/data_source/remote_data_source.dart';
import 'package:clean_architecture_app/data/mapper/mapper.dart';
import 'package:clean_architecture_app/data/network/error_handler.dart';
import 'package:clean_architecture_app/data/network/failure.dart';
import 'package:clean_architecture_app/data/network/network_info.dart';
import 'package:clean_architecture_app/data/network/requestes.dart';
import 'package:clean_architecture_app/domain/models/models.dart';
import 'package:clean_architecture_app/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository{
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._networkInfo,this._remoteDataSource);


  @override
  Future<Either<Failure, Authentication>> Login(LoginRequest loginRequest)async {
   if(await _networkInfo.isConnected ){
     // it is connected to internet , it is safe to call api
try{
  final response=await _remoteDataSource.login(loginRequest);
  if(response.statues==ApiInternalStatues.SUCCESS){
    //success
    // return either right
    //return data
    return Right(response.toDomain());
  }
  else{
    // failure
    //return business error
    //return either left
    return Left(Failure(ApiInternalStatues.SUCCESS,response.message??ResponseMessage.DEFUALT));
  }
}
catch(error){
  return Left(ErrorHandler.handle(error).failure);

}
   }
   else{
     //return internet connection error
     //return either left
     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());

   }
  }

}