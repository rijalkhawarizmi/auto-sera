import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/authentication_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  ResultVoid createUser(
          {required String email,
          required String password,
          required String avatar}) async =>
      _repository.createUser(email: email, password: password);

  @override
  ResultFuture call(CreateUserParams createUserParams) {
    // TODO: implement call
    return _repository.createUser(
        email: createUserParams.email, 
        password: createUserParams.password);
  }
}

class CreateUserParams extends Equatable {
  final String email;
  final String password;
  

  const CreateUserParams(
      {required this.email, required this.password});
  
  
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
}
