class AthleteOption {
  static String get mutationString => r'''
  mutation CreateAthlete(
    $uid: String,
    $birth: String,
    $characteristics: json,
    $city: String,
    $email: String,
    $favoriteLag: String,
    $gender: String,
    $height: float8,
    $heightOfFather: float8,
    $name: String,
    $imageUrl: String,
    $phone: String,
    $positions: json,
    $state: String,
    $videosUrl: json,
    $videos: json,
    $weight: float8
  ) {
    insert_athletes_one(
      object: {
        uid: $uid,
        birth: $birth,
        characteristics: $characteristics,
        city: $city,
        email: $email,
        favorite_lag: $favoriteLag,
        gender: $gender,
        height: $height,
        height_of_father: $heightOfFather,
        name: $name,
        image_url: $imageUrl,
        phone: $phone,
        positions: $positions,
        state: $state,
        videos_url: $videosUrl,
        videos: $videos,
        weight: $weight
      }
    ) {
      uid
      created_at
      }
  }
  ''';
}
