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
}
