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
    apiKey: 'AIzaSyBnCVlcb7B-ROI1RsNrgZKiDCFfznF5zYE',
    appId: '1:1019335437663:web:319ac7bf16e9c9be8bdaea',
    messagingSenderId: '1019335437663',
    projectId: 'iti-final-project-41d7c',
    authDomain: 'iti-final-project-41d7c.firebaseapp.com',
    storageBucket: 'iti-final-project-41d7c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDP5aM-GA6O8itktXyR8E_ia5-qUOUdE8Q',
    appId: '1:1019335437663:android:40a08684151dad5d8bdaea',
    messagingSenderId: '1019335437663',
    projectId: 'iti-final-project-41d7c',
    storageBucket: 'iti-final-project-41d7c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8kvBDiv0dJ4Cp-IIZRBzteHz8vMgGyLY',
    appId: '1:1019335437663:ios:3906deb99527f2ae8bdaea',
    messagingSenderId: '1019335437663',
    projectId: 'iti-final-project-41d7c',
    storageBucket: 'iti-final-project-41d7c.appspot.com',
    iosClientId: '1019335437663-d3prpnkm87tfv1bkrkjo1jupdqbgm2m0.apps.googleusercontent.com',
    iosBundleId: 'com.example.itiFinalProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8kvBDiv0dJ4Cp-IIZRBzteHz8vMgGyLY',
    appId: '1:1019335437663:ios:da98bb350d57e5d48bdaea',
    messagingSenderId: '1019335437663',
    projectId: 'iti-final-project-41d7c',
    storageBucket: 'iti-final-project-41d7c.appspot.com',
    iosClientId: '1019335437663-fnalcs1ekcb4mgqjqbpl0okt423vgjkc.apps.googleusercontent.com',
    iosBundleId: 'com.example.itiFinalProject.RunnerTests',
  );
}
