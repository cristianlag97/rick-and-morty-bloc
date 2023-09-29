import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../shared/infraestructure/inputs/inputs.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final Function(String, String) loginUserCallback;
  LoginFormBloc(this.loginUserCallback) : super(const LoginFormState()) {
    on<EmailValidatorEvent>(_handleEmailValidator);
    on<PasswordValidatorEvent>(_handlePasswordValidator);
    on<LoginIsPostingChangedEvent>(_handleLoginIsPostingchanged);
    on<SubmitLoginEvent>(_handleSubmitLogin);
  }

  void _handleEmailValidator(
      EmailValidatorEvent event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(email: event.email, isValid: event.isValid));
  }

  void _handlePasswordValidator(
      PasswordValidatorEvent event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(password: event.password, isValid: event.isValid));
  }

  void _handleLoginIsPostingchanged(
      LoginIsPostingChangedEvent event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(isPosting: event.isPosting));
  }

  void _handleSubmitLogin(
      SubmitLoginEvent event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(
      isFormPosted: event.isFormPosted,
      email: event.email,
      password: event.password,
      isValid: event.isValid,
    ));
  }

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    add(EmailValidatorEvent(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.password]),
    ));
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    add(PasswordValidatorEvent(
      password: newPassword,
      isValid: Formz.validate([newPassword, state.email]),
    ));
  }

  onformSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;

    add(const LoginIsPostingChangedEvent(true));

    await loginUserCallback(state.email.value, state.password.value);

    Future.delayed(const Duration(milliseconds: 600));
    add(const LoginIsPostingChangedEvent(false));
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    add(SubmitLoginEvent(
      isFormPosted: true,
      email: email,
      password: password,
      isValid: Formz.validate([email, password]),
    ));
  }
}
