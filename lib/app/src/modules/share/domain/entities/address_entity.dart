import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String city;
  final String state;

  const AddressEntity({
    required this.city,
    required this.state,
  });

  @override
  List<Object?> get props => [city, state];
}
