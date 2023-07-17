import 'package:equatable/equatable.dart';
import '../../../../../../prestars_exports.dart';

class AthleteEntity extends Equatable {
  final String uid;
  final String name;
  final String imageUrl;
  final String email;
  final String phone;
  final AddressEntity address;
  final String birth;
  final String height;
  final String heightOfFather;
  final String weight;
  final String favoriteLag;
  final List<String> positions;
  final List<String> characteristics;
  final List<String> videosUrl;

  const AthleteEntity(
      {required this.uid,
      required this.name,
      required this.email,
      required this.imageUrl,
      required this.phone,
      required this.address,
      required this.birth,
      required this.height,
      required this.heightOfFather,
      required this.weight,
      required this.favoriteLag,
      required this.positions,
      required this.characteristics,
      required this.videosUrl});

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
        phone,
        address,
        imageUrl,
        birth,
        height,
        heightOfFather,
        weight,
        favoriteLag,
        positions,
        characteristics,
        videosUrl
      ];
}
