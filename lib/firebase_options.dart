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
    apiKey: 'AIzaSyBJrEny1fRzbNFIp09jsAHToJqp_M4VvXg',
    appId: '1:167104993030:web:4e5a4a233f483a9f5ff087',
    messagingSenderId: '167104993030',
    projectId: 'management-notifications-566b9',
    authDomain: 'management-notifications-566b9.firebaseapp.com',
    storageBucket: 'management-notifications-566b9.appspot.com',
    measurementId: 'G-V8DG2PGGND',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_hWqJMU3OfilElNthFuMNAzSnb3C7l4E',
    appId: '1:167104993030:android:71d573560655f3a95ff087',
    messagingSenderId: '167104993030',
    projectId: 'management-notifications-566b9',
    storageBucket: 'management-notifications-566b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPHzyFJ_vAb6d53kuJ5A_5yP-DAHx9tGM',
    appId: '1:167104993030:ios:8b176f5d09c10ce55ff087',
    messagingSenderId: '167104993030',
    projectId: 'management-notifications-566b9',
    storageBucket: 'management-notifications-566b9.appspot.com',
    androidClientId: '167104993030-qlbk6l0m1ibbg2cm1kv0cb8ov5f6leb1.apps.googleusercontent.com',
    iosClientId: '167104993030-1i2fp8apkq92v6she86u702ou8g6b49r.apps.googleusercontent.com',
    iosBundleId: 'com.example.rentalApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBJrEny1fRzbNFIp09jsAHToJqp_M4VvXg',
    appId: '1:167104993030:web:b344328906f7ae5d5ff087',
    messagingSenderId: '167104993030',
    projectId: 'management-notifications-566b9',
    authDomain: 'management-notifications-566b9.firebaseapp.com',
    storageBucket: 'management-notifications-566b9.appspot.com',
    measurementId: 'G-84TTK039LT',
  );
}
