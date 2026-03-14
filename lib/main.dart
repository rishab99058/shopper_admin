import 'package:flutter/material.dart';
import 'package:shopper_admin/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopper_admin/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) => print("Firebase initialized"));

  runApp(const MyApp());
}
