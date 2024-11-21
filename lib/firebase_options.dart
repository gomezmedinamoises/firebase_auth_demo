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
    apiKey: 'AIzaSyABhxP8c1YFvJ3oJAqbQokQUTzmZKssx8M',
    appId: '1:1088846124296:web:a938431d0cf28af2b788bd',
    messagingSenderId: '1088846124296',
    projectId: 'firebase-auth-demo-2024',
    authDomain: 'fir-auth-demo-2024-699da.firebaseapp.com',
    storageBucket: 'firebase-auth-demo-2024.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPQ9fEn4J1f0M2lFk_I8LzZTPHSkXC_RY',
    appId: '1:1088846124296:android:2951e7c0199963a0b788bd',
    messagingSenderId: '1088846124296',
    projectId: 'firebase-auth-demo-2024',
    storageBucket: 'firebase-auth-demo-2024.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDH_wcH86rJduSyCy4go_9-UGsMr8m0JSM',
    appId: '1:1088846124296:ios:cdc1773af0d9ae68b788bd',
    messagingSenderId: '1088846124296',
    projectId: 'firebase-auth-demo-2024',
    storageBucket: 'firebase-auth-demo-2024.firebasestorage.app',
    iosBundleId: 'com.example.firebaseAuthDemo',
  );

}