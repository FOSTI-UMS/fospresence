import 'package:dartz/dartz.dart';
import 'package:fospresence/core/errors/failure.dart';
import 'package:fospresence/core/usecase/usecase.dart';
import 'package:fospresence/features/event/domain/entities/event/event_entity.dart';
import 'package:fospresence/features/event/domain/repositories/event_repository.dart';

class CreateEventUseCase
    extends UseCase<Either<ValueFailure<String>, Unit>, EventEntity> {
  final EventRespository _eventRespository;

  CreateEventUseCase(this._eventRespository);
  @override
  Future<Either<ValueFailure<String>, Unit>> call(
          {required EventEntity params}) async =>
      await _eventRespository.createEvent(event: params);
}
