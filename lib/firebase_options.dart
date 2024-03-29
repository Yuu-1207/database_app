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
    apiKey: 'AIzaSyBvpMTObencN__unzEqrYKeVIeZ3OxtdF8',
    appId: '1:476350640628:web:e3baadd4548f570eda09a1',
    messagingSenderId: '476350640628',
    projectId: 'database-79740',
    authDomain: 'database-79740.firebaseapp.com',
    storageBucket: 'database-79740.appspot.com',
    measurementId: 'G-ERV1YP4H7Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA61eXEGyDRucgKBXv2UMNs0miCL9YU2b0',
    appId: '1:476350640628:android:dbdec3ac940abe99da09a1',
    messagingSenderId: '476350640628',
    projectId: 'database-79740',
    storageBucket: 'database-79740.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMt4m9KG8yzLVAX9yCxgefoOYJa7TrxvE',
    appId: '1:476350640628:ios:0450f489061cec88da09a1',
    messagingSenderId: '476350640628',
    projectId: 'database-79740',
    storageBucket: 'database-79740.appspot.com',
    iosBundleId: 'com.example.databaseApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBMt4m9KG8yzLVAX9yCxgefoOYJa7TrxvE',
    appId: '1:476350640628:ios:cd1258775727e14ada09a1',
    messagingSenderId: '476350640628',
    projectId: 'database-79740',
    storageBucket: 'database-79740.appspot.com',
    iosBundleId: 'com.example.databaseApp.RunnerTests',
  );
}
