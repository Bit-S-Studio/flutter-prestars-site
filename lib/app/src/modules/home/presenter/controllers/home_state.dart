part of 'home_controller.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitHome extends HomeState {}

class ErrorHome extends HomeState {
  final Failure failure;

  ErrorHome({required this.failure});
}

class ErrorInitHome extends HomeState {
  ErrorInitHome();
}

class SuccessHome extends HomeState {
  SuccessHome();
}

class LoadingHome extends HomeState {}
