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
    apiKey: 'AIzaSyCd-O1dM9mQaHDGczv4FkiO04S8Bc4BFT4',
    appId: '1:675388448534:web:f673de28076a9876dd3a37',
    messagingSenderId: '675388448534',
    projectId: 'aplikasi-kesehatan-a6022',
    authDomain: 'aplikasi-kesehatan-a6022.firebaseapp.com',
    storageBucket: 'aplikasi-kesehatan-a6022.appspot.com',
    measurementId: 'G-4LGJVMYK76',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7nt8ZF9GtzAUBzzKJo7TjaIZGVSXRAuU',
    appId: '1:675388448534:android:b78f03cd201af7ffdd3a37',
    messagingSenderId: '675388448534',
    projectId: 'aplikasi-kesehatan-a6022',
    storageBucket: 'aplikasi-kesehatan-a6022.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKfL1YGrvUpKYSzY0Smbzbf5pBnS3ula8',
    appId: '1:675388448534:ios:6babb6c7bc78e19add3a37',
    messagingSenderId: '675388448534',
    projectId: 'aplikasi-kesehatan-a6022',
    storageBucket: 'aplikasi-kesehatan-a6022.appspot.com',
    iosBundleId: 'com.mylab.mylab',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDKfL1YGrvUpKYSzY0Smbzbf5pBnS3ula8',
    appId: '1:675388448534:ios:5742521a54c0517add3a37',
    messagingSenderId: '675388448534',
    projectId: 'aplikasi-kesehatan-a6022',
    storageBucket: 'aplikasi-kesehatan-a6022.appspot.com',
    iosBundleId: 'com.mylab.mylab.RunnerTests',
  );
}
