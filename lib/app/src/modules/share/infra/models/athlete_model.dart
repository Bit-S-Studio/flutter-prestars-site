import '../../../../../../prestars_exports.dart';
import 'package:uuid/uuid.dart';

class AthleteModel extends AthleteEntity {
  const AthleteModel({
    required String uid,
    required String name,
    required String email,
    required String phone,
    required String imageUrl,
    required AddressModel address,
    required String birth,
    required double height,
    required double heightOfFather,
    required double weight,
    required String favoriteLag,
    required List<String> positions,
    required List<String> characteristics,
    required List<String> videosUrl,
    required List<String> videos,
  }) : super(
            uid: uid,
            name: name,
            email: email,
            phone: phone,
            imageUrl: imageUrl,
            address: address,
            birth: birth,
            height: height,
            heightOfFather: heightOfFather,
            weight: weight,
            favoriteLag: favoriteLag,
            positions: positions,
            characteristics: characteristics,
            videosUrl: videosUrl,
            videos: videos);

  factory AthleteModel.fromJson(Map<String, dynamic> json) => AthleteModel(
        uid: json['uid'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        imageUrl: json['image-url'] ?? '',
        address: AddressModel.fromJson(json['address'] ?? {}),
        birth: json['birth'] ?? '',
        height: json['height'] ?? 0.1,
        heightOfFather: json['height-of-father'] ?? 0.1,
        weight: json['weight'] ?? 0.1,
        favoriteLag: json['favorite-lag'] ?? '',
        positions: List<String>.from(json['positions'] ?? []),
        videosUrl: List<String>.from(json['videos-url'] ?? []),
        videos: List<String>.from(json['videos'] ?? []),
        characteristics: List<String>.from(json['characteristics'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'uid': const Uuid().v4(),
        'name': name,
        'email': email,
        'phone': phone,
        'imageUrl': imageUrl,
        'city': address.city,
        'state': address.state,
        'birth': birth,
        'height': height,
        'heightOfFather': heightOfFather,
        'weight': weight,
        'favoriteLag': favoriteLag,
        'positions': positions,
        'characteristics': characteristics,
        'videosUrl': videosUrl,
        'videos': videos
      };

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
        phone,
        imageUrl,
        address,
        birth,
        height,
        heightOfFather,
        weight,
        favoriteLag,
        positions,
        characteristics,
        videosUrl,
        videos
      ];
}

extension AthleteEntityToModel on AthleteEntity {
  AthleteModel get toModel => AthleteModel(
      uid: uid,
      name: name,
      email: email,
      phone: phone,
      imageUrl: imageUrl,
      address: address.toModel,
      birth: birth,
      height: height,
      heightOfFather: heightOfFather,
      weight: weight,
      favoriteLag: favoriteLag,
      positions: positions,
      characteristics: characteristics,
      videosUrl: videosUrl,
      videos: videos);
}

extension AthleteModelToEntity on AthleteModel {
  AthleteEntity get toEntity => AthleteEntity(
      uid: uid,
      name: name,
      email: email,
      phone: phone,
      imageUrl: imageUrl,
      address: address,
      birth: birth,
      height: height,
      heightOfFather: heightOfFather,
      weight: weight,
      favoriteLag: favoriteLag,
      positions: positions,
      characteristics: characteristics,
      videosUrl: videosUrl,
      videos: videos);
}
