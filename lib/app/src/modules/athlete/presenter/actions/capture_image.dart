import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../prestars_exports.dart';

class CaptureImage {
  static void call({required AthleteForm form}) async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      final imageBytes = await result.readAsBytes();
      final imageBase64 = base64Encode(imageBytes);
      form.setImage(imageBase64);
    } else {
      debugPrint('Você não tirou nenuma foto');
    }
  }
}
