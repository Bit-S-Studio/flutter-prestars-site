import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../prestars_exports.dart';

class StorageDatasourceImpl extends IStorageDatasource {
  final FirebaseStorage storage;

  StorageDatasourceImpl({required this.storage});

  @override
  Future<String> call({required XFile file}) async {
    final storageRef = storage.ref();

    final newFileName = (file.path).replaceAll(" ", "_").toLowerCase();
    final userImageRef = storageRef.child("Athletes/$newFileName");
    final fileBytes = await file.readAsBytes();

    try {
      final taskSnapshot =
          await userImageRef.putData(fileBytes);

      late String url;
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          debugPrint("Upload is $progress% complete.");
          break;
        case TaskState.paused:
          debugPrint("Upload is paused.");
          break;
        case TaskState.canceled:
          debugPrint("Upload was canceled");
          break;
        case TaskState.error:
          throw const ErrorResponse(message: 'error');
        case TaskState.success:
          url = await userImageRef.getDownloadURL();
      }
      return url;
    } on FirebaseException {
      throw const ErrorResponse(message: 'error');
    }
  }
}
