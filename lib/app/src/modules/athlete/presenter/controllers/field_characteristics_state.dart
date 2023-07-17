part of 'field_characteristics_controller.dart';

abstract class FieldCharacteristicsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitFieldCharacteristics extends FieldCharacteristicsState {}

class ErrorFieldCharacteristics extends FieldCharacteristicsState {
  final Failure failure;

  ErrorFieldCharacteristics({required this.failure});
}

class SuccessFieldCharacteristics extends FieldCharacteristicsState {
  final List<String> characteristics;
  SuccessFieldCharacteristics({required this.characteristics});
}

class LoadingFieldCharacteristics extends FieldCharacteristicsState {}
