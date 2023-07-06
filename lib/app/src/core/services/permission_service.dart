import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

import '../../../../prestars_exports.dart';

class PermissionService {
  static Future<bool> requestOrOpenSettings(PermissionType permission) async {
    PermissionStatus status = await getPermissionStatus(permission);
    bool hasPerm = status.isGranted;

    if (Platform.isIOS && status == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
    }

    if (Platform.isAndroid && !hasPerm) {
      final currentStatusRequestPermission =
          await _requestPermission(permission);
      if (currentStatusRequestPermission.isPermanentlyDenied) {
        await openAppSettings();
        return false;
      }
    }

    if (!hasPerm) {
      await _requestPermission(permission);
      status = await getPermissionStatus(permission);
      if (!status.isGranted) await Permission.contacts.request().isGranted;
      status = await getPermissionStatus(permission);
    }

    return status.isGranted;
  }

  static Future<bool> onlyRequest(PermissionType permission) async {
    PermissionStatus status = await getPermissionStatus(permission);
    bool hasPerm = status.isGranted;

    if (!hasPerm) {
      await _requestPermission(permission);
      status = await getPermissionStatus(permission);
    }

    return status.isGranted;
  }

  static Future<bool> hasPermission(PermissionType permission) async {
    return await _choosePermission(permission).status.isGranted;
  }

  static Future<PermissionStatus> getPermissionStatus(
      PermissionType permissionType) async {
    return await _choosePermission(permissionType).status;
  }

  static Permission _choosePermission(PermissionType permission) {
    switch (permission) {
      case PermissionType.camera:
        return Permission.camera;
      case PermissionType.storage:
        return Permission.storage;
      case PermissionType.photos:
        return Permission.photos;
      case PermissionType.contacts:
        return Permission.contacts;
      case PermissionType.location:
        return Permission.location;
      default:
        throw 'Permission type não suportado';
    }
  }

  static Future<PermissionStatus> _requestPermission(
      PermissionType permission) {
    switch (permission) {
      case PermissionType.camera:
        return Permission.camera.request();
      case PermissionType.storage:
        return Permission.storage.request();
      case PermissionType.photos:
        return Permission.photos.request();
      case PermissionType.contacts:
        return Permission.contacts.request();
      case PermissionType.location:
        return Permission.location.request();
      default:
        throw 'Permission type não suportado';
    }
  }
}
