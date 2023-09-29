part of 'auth_bloc.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState extends Equatable {
  const AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
  });

  final AuthStatus authStatus;
  final User? user;

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
      );

  @override
  List<Object> get props => [authStatus];
}
