import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotel_booking/data/network/requests.dart';
import 'package:hotel_booking/domain/models/models.dart';
import 'package:hotel_booking/domain/usecases/forgot_password_usecase.dart';
import 'package:hotel_booking/presentaion/common/freezed/freezed_data_classes.dart';
import 'package:hotel_booking/presentaion/common/helpers/dynamic_link_helper.dart';
import 'package:hotel_booking/presentaion/common/state_renderer/state_renderer.dart';
import 'package:provider/provider.dart';

import '../../../app/functions.dart';
import '../../common/state_renderer/state_renderer_impl.dart';
import '../../resources/strings_manager.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase _useCase;
  ForgotPasswordCubit(this._useCase) : super(ForgetPasswordInitial());

  static ForgotPasswordCubit get(BuildContext context) =>
      Provider.of<ForgotPasswordCubit>(context);

  ForgotPasswordObject forgotPasswordObject = ForgotPasswordObject(email: "");
  final DynamicLinkHelper _dynamicLinkHelper = DynamicLinkHelper();
  late ForgotPassword forgotPassword;
  FlowState currentState = ContentState();
  bool isInputValid = false;
  String? errorEmail;

  void setEmail(String email) {
    if (isEmailValid(email)) {
      forgotPasswordObject = forgotPasswordObject.copyWith(email: email);
      errorEmail = null;
    } else {
      forgotPasswordObject = forgotPasswordObject.copyWith(email: "");
      errorEmail = AppStrings.emailInvalid.tr();
    }
    validate();
  }

  void validate() {
    isInputValid = forgotPasswordObject.email.isNotEmpty;
    currentState = ContentState();
    emit(ForgotPassworValidateInputsState());
  }

  Future<void> submitForgotPassword(BuildContext context) async {
    currentState =
        LoadingState(stateRendererType: StateRendererType.popupLoadingState);
    emit(ForgetPasswordLoadingState());
    log(forgotPasswordObject.email);
    Uri dynamicLink = await _dynamicLinkHelper.createDynamicLink();
    final result = await _useCase(
      ForgotPasswordRequest(
        email: forgotPasswordObject.email,
        dynamicLink: dynamicLink.toString(),
      ),
    );
    result.fold((failure) {
      currentState =
          ErrorState(StateRendererType.popupErrorState, failure.message);
      emit(ForgetPasswordErrorState());
    }, (response) {
      if (currentState is LoadingState) {
        Navigator.of(context).pop();
      }
      currentState = ContentState();
      emit(ForgetPasswordSuccsessfullyState(forgotPassword: response));
    });
  }
}
