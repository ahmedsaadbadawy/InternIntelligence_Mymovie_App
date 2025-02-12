import 'package:dartz/dartz.dart';

import '../../Core/errors/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}