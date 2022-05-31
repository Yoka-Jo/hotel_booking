import 'package:dartz/dartz.dart';
import 'package:hotel_booking/app/base_usecase.dart';
import 'package:hotel_booking/data/network/failure.dart';
import 'package:hotel_booking/domain/models/models.dart';
import 'package:hotel_booking/domain/repository/repository.dart';

import '../../data/network/requests.dart';

class GetHotelsUseCase implements BaseUseCase<Hotels, HotelsRequest> {
  final Repository _repository;

  GetHotelsUseCase(this._repository);

  @override
  Future<Either<Failure, Hotels>> call(HotelsRequest params) async {
    return await _repository.getHotels(params);
  }
}
