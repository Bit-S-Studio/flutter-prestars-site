part of 'athlete_controller.dart';

abstract class AthleteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitAthlete extends AthleteState {}

class ErrorAthlete extends AthleteState {
  final Failure failure;

  ErrorAthlete({required this.failure});
}

class ErrorInitAthlete extends AthleteState {
  ErrorInitAthlete();
}

class SuccessAthlete extends AthleteState {
  SuccessAthlete();
}

class LoadingAthlete extends AthleteState {}
