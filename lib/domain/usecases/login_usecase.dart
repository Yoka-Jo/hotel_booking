import 'package:dartz/dartz.dart';
import 'package:hotel_booking/app/base_usecase.dart';
import 'package:hotel_booking/data/network/failure.dart';
import 'package:hotel_booking/data/network/requests.dart';
import 'package:hotel_booking/domain/models/models.dart';
import 'package:hotel_booking/domain/repository/repository.dart';

class LoginUseCase implements BaseUseCase<Authentication, LoginRequest> {
  final Repository _repository;
  LoginUseCase(
    this._repository,
  );
  @override
  Future<Either<Failure, Authentication>> call(LoginRequest params) async {
    return await _repository.login(params);
  }
}
