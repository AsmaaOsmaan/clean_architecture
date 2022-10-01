import 'package:clean_architecture_app/data/network/requestes.dart';
import 'package:clean_architecture_app/domain/models/models.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';

abstract class Repository{
Future<Either<Failure,Authentication> > Login(LoginRequest loginRequest);
}