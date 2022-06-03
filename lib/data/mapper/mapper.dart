import 'package:hotel_booking/data/responses/responses.dart';
import 'package:hotel_booking/domain/models/models.dart';
import '../../app/extensions.dart';

extension AuthDataRespnseMapper on AuthDataResponse? {
  AuthData toDomain() {
    return AuthData(
      id: this?.id.orEmpty() ?? "",
      userName: this?.name.orEmpty() ?? "",
      email: this?.email.orEmpty() ?? "",
      token: this?.token.orEmpty() ?? "",
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      data: this?.data.toDomain(),
      message: this?.message.orEmpty() ?? "",
    );
  }
}

extension HotelDataResponseMapper on HotelDataResponse? {
  HotelData toDomain() {
    return HotelData(
      id: this?.id.orEmpty() ?? "",
      name: this?.name.orEmpty() ?? "",
      title: this?.title.orEmpty() ?? "",
      desc: this?.desc.orEmpty() ?? "",
      type: this?.type.orEmpty() ?? "",
      city: this?.city.orEmpty() ?? "",
      url: this?.url.orEmpty() ?? "",
      address: this?.address.orEmpty() ?? "",
      distance: this?.distance.orEmpty() ?? "",
      photos: this?.photos?.map((photo) => photo.orEmpty()).toList() ?? [],
      lat: this?.lat.orZero() ?? 0.0,
      long: this?.long.orZero() ?? 0.0,
      cheapestPrice: this?.cheapestPrice.orZero() ?? 0,
    );
  }
}

extension HotelsResponseMapper on HotelsReponse? {
  Hotels toDomain() {
    return Hotels(
      data: this?.data?.map((hotel) => hotel.toDomain()).toList() ?? [],
      message: this?.message.orEmpty() ?? "",
    );
  }
}

extension ChangeHotelFavStateResponseMapper on ChangeHotelFavStateResponse? {
  ChangeHotelFavState toDomain() {
    return ChangeHotelFavState();
  }
}

extension FavouriteHotelsResponseMapper on FavouriteHotelsResponse? {
  FavouriteHotels toDomain() {
    return FavouriteHotels(
        hotels: this?.hotels?.map((hotel) => hotel.orEmpty()).toList() ?? []);
  }
}
