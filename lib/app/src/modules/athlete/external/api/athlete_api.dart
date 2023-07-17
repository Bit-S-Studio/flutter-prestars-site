class AthleteOption {
  static String get mutationString => r'''
    mutation createAthlete($input:createAthleteInput!) {
        createAthlete(input: $createAthleteInput!) {
          createAthleteOutput
        }
    }
  ''';
}
