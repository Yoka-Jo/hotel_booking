import 'package:dartz/dartz.dart';
import '../../app/base_usecase.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../models/models.dart';
import '../repository/repository.dart';

class SignUpUseCase implements BaseUseCase<Authentication, SignUpRequest> {
  final Repository _repository;
  SignUpUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, Authentication>> call(SignUpRequest params) async {
    return await _repository.signUp(params);
  }
}
