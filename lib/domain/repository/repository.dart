import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../models/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, Authentication>> signUp(SignUpRequest signUpRequest);
  Future<Either<Failure, Hotels>> getHotels(HotelsRequest hotelsRequest);
  Future<Either<Failure, ChangeHotelFavState>> changeHotelFavState(
      ChangeHotelFavStateRequest addToFavouriteRequest);
  Future<Either<Failure, FavouriteHotels>> getFavouriteHotels(
      GetFavHotelsRequest getFavHotelsRequest);
  Future<Either<Failure, Hotels>> searchForHotels(
      SearchForHotelsRequest hotelName);
}
