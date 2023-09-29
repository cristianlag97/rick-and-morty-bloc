import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../domain/domain.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final KeyValueStorageService keyValueStorageService;
  AuthBloc(this.keyValueStorageService) : super(const AuthState()) {
    on<LoginUserEvent>(_handleLoginUser);
    on<UpdateUserEvent>(_handleUpdateUser);
    checkAuthStatus();
  }

  void _handleLoginUser(LoginUserEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(user: event.user));
  }

  void _handleUpdateUser(UpdateUserEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(user: event.user, authStatus: event.authStatus));
  }

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = User(name: 'Cristian laguna', email: email, token: 'token');
      _setLoggerUser(user);
    } catch (e) {
      logout();
    }
  }

  void checkAuthStatus() async {
    final token = await keyValueStorageService.getValue<String>('token');

    if (token == null) return logout();

    try {
      final user = User(
        name: 'Cristian Laguna',
        email: 'prueba@gmail.com',
        token: 'token',
      ); //=> EP validate
      _setLoggerUser(user);
    } catch (e) {
      logout();
    }
  }

  void _setLoggerUser(User user) async {
    await keyValueStorageService.setKeyValue('token', user.token);
    add(UpdateUserEvent(authStatus: AuthStatus.authenticated, user: user));
  }

  Future<void> logout() async {
    await keyValueStorageService.removeKey('token');
    add(const UpdateUserEvent(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
    ));
  }
}
