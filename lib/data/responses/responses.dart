import 'package:json_annotation/json_annotation.dart';

part "responses.g.dart";

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status")
  int? status;
}

@JsonSerializable()
class AuthDataResponse {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "username")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "token")
  final String? token;
  AuthDataResponse({
    this.name,
    this.email,
    this.token,
    this.id,
  });
  factory AuthDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthDataResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "data")
  final AuthDataResponse? data;
  AuthenticationResponse({
    this.data,
  });
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class HotelDataResponse {
  @JsonKey(name: "_id")
  final String id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "desc")
  final String? desc;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "distance")
  final String? distance;
  @JsonKey(name: "photos")
  final List<String>? photos;
  @JsonKey(name: "cheapestPrice")
  final int? cheapestPrice;
  @JsonKey(name: "lat")
  final double? lat;
  @JsonKey(name: "long")
  final double? long;
  HotelDataResponse({
    required this.id,
    this.name,
    this.title,
    this.desc,
    this.type,
    this.city,
    this.address,
    this.distance,
    this.photos,
    this.cheapestPrice,
    this.lat,
    this.long,
  });

  factory HotelDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HotelDataResponseFromJson(json);

  Map<String, dynamic> tojson() => _$HotelDataResponseToJson(this);
}

@JsonSerializable()
class HotelsReponse extends BaseResponse {
  @JsonKey(name: "data")
  final List<HotelDataResponse>? data;
  HotelsReponse({
    this.data,
  });

  factory HotelsReponse.fromJson(Map<String, dynamic> json) =>
      _$HotelsReponseFromJson(json);

  Map<String, dynamic> tojson() => _$HotelsReponseToJson(this);
}

@JsonSerializable()
class ChangeHotelFavStateResponse extends BaseResponse {
  ChangeHotelFavStateResponse();
  factory ChangeHotelFavStateResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeHotelFavStateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeHotelFavStateResponseToJson(this);
}

@JsonSerializable()
class FavouriteHotelsResponse extends BaseResponse {
  @JsonKey(name: "data")
  final List<String>? hotels;
  FavouriteHotelsResponse({required this.hotels});
  factory FavouriteHotelsResponse.fromJson(Map<String, dynamic> json) =>
      _$FavouriteHotelsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteHotelsResponseToJson(this);
}
