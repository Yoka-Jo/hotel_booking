import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking/domain/usecases/change_hotel_fav_state_usecase.dart';
import 'package:hotel_booking/domain/usecases/forgot_password_usecase.dart';
import 'package:hotel_booking/domain/usecases/get_hotels_usecase.dart';
import 'package:hotel_booking/domain/usecases/search_for_hotels_usecase.dart';
import 'package:hotel_booking/presentaion/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:hotel_booking/presentaion/main/cubit/main_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/repository/repository.dart';
import '../domain/repository/repository.dart';
import '../domain/usecases/get_favourite_hotels_usecase.dart';
import '../domain/usecases/login_usecase.dart';
import '../domain/usecases/reset_password_usecase.dart';
import '../domain/usecases/signup_usecase.dart';
import '../presentaion/auth_type/authentication/auto_authentication.dart';
import '../presentaion/auth_type/viewmodel/helpers/authentication_helper.dart';
import '../presentaion/login/cubit/login_cubit.dart';
import '../presentaion/reset_password/cubit/reset_password_cubit.dart';
import '../presentaion/signup/cubit/signup_cubit.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //! shared prefs instance
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance()));

  instance.registerFactory<AutoAuthentication>(
      () => AutoAuthentication(instance()));

  instance.registerFactory<AuthenticationHelper>(
      () => AuthenticationHelper(instance()));
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));

    instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));
  }
}

void initSignUpModule() {
  if (!GetIt.I.isRegistered<SignUpUseCase>()) {
    instance.registerFactory<SignUpUseCase>(() => SignUpUseCase(instance()));

    instance.registerFactory<SignUpCubit>(() => SignUpCubit(instance()));
  }
}

void initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));

    instance.registerFactory<ForgotPasswordCubit>(
        () => ForgotPasswordCubit(instance()));
  }
}

void initResetPasswordModule() {
  if (!GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.registerFactory<ResetPasswordUseCase>(
        () => ResetPasswordUseCase(instance()));

    instance.registerFactory<ResetPasswordCubit>(
        () => ResetPasswordCubit(instance()));
  }
}

void initHomeModule() {
  if (!GetIt.I.isRegistered<GetHotelsUseCase>()) {
    instance
        .registerFactory<GetHotelsUseCase>(() => GetHotelsUseCase(instance()));

    instance.registerFactory<GetFavouriteHotelsUseCase>(
        () => GetFavouriteHotelsUseCase(instance()));

    instance.registerFactory<ChangeHotelFavStateUseCase>(
        () => ChangeHotelFavStateUseCase(instance()));

    instance.registerFactory<SearchForHotelsUseCase>(
        () => SearchForHotelsUseCase(instance()));

    instance.registerFactory<MainCubit>(
        () => MainCubit(instance(), instance(), instance(), instance()));
  }
}
