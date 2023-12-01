import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../datasources/authentication_remote_data_source.dart';

class AuthenticationRepositoryImplementation extends AuthenticationRepository {
  AuthenticationRepositoryImplementation(this._authenticationRemoteDataSource);

  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;

  @override
  ResultVoid createUser(
      {
      required String email,
      required String password}) async {
    // TODO: implement createUser
    try {
      await _authenticationRemoteDataSource.createUser(
 email: email, password: password);
      return Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
  
 
 
  }

