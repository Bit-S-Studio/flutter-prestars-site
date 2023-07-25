import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../prestars_exports.dart';

class CaptureVideos {
  static void call({required AthleteForm form}) async {
    final picker = ImagePicker();
    final result = await picker.pickVideo(
        source: ImageSource.gallery, maxDuration: const Duration(minutes: 1));

    if (result != null) {
      form.addVideo(result);
    } else {
      debugPrint('Você não tirou nenuma foto');
    }
  }
}
