import 'package:hotel_booking/data/network/app_api.dart';
import 'package:hotel_booking/data/network/requests.dart';

import '../responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<AuthenticationResponse> signUp(SignUpRequest signUpRequest);
  Future<HotelsReponse> getHotels(HotelsRequest hotelsRequest);
  Future<ChangeHotelFavStateResponse> changeHotelFavState(
      ChangeHotelFavStateRequest addToFavouriteRequest);
  Future<FavouriteHotelsResponse> getFavouriteHotels(
      GetFavHotelsRequest getFavHotelsRequest);
  Future<HotelsReponse> searchForHotels(
      SearchForHotelsRequest searchForHotelsRequest);
  Future<ForgotPasswordResponse> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest);
  Future<ResetPasswordResponse> resetPassword(
      ResetPasswordRequest resetPasswordRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<AuthenticationResponse> signUp(SignUpRequest signUpRequest) async {
    return await _appServiceClient.signUp(
        signUpRequest.userName, signUpRequest.email, signUpRequest.password);
  }

  @override
  Future<HotelsReponse> getHotels(HotelsRequest hotelsRequest) async {
    return await _appServiceClient.getHotels(
      hotelsRequest.featured,
      hotelsRequest.minAmount,
      hotelsRequest.maxAmount,
      hotelsRequest.limit,
    );
  }

  @override
  Future<ChangeHotelFavStateResponse> changeHotelFavState(
      ChangeHotelFavStateRequest addToFavouriteRequest) async {
    return await _appServiceClient.changeHotelFaveState(
        addToFavouriteRequest.userId, addToFavouriteRequest.hotelId);
  }

  @override
  Future<FavouriteHotelsResponse> getFavouriteHotels(
      GetFavHotelsRequest getFavHotelsRequest) async {
    return await _appServiceClient
        .getFavouriteHotels(getFavHotelsRequest.userId);
  }

  @override
  Future<HotelsReponse> searchForHotels(
      SearchForHotelsRequest searchForHotelsRequest) async {
    return await _appServiceClient
        .searchForHotels(searchForHotelsRequest.hotelName);
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    return await _appServiceClient.forgotPassword(
        forgotPasswordRequest.email, forgotPasswordRequest.dynamicLink);
  }

  @override
  Future<ResetPasswordResponse> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    return await _appServiceClient.resetPassword(resetPasswordRequest.id,
        resetPasswordRequest.token, resetPasswordRequest.password);
  }
}

/*
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InltODM3MDMwMkBnbWFpbC
5jb20iLCJpZCI6IjYyOWNkNzFkYjgyNTRkZjQ1M2MzODAyMCIsImlhdCI6MTY1NDQ2MTc0OS
wiZXhwIjoxNjU0NDYyNjQ5fQ.TPPFqAsLXwEIHJyWaWAdBey2j0U6vGMSN8TtlholTGs
*/