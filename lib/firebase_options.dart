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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBut9dNZkd9yf5aLv8H61tSgjxPnYkzEIE',
    appId: '1:769471049720:web:711279d03a33a9461df00d',
    messagingSenderId: '769471049720',
    projectId: 'aslama-143f1',
    authDomain: 'aslama-143f1.firebaseapp.com',
    storageBucket: 'aslama-143f1.appspot.com',
    measurementId: 'G-DHSVP0D626',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVq-3CC8TlDE0LPske98uhju8ZvHGqP9c',
    appId: '1:769471049720:android:a53c3e913905f85a1df00d',
    messagingSenderId: '769471049720',
    projectId: 'aslama-143f1',
    storageBucket: 'aslama-143f1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBF9g-8xfggXk_53G3Edtn0A2mPhH2U8io',
    appId: '1:769471049720:ios:5a3fc6adf06a2e781df00d',
    messagingSenderId: '769471049720',
    projectId: 'aslama-143f1',
    storageBucket: 'aslama-143f1.appspot.com',
    iosBundleId: 'com.example.aslama',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBF9g-8xfggXk_53G3Edtn0A2mPhH2U8io',
    appId: '1:769471049720:ios:5a3fc6adf06a2e781df00d',
    messagingSenderId: '769471049720',
    projectId: 'aslama-143f1',
    storageBucket: 'aslama-143f1.appspot.com',
    iosBundleId: 'com.example.aslama',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBut9dNZkd9yf5aLv8H61tSgjxPnYkzEIE',
    appId: '1:769471049720:web:8746ac3c686788db1df00d',
    messagingSenderId: '769471049720',
    projectId: 'aslama-143f1',
    authDomain: 'aslama-143f1.firebaseapp.com',
    storageBucket: 'aslama-143f1.appspot.com',
    measurementId: 'G-72C55DFHNM',
  );
}
