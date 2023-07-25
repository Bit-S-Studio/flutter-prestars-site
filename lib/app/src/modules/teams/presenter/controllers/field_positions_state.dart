part of 'field_positions_controller.dart';

abstract class FieldPositionsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitFieldPositions extends FieldPositionsState {}

class ErrorFieldPositions extends FieldPositionsState {
  final Failure failure;

  ErrorFieldPositions({required this.failure});
}

class SuccessFieldPositions extends FieldPositionsState {
  final List<String> positions;
  SuccessFieldPositions({required this.positions});
}

class LoadingFieldPositions extends FieldPositionsState {}
