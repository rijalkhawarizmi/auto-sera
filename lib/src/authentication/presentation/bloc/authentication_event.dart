part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class EventAuthentication extends AuthenticationEvent{

  final String email;
  final String password;

  const EventAuthentication({required this.email,required this.password});

  List<Object> get props => [email,password];

}

class GetUserEvent extends AuthenticationEvent{
  const GetUserEvent();
}
