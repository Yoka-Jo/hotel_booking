part of 'signup_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpSuccessfullyState extends SignUpState {
  final Authentication authData;

  SignUpSuccessfullyState(this.authData);
}

class SignUpLoadingState extends SignUpState {}

class SignUpErrorState extends SignUpState {}

class SignUpValidateInputsState extends SignUpState {}
