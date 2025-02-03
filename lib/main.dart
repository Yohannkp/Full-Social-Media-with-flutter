import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/features/auth/presentation/pages/auth_page.dart';
import 'package:socialmedia/features/auth/presentation/pages/login_page.dart';
import 'package:socialmedia/config/firebase_options.dart';
import 'package:socialmedia/themes/light_mode.dart';

import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

