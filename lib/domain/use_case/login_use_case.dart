import 'package:clean_architecture_app/data/network/failure.dart';
import 'package:clean_architecture_app/data/network/requestes.dart';
import 'package:clean_architecture_app/domain/models/models.dart';
import 'package:clean_architecture_app/domain/repositories/repository.dart';
import 'package:clean_architecture_app/domain/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput,Authentication>{
Repository _repository;
LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) async{
   return await _repository.Login(LoginRequest(input.email, (input.password)));
  }
}
class LoginUseCaseInput{
  String email;
  String password;
  LoginUseCaseInput(this.email,this.password);
}