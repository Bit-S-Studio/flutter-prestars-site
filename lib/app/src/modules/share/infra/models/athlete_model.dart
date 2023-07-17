import '../../../../../../prestars_exports.dart';

class AthleteModel extends AthleteEntity {
  const AthleteModel({
    required String uid,
    required String name,
    required String email,
    required String phone,
    required String imageUrl,
    required AddressModel address,
    required String birth,
    required String height,
    required String heightOfFather,
    required String weight,
    required String favoriteLag,
    required List<String> positions,
    required List<String> characteristics,
    required List<String> videosUrl,
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
            videosUrl: videosUrl);

  factory AthleteModel.fromJson(Map<String, dynamic> json) => AthleteModel(
        uid: json['uid'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        imageUrl: json['image-url'] ?? '',
        address: AddressModel.fromJson(json['address'] ?? {}),
        birth: json['birth'] ?? '',
        height: json['height'] ?? '',
        heightOfFather: json['height-of-father'] ?? '',
        weight: json['weight'] ?? '',
        favoriteLag: json['favorite-lag'] ?? '',
        positions: List<String>.from(json['positions'] ?? []),
        videosUrl: List<String>.from(json['videos-url'] ?? []),
        characteristics: List<String>.from(json['characteristics'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'phone': phone,
        'image-url': imageUrl,
        'address': address.toModel.toJson(),
        'birth': birth,
        'height': height,
        'height-of-father': heightOfFather,
        'weight': weight,
        'favorite-lag': favoriteLag,
        'positions': positions,
        'characteristics': characteristics,
        'videos-url': videosUrl
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
        videosUrl
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
      videosUrl: videosUrl);
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
      videosUrl: videosUrl);
}
