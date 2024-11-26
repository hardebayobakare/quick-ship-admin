import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop_admin/app.dart';
import 'package:quick_shop_admin/firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  // Ensure widget are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX Local Storage

  // Remove # sign from Url
  setPathUrlStrategy();

  // Initialize Firebase and Authentication repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => print('Firebase Initialized'));

  // Initialize Firebase Messaging
  runApp(const App());
}
