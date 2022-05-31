import 'package:dartz/dartz.dart';

import '../data/network/failure.dart';

abstract class BaseUseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}
