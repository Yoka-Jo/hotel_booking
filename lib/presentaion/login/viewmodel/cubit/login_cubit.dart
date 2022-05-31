import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/data/network/requests.dart';
import 'package:hotel_booking/domain/models/models.dart';
import 'package:hotel_booking/presentaion/auth_type/viewmodel/cubit/authentication_cubit.dart';
import '../../../../app/dependency_injection.dart';
import '../../../../app/functions.dart';
import '../../../../domain/usecases/login_usecase.dart';
import '../../../common/freezed/freezed_data_classes.dart';
import '../../../common/state_renderer/state_renderer.dart';
import '../../../common/state_renderer/state_renderer_impl.dart';
import '../../../resources/strings_manager.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._useCase,
  ) : super(LoginInitial());

  final AuthenticationCubit _auth = instance<AuthenticationCubit>();
  final LoginUseCase _useCase;

  static LoginCubit get(BuildContext context) =>
      BlocProvider.of<LoginCubit>(context);

  LoginObject loginObject = LoginObject(email: "", password: "");
  FlowState currentState = ContentState();
  bool areInputsValid = false;
  String? errorEmail;
  String? errorPassword;

  void setEmail(String email) {
    if (isEmailValid(email)) {
      loginObject = loginObject.copyWith(email: email);
      errorEmail = null;
    } else {
      loginObject = loginObject.copyWith(email: "");
      errorEmail = AppStrings.emailInvalid.tr();
    }
    validate();
  }

  void setPassword(String password) {
    if (password.length >= 5) {
      loginObject = loginObject.copyWith(password: password);
      errorPassword = null;
    } else {
      loginObject = loginObject.copyWith(password: "");
      errorPassword = AppStrings.passwordInvalid.tr();
    }
    validate();
  }

  void validate() {
    areInputsValid =
        loginObject.email.isNotEmpty && loginObject.password.isNotEmpty;
    noChangeInFlowState();
    emit(LoginValidateInputsState());
  }

  void login(BuildContext context) async {
    currentState =
        LoadingState(stateRendererType: StateRendererType.popupLoadingState);
    emit(LoginLoadingState());
    var result = await _useCase(
        LoginRequest(email: loginObject.email, password: loginObject.password));
    result.fold((failure) {
      currentState =
          ErrorState(StateRendererType.popupErrorState, failure.message);
      emit(LoginErrorState());
    }, (data) {
      if (currentState is LoadingState) {
        Navigator.of(context).pop();
      }
      noChangeInFlowState();
      emit(LogInSuccessfullyState(data));
    });
  }

  void noChangeInFlowState() => currentState = ContentState();

  void autoLogOut(BuildContext context) {
    _auth.autoLogout();
  }
}
