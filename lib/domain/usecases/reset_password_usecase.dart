import 'package:dartz/dartz.dart';
import 'package:hotel_booking/app/base_usecase.dart';
import 'package:hotel_booking/data/network/failure.dart';
import 'package:hotel_booking/domain/repository/repository.dart';

class ResetPasswordUseCase implements BaseUseCase {
  final Repository _repository;

  ResetPasswordUseCase(this._repository);
  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return await _repository.resetPassword(params);
  }
}
