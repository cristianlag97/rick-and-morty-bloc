part of 'login_form_bloc.dart';

sealed class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  @override
  List<Object> get props => [];
}

class EmailValidatorEvent extends LoginFormEvent {
  final Email email;
  final bool isValid;

  const EmailValidatorEvent({required this.email, required this.isValid});

  @override
  List<Object> get props => [email, isValid];
}

class PasswordValidatorEvent extends LoginFormEvent {
  final Password password;
  final bool isValid;

  const PasswordValidatorEvent({required this.password, required this.isValid});

  @override
  List<Object> get props => [password, isValid];
}

class LoginIsPostingChangedEvent extends LoginFormEvent {
  final bool isPosting;

  const LoginIsPostingChangedEvent(this.isPosting);

  @override
  List<Object> get props => [isPosting];
}

class SubmitLoginEvent extends LoginFormEvent {
  final bool isFormPosted;
  final Email email;
  final Password password;
  final bool isValid;

  const SubmitLoginEvent({
    required this.isFormPosted,
    required this.email,
    required this.password,
    required this.isValid,
  });

  @override
  List<Object> get props => [
        isFormPosted,
        email,
        password,
        isValid,
      ];
}
