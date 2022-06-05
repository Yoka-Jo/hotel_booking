import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject({required String email, required String password}) =
      _LoginObject;
}

@freezed
class SignUpObject with _$SignUpObject {
  factory SignUpObject({
    required String userName,
    required String email,
    required String password,
  }) = _SignUpObject;
}

@freezed
class ResetPasswordObject with _$ResetPasswordObject {
  factory ResetPasswordObject(
      {required String password,
      required String confirmPassword}) = _ResetPasswordObject;
}

@freezed
class ForgotPasswordObject with _$ForgotPasswordObject {
  factory ForgotPasswordObject({
    required String email,
  }) = _ForgotPasswordObject;
}
