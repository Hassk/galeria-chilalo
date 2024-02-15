// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBu0BXucfY9B_pRIVFDbrEbTWtoqpX_v8Q',
    appId: '1:192632998692:web:01c4bbea9600e00545c1b1',
    messagingSenderId: '192632998692',
    projectId: 'galchilalo2',
    authDomain: 'galchilalo2.firebaseapp.com',
    storageBucket: 'galchilalo2.appspot.com',
    measurementId: 'G-YHH6NEBPXW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCp-NmbUDk0hLYUzur9ORjRBLMEKyxPHdc',
    appId: '1:192632998692:android:30d5290865795a0345c1b1',
    messagingSenderId: '192632998692',
    projectId: 'galchilalo2',
    storageBucket: 'galchilalo2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-Hux4PH5etbm3Cgm3afyMUa3YEQX0Vwk',
    appId: '1:192632998692:ios:e685a780aef3085a45c1b1',
    messagingSenderId: '192632998692',
    projectId: 'galchilalo2',
    storageBucket: 'galchilalo2.appspot.com',
    iosBundleId: 'com.example.appucv2',
  );
}
