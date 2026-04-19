import 'package:dynamic_path_url_strategy/dynamic_path_url_strategy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopper_admin/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopper_admin/firebase_options.dart';
import 'package:shopper_admin/repository/authentication/authenticationRepository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  setPathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}
