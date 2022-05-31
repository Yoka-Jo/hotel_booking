import 'package:dartz/dartz.dart';
import 'package:hotel_booking/app/base_usecase.dart';
import 'package:hotel_booking/data/network/failure.dart';
import 'package:hotel_booking/domain/models/models.dart';
import 'package:hotel_booking/domain/repository/repository.dart';

import '../../data/network/requests.dart';

class GetFavouriteHotelsUseCase
    implements BaseUseCase<FavouriteHotels, GetFavHotelsRequest> {
  final Repository _repository;

  GetFavouriteHotelsUseCase(this._repository);
  @override
  Future<Either<Failure, FavouriteHotels>> call(
      GetFavHotelsRequest getFavHotelsRequest) async {
    return await _repository.getFavouriteHotels(getFavHotelsRequest);
  }
}
