abstract class Models {}

class OnBoardingData {
  final String image;
  final String title;
  final String desc;

  OnBoardingData({
    required this.image,
    required this.title,
    required this.desc,
  });
}

class AuthData {
  final String id;
  final String userName;
  final String email;
  final String token;
  AuthData({
    required this.userName,
    required this.email,
    required this.token,
    required this.id,
  });
}

class Authentication {
  final AuthData? data;
  final String message;
  Authentication({
    required this.data,
    required this.message,
  });
}

class HotelData {
  final String id;
  final String name;
  final String title;
  final String desc;
  final String type;
  final String city;
  final String address;
  final String url;
  final String distance;
  final double lat;
  final double long;
  final List<String> photos;
  final int cheapestPrice;
  HotelData({
    required this.id,
    required this.name,
    required this.lat,
    required this.long,
    required this.title,
    required this.desc,
    required this.type,
    required this.city,
    required this.address,
    required this.url,
    required this.distance,
    required this.photos,
    required this.cheapestPrice,
  });
}

class Hotels implements Models {
  final List<HotelData> data;
  final String message;
  Hotels({
    required this.data,
    required this.message,
  });
}

class ChangeHotelFavState {}

class FavouriteHotels {
  final List<String> hotels;
  FavouriteHotels({
    required this.hotels,
  });
}

class Location {
  final double longitude;
  final double latitude;

  Location({required this.longitude, required this.latitude});
}

class ForgotPassword {
  final String id;
  final String token;
  ForgotPassword({
    required this.id,
    required this.token,
  });
}

class ResetPassword {
  final String message;
  ResetPassword({required this.message});
}
