import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotel_booking/app/app_prefs.dart';
import 'package:hotel_booking/app/functions.dart';
import 'package:hotel_booking/data/network/requests.dart';
import 'package:hotel_booking/domain/usecases/reset_password_usecase.dart';
import 'package:hotel_booking/presentaion/common/freezed/freezed_data_classes.dart';
import 'package:provider/provider.dart';
import '../../../app/dependency_injection.dart';
import '../../common/state_renderer/state_renderer.dart';
import '../../common/state_renderer/state_renderer_impl.dart';
import '../../resources/strings_manager.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _useCase;
  ResetPasswordCubit(this._useCase) : super(ResetPasswordInitial());
  static ResetPasswordCubit get(BuildContext context) => Provider.of(context);

  final AppPreferences _appPrefs = instance<AppPreferences>();
  FlowState currentState = ContentState();
  ResetPasswordObject resetPasswordObject =
      ResetPasswordObject(password: "", confirmPassword: "");
  bool areInputsValid = false;
  String? errorPassword;
  String? errorConfirmPassword;

  void setPassword(String password) {
    if (isPasswordValid(password)) {
      resetPasswordObject = resetPasswordObject.copyWith(password: password);
      errorPassword = null;
    } else {
      resetPasswordObject = resetPasswordObject.copyWith(password: "");
      errorPassword = AppStrings.passwordInvalid.tr();
    }
    validate();
  }

  void setConfirmPassword(String confirmPassword) {
    if (resetPasswordObject.password == confirmPassword) {
      resetPasswordObject =
          resetPasswordObject.copyWith(confirmPassword: confirmPassword);
      errorConfirmPassword = null;
    } else {
      resetPasswordObject = resetPasswordObject.copyWith(confirmPassword: "");
      errorConfirmPassword = AppStrings.passwordAndConfirmPasswordNotEqual.tr();
    }
    validate();
  }

  void validate() {
    areInputsValid = resetPasswordObject.password.isNotEmpty &&
        resetPasswordObject.confirmPassword.isNotEmpty;
    currentState = ContentState();
    emit(ResetPasswordValidateInputState());
  }

  Future<void> resetPassword(BuildContext context) async {
    currentState =
        LoadingState(stateRendererType: StateRendererType.popupLoadingState);
    emit(ResetPasswordLoadingState());

    final data = _appPrefs.getForgotPasswordData();
    final result = await _useCase(ResetPasswordRequest(
      id: data["userId"],
      password: resetPasswordObject.password,
      token: data["token"],
    ));
    result.fold((failure) {
      currentState =
          ErrorState(StateRendererType.popupErrorState, failure.message);
      emit(ResetPasswordErrorState());
    }, (data) {
      if (currentState is LoadingState) {
        Navigator.of(context).pop();
      }
      currentState = ContentState();
      emit(ResetPasswordSuccessfullyState());
    });
  }
}
