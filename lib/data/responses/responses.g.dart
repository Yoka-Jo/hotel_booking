// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..message = json['message'] as String?
  ..status = json['status'] as int?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };

AuthDataResponse _$AuthDataResponseFromJson(Map<String, dynamic> json) =>
    AuthDataResponse(
      name: json['username'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$AuthDataResponseToJson(AuthDataResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.name,
      'email': instance.email,
      'token': instance.token,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      data: json['data'] == null
          ? null
          : AuthDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..status = json['status'] as int?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

HotelDataResponse _$HotelDataResponseFromJson(Map<String, dynamic> json) =>
    HotelDataResponse(
      id: json['_id'] as String,
      name: json['name'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      type: json['type'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      distance: json['distance'] as String?,
      url: json['url'] as String?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      cheapestPrice: json['cheapestPrice'] as int?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HotelDataResponseToJson(HotelDataResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'desc': instance.desc,
      'type': instance.type,
      'city': instance.city,
      'address': instance.address,
      'url': instance.url,
      'distance': instance.distance,
      'photos': instance.photos,
      'cheapestPrice': instance.cheapestPrice,
      'lat': instance.lat,
      'long': instance.long,
    };

HotelsReponse _$HotelsReponseFromJson(Map<String, dynamic> json) =>
    HotelsReponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HotelDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..status = json['status'] as int?;

Map<String, dynamic> _$HotelsReponseToJson(HotelsReponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

ChangeHotelFavStateResponse _$ChangeHotelFavStateResponseFromJson(
        Map<String, dynamic> json) =>
    ChangeHotelFavStateResponse()
      ..message = json['message'] as String?
      ..status = json['status'] as int?;

Map<String, dynamic> _$ChangeHotelFavStateResponseToJson(
        ChangeHotelFavStateResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };

FavouriteHotelsResponse _$FavouriteHotelsResponseFromJson(
        Map<String, dynamic> json) =>
    FavouriteHotelsResponse(
      hotels:
          (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    )
      ..message = json['message'] as String?
      ..status = json['status'] as int?;

Map<String, dynamic> _$FavouriteHotelsResponseToJson(
        FavouriteHotelsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.hotels,
    };

ForgotPasswordDataResponse _$ForgotPasswordDataResponseFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordDataResponse(
      json['id'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$ForgotPasswordDataResponseToJson(
        ForgotPasswordDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
    };

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordResponse(
      data: json['data'] == null
          ? null
          : ForgotPasswordDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..status = json['status'] as int?;

Map<String, dynamic> _$ForgotPasswordResponseToJson(
        ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

ResetPasswordResponse _$ResetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponse()
      ..message = json['message'] as String?
      ..status = json['status'] as int?;

Map<String, dynamic> _$ResetPasswordResponseToJson(
        ResetPasswordResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
