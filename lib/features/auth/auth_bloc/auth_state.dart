part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loginSuccess,
  registerSuccess,
  error,
}

class AuthState {
  final AuthStatus status;

  final bool loginLoading;
  final bool registerLoading;

  final String? loginError;
  final String? registerError;

  AuthState({
    this.status = AuthStatus.initial,
    this.loginLoading = false,
    this.registerLoading = false,
    this.loginError,
    this.registerError,
  });

  AuthState copyWith({
    AuthStatus? status,
    bool? loginLoading,
    bool? registerLoading,
    String? loginError,
    String? registerError,
  }) {
    return AuthState(
      status: status ?? this.status,
      loginLoading: loginLoading ?? this.loginLoading,
      registerLoading: registerLoading ?? this.registerLoading,
      loginError: loginError ?? this.loginError,
      registerError: registerError ?? this.registerError,
    );
  }
}
