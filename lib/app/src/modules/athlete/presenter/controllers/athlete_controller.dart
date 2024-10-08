import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../prestars_exports.dart';

part 'athlete_state.dart';

class AthleteController extends ValueNotifier<AthleteState> {
  final AthleteForm athleteForm;
  final IUploadToStorageUseCase uploadToStorageUseCase;
  final ICreateAthleteUseCase createAthleteUseCase;
  AthleteController(
      {required this.uploadToStorageUseCase,
      required this.createAthleteUseCase,
      required this.athleteForm})
      : super(InitAthlete());

  void init() async {
    // value = LoadingAthlete();
    AthleteFormUntouchAllErrors.call(athleteForm.formGroup);
    // value = SuccessAthlete();
  }

  void submit() async {
    List<String> videos = [];
    value = LoadingAthlete();
    final image = athleteForm.imageUrl;
    final imageBytes = base64.decode(image.split(',').last);
    final imageFile = XFile.fromData(imageBytes);
    final uploadedImage = await uploadToStorageUseCase.call(file: imageFile);
    await uploadedImage
        .fold((failure) async => value = ErrorAthlete(failure: failure),
            (imageUrl) async {
      for (final video in athleteForm.videos) {
        final uploadVideo =
            await uploadToStorageUseCase.call(file: video ?? XFile(''));
        uploadVideo.fold((failure) => value = ErrorAthlete(failure: failure),
            (videoUrl) {
          videos.add(videoUrl);
        });
      }
      final entity = athleteForm.toEntity(imageUrl: imageUrl, videos: videos);
      final result = await createAthleteUseCase.call(entity: entity);
      result.fold((failure) async => value = ErrorAthlete(failure: failure),
          (r) => value = SuccessAthlete());
    });
  }
}
