part of 'forgot_password_cubit.dart';

abstract class ForgotPasswordState {}

class ForgetPasswordInitial extends ForgotPasswordState {}

class ForgetPasswordLoadingState extends ForgotPasswordState {}

class ForgetPasswordErrorState extends ForgotPasswordState {}

class ForgetPasswordSuccsessfullyState extends ForgotPasswordState {
  final ForgotPassword forgotPassword;
  ForgetPasswordSuccsessfullyState({
    required this.forgotPassword,
  });
}

class ForgotPassworValidateInputsState extends ForgotPasswordState {}
