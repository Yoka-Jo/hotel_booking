part of 'reset_password_cubit.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordErrorState extends ResetPasswordState {}

class ResetPasswordSuccessfullyState extends ResetPasswordState {}

class ResetPasswordValidateInputState extends ResetPasswordState {}
