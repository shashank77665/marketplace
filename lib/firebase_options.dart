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
    apiKey: 'AIzaSyAv8Pd5CjPeIHjAKW2TN7Lfa8kAKbE9WRI',
    appId: '1:316039080127:web:ab01e0c993d3fa9614be0a',
    messagingSenderId: '316039080127',
    projectId: 'marketplace-4f864',
    authDomain: 'marketplace-4f864.firebaseapp.com',
    storageBucket: 'marketplace-4f864.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9IuK_0hAEhf6X7RGTgRlbvq8ddGf-SOA',
    appId: '1:316039080127:android:4bcf2fe77dbc5aaa14be0a',
    messagingSenderId: '316039080127',
    projectId: 'marketplace-4f864',
    storageBucket: 'marketplace-4f864.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOpFTzMBRRclkzSksdmcDYxn_cjem_tZQ',
    appId: '1:316039080127:ios:cddb87da0b3aeb1614be0a',
    messagingSenderId: '316039080127',
    projectId: 'marketplace-4f864',
    storageBucket: 'marketplace-4f864.appspot.com',
    iosBundleId: 'com.example.marketplace',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAOpFTzMBRRclkzSksdmcDYxn_cjem_tZQ',
    appId: '1:316039080127:ios:cddb87da0b3aeb1614be0a',
    messagingSenderId: '316039080127',
    projectId: 'marketplace-4f864',
    storageBucket: 'marketplace-4f864.appspot.com',
    iosBundleId: 'com.example.marketplace',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAv8Pd5CjPeIHjAKW2TN7Lfa8kAKbE9WRI',
    appId: '1:316039080127:web:4e71a2692044fd2914be0a',
    messagingSenderId: '316039080127',
    projectId: 'marketplace-4f864',
    authDomain: 'marketplace-4f864.firebaseapp.com',
    storageBucket: 'marketplace-4f864.appspot.com',
  );
}
