part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends AuthEvent {
  final User user;

  const LoginUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class CheckAuthStatusevent extends AuthEvent {
  final String token;

  const CheckAuthStatusevent(this.token);

  @override
  List<Object> get props => [token];
}

class UpdateUserEvent extends AuthEvent {
  final User? user;
  final AuthStatus authStatus;

  const UpdateUserEvent({required this.authStatus, required this.user});

  @override
  List<Object> get props => [authStatus];
}
