part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final UserDataClass user;

  LoginEvent(this.user);
}

class RegisterEvent extends AuthEvent {
  final UserDataClass user;

  RegisterEvent(this.user);
}



class LogoutEvent extends AuthEvent {}
