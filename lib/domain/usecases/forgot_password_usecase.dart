import 'package:dartz/dartz.dart';
import 'package:hotel_booking/app/base_usecase.dart';
import 'package:hotel_booking/data/network/failure.dart';
import 'package:hotel_booking/data/network/requests.dart';
import 'package:hotel_booking/domain/repository/repository.dart';

import '../models/models.dart';

class ForgotPasswordUseCase
    implements BaseUseCase<ForgotPassword, ForgotPasswordRequest> {
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);
  @override
  Future<Either<Failure, ForgotPassword>> call(
      ForgotPasswordRequest params) async {
    return await _repository.forgotPassword(params);
  }
}
