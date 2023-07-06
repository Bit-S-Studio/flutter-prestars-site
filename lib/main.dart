import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'prestars_exports.dart';

void mainApp(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'ela-mob',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PermissionService.getPermissionStatus(PermissionType.photos);
  PermissionService.getPermissionStatus(PermissionType.storage);
  PermissionService.getPermissionStatus(PermissionType.location);
  AppBinds.call();
  return runApp(App(env: env));
}
