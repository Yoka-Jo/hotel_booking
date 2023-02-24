import 'dart:developer';
import 'package:hotel_booking/data/data_source/remote_data_source.dart';
import 'package:hotel_booking/data/mapper/mapper.dart';
import 'package:hotel_booking/data/network/error_handler.dart';
import 'package:hotel_booking/domain/models/models.dart';
import 'package:hotel_booking/data/network/requests.dart';
import 'package:hotel_booking/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:hotel_booking/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    try {
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 200) {
        return Right(response.toDomain());
      } else {
        return Left(
          Failure(
            code: response.status ?? 0,
            message: response.message ?? ResponseMessage.defaultt,
          ),
        );
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Authentication>> signUp(
      SignUpRequest signUpRequest) async {
    try {
      final response = await _remoteDataSource.signUp(signUpRequest);
      if (response.status == 201) {
        return Right(response.toDomain());
      } else {
        return Left(
          Failure(
            code: response.status ?? 0,
            message: response.message ?? ResponseMessage.defaultt,
          ),
        );
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Hotels>> getHotels(HotelsRequest hotelsRequest) async {
    try {
      final response = await _remoteDataSource.getHotels(hotelsRequest);
      if (response.status == 200) {
        return Right(response.toDomain());
      } else {
        return Left(
          Failure(
            code: response.status ?? 0,
            message: response.message ?? ResponseMessage.defaultt,
          ),
        );
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, ChangeHotelFavState>> changeHotelFavState(
      ChangeHotelFavStateRequest addToFavouriteRequest) async {
    try {
      final response =
          await _remoteDataSource.changeHotelFavState(addToFavouriteRequest);
      log(response.toString());
      if (response.status == 201) {
        return Right(response.toDomain());
      } else {
        return Left(
          Failure(
            code: response.status ?? 0,
            message: response.message ?? ResponseMessage.defaultt,
          ),
        );
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, FavouriteHotels>> getFavouriteHotels(
      GetFavHotelsRequest getFavHotelsRequest) async {
    try {
      final response =
          await _remoteDataSource.getFavouriteHotels(getFavHotelsRequest);
      if (response.status == 200) {
        return Right(response.toDomain());
      } else {
        log("======>${response.message}");
        return Left(
          Failure(
            code: response.status ?? 0,
            message: response.message ?? ResponseMessage.defaultt,
          ),
        );
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Hotels>> searchForHotels(
      SearchForHotelsRequest hotelName) async {
    try {
      final response = await _remoteDataSource.searchForHotels(hotelName);
      if (response.status == 200) {
        return Right(response.toDomain());
      } else {
        return Left(
          Failure(
            code: response.status ?? 0,
            message: response.message ?? ResponseMessage.defaultt,
          ),
        );
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, ForgotPassword>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    try {
      final response =
          await _remoteDataSource.forgotPassword(forgotPasswordRequest);
      log(response.toString());
      if (response.status == 200) {
        return Right(response.toDomain());
      } else {
        return Left(
          Failure(
            code: response.status ?? 0,
            message: response.message ?? ResponseMessage.defaultt,
          ),
        );
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, ResetPassword>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    try {
      final response =
          await _remoteDataSource.resetPassword(resetPasswordRequest);
      if (response.status == 201) {
        return Right(response.toDomain());
      } else {
        return Left(
          Failure(
            code: response.status ?? 0,
            message: response.message ?? ResponseMessage.defaultt,
          ),
        );
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
