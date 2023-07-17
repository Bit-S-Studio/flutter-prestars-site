import '../../../../../../prestars_exports.dart';

class AddressModel extends AddressEntity {
  const AddressModel({required super.city, required super.state});

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        city: json['city'] ?? '',
        state: json['state'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'city': city,
        'state': state,
      };

  @override
  List<Object?> get props => [city, state];

  @override
  bool? get stringify => true;
}

extension AddressEntityToModel on AddressEntity {
  AddressModel get toModel => AddressModel(
        city: city,
        state: state,
      );
}

extension AddressModelToEntity on AddressModel {
  AddressEntity get toEntity => AddressEntity(
        city: city,
        state: state,
      );
}
