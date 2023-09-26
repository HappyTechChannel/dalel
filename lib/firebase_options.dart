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
        return macos;
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
    apiKey: 'AIzaSyBrFFE-s_4B4yQsLS6kLX8pRZV3W9kQk7Y',
    appId: '1:999658716773:web:b7380b7ea92437e58f908c',
    messagingSenderId: '999658716773',
    projectId: 'dalel-181f1',
    authDomain: 'dalel-181f1.firebaseapp.com',
    storageBucket: 'dalel-181f1.appspot.com',
    measurementId: 'G-ZYCB3QX58J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3vWkO7_pLqfvQksxWVuFlN1Eog9ZhHUg',
    appId: '1:999658716773:android:64b9a885a24747f28f908c',
    messagingSenderId: '999658716773',
    projectId: 'dalel-181f1',
    storageBucket: 'dalel-181f1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYS50hsPK5gGOjIkKfz9rNmScePKtaiEw',
    appId: '1:999658716773:ios:27cd3be850069e898f908c',
    messagingSenderId: '999658716773',
    projectId: 'dalel-181f1',
    storageBucket: 'dalel-181f1.appspot.com',
    iosBundleId: 'com.example.dalel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYS50hsPK5gGOjIkKfz9rNmScePKtaiEw',
    appId: '1:999658716773:ios:aafb4c07d46172828f908c',
    messagingSenderId: '999658716773',
    projectId: 'dalel-181f1',
    storageBucket: 'dalel-181f1.appspot.com',
    iosBundleId: 'com.example.dalel.RunnerTests',
  );
}