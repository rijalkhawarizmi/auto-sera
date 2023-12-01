import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/create_user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required CreateUser createUser})
      : _createUser = createUser,
        super(AuthenticationInitial()) {
    on<EventAuthentication>(_createUsersHandler);
  }

  final CreateUser _createUser;

  Future<void> _createUsersHandler(
      EventAuthentication event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());

    final result = await _createUser(
        CreateUserParams(email: event.email, password: event.password));
    result.fold((failure) {
     return emit(AuthenticationError(
          '${failure.statusCode}' 'Error: ${failure.errorMessage}'));
    }, (_) {
     return emit(AuthenticationSuccess());
    });
  }
}
