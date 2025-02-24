import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/cast_entity.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object?> get props => [];
}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastLoaded extends CastState {
  final List<CastEntity> cast;

  const CastLoaded(this.cast);

  @override
  List<Object?> get props => [cast];
}

class CastError extends CastState {
  final String errorMessage;

  const CastError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
