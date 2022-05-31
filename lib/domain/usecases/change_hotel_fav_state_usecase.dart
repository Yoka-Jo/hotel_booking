import 'package:dartz/dartz.dart';
import 'package:hotel_booking/app/base_usecase.dart';
import 'package:hotel_booking/data/network/failure.dart';
import 'package:hotel_booking/data/network/requests.dart';
import 'package:hotel_booking/domain/repository/repository.dart';

import '../models/models.dart';

class ChangeHotelFavStateUseCase
    implements BaseUseCase<ChangeHotelFavState, ChangeHotelFavStateRequest> {
  final Repository _repository;

  ChangeHotelFavStateUseCase(this._repository);
  @override
  Future<Either<Failure, ChangeHotelFavState>> call(
      ChangeHotelFavStateRequest params) async {
    return await _repository.changeHotelFavState(params);
  }
}
