import 'package:hotel_booking/data/network/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:hotel_booking/domain/repository/repository.dart';

import '../../app/base_usecase.dart';
import '../../data/network/requests.dart';
import '../models/models.dart';

class SearchForHotelsUseCase
    implements BaseUseCase<Hotels, SearchForHotelsRequest> {
  final Repository _repository;

  SearchForHotelsUseCase(this._repository);
  @override
  Future<Either<Failure, Hotels>> call(SearchForHotelsRequest params) async {
    return await _repository.searchForHotels(params);
  }
}
