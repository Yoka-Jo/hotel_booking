import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/data/network/requests.dart';
import 'package:hotel_booking/domain/models/models.dart';
import '../../../../app/functions.dart';
import '../../../../domain/usecases/signup_usecase.dart';
import '../../common/freezed/freezed_data_classes.dart';
import '../../common/state_renderer/state_renderer.dart';
import '../../common/state_renderer/state_renderer_impl.dart';
import '../../resources/strings_manager.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(
    this._useCase,
  ) : super(SignUpInitial());

  final SignUpUseCase _useCase;

  static SignUpCubit get(BuildContext context) =>
      BlocProvider.of<SignUpCubit>(context);

  SignUpObject signUpObject =
      SignUpObject(userName: "", email: "", password: "");
  FlowState currentState = ContentState();
  bool areInputsValid = false;
  String? errorName;
  String? errorEmail;
  String? errorPassword;

  void setName(String userName) {
    if (userName.length >= 4) {
      signUpObject = signUpObject.copyWith(userName: userName);
      errorName = null;
    } else {
      signUpObject = signUpObject.copyWith(userName: "");
      errorName = AppStrings.nameInvalid.tr();
    }
    validate();
  }

  void setEmail(String email) {
    if (isEmailValid(email)) {
      signUpObject = signUpObject.copyWith(email: email);
      errorEmail = null;
    } else {
      signUpObject = signUpObject.copyWith(email: "");
      errorEmail = AppStrings.emailInvalid.tr();
    }
    validate();
  }

  void setPassword(String password) {
    if (isPasswordValid(password)) {
      signUpObject = signUpObject.copyWith(password: password);
      errorPassword = null;
    } else {
      signUpObject = signUpObject.copyWith(password: "");
      errorPassword = AppStrings.passwordInvalid.tr();
    }
    validate();
  }

  void validate() {
    areInputsValid = signUpObject.userName.isNotEmpty &&
        signUpObject.email.isNotEmpty &&
        signUpObject.password.isNotEmpty;
    noChangeInFlowState();
    emit(SignUpValidateInputsState());
  }

  void signUp(BuildContext context) async {
    currentState =
        LoadingState(stateRendererType: StateRendererType.popupLoadingState);
    emit(SignUpLoadingState());
    var result = await _useCase(
      SignUpRequest(
        userName: signUpObject.userName,
        email: signUpObject.email,
        password: signUpObject.password,
      ),
    );
    result.fold((failure) {
      currentState =
          ErrorState(StateRendererType.popupErrorState, failure.message);
      emit(SignUpErrorState());
    }, (data) {
      if (currentState is LoadingState) {
        Navigator.of(context).pop();
      }
      noChangeInFlowState();
      emit(SignUpSuccessfullyState(data));
    });
  }

  void noChangeInFlowState() => currentState = ContentState();
}
