// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAn4ReM4QIJoWRGiJYLPTHZfKZQkszEwLE',
    appId: '1:702968945469:web:f8a6b0ec0a101b465d4354',
    messagingSenderId: '702968945469',
    projectId: 'socialmedia-2072b',
    authDomain: 'socialmedia-2072b.firebaseapp.com',
    storageBucket: 'socialmedia-2072b.firebasestorage.app',
    measurementId: 'G-5BX0GN0ZWR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNiLZymV3ZaLDzXNIhgY7Xqt_Pr73pYb8',
    appId: '1:702968945469:android:ad47bd8ebce11baa5d4354',
    messagingSenderId: '702968945469',
    projectId: 'socialmedia-2072b',
    storageBucket: 'socialmedia-2072b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbDb-hq_KerPc_wPpzuB49fDB7a28k388',
    appId: '1:702968945469:ios:0283094c47fba0fe5d4354',
    messagingSenderId: '702968945469',
    projectId: 'socialmedia-2072b',
    storageBucket: 'socialmedia-2072b.firebasestorage.app',
    iosBundleId: 'com.example.socialmedia',
  );
}
