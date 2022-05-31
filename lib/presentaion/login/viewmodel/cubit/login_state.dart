part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LogInSuccessfullyState extends LoginState {
  final Authentication authData;

  LogInSuccessfullyState(this.authData);
}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {}

class LoginValidateInputsState extends LoginState {}
