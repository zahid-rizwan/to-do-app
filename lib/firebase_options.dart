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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static  FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkQiViEL3WBER2ptT5Q6fwjsMjH6vW_-M',
    appId: '1:398158300581:android:c0ce61a5dab6e21f63144c',
    messagingSenderId: '398158300581',
    projectId: 'to-do-ap-74392',
    storageBucket: 'to-do-ap-74392.firebasestorage.app',
  );

  static  FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvH9rY6kcSIi8akYP-LavrBmLM27VFM_I',
    appId: '1:398158300581:ios:ecb2876b33eb124a63144c',
    messagingSenderId: '398158300581',
    projectId: 'to-do-ap-74392',
    storageBucket: 'to-do-ap-74392.firebasestorage.app',
    iosBundleId: 'com.todo.todo',
  );
}
