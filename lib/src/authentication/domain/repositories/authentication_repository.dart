
import '../../../../core/utils/typedef.dart';
import '../entities/user.dart';

abstract class AuthenticationRepository{
 const AuthenticationRepository();

 ResultVoid createUser({required String email,required String password});


}