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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOesUxs1jEmwLmCtS7ta4OwhvMXM54Z6A',
    appId: '1:533146630759:android:25d9c8828cfc4f3b6bf2c2',
    messagingSenderId: '533146630759',
    projectId: 'cheap-shoe-store',
    storageBucket: 'cheap-shoe-store.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVjoiaXU6EBPrI8BwU6xh2NCZtSqYSSOw',
    appId: '1:533146630759:ios:ee2fe56da12d035c6bf2c2',
    messagingSenderId: '533146630759',
    projectId: 'cheap-shoe-store',
    storageBucket: 'cheap-shoe-store.appspot.com',
    androidClientId: '533146630759-s6rpim7pnitrpbraj2qo860p2vm1set7.apps.googleusercontent.com',
    iosClientId: '533146630759-mjtrvpqh99bd8mahhjdjomv8oc91ao6p.apps.googleusercontent.com',
    iosBundleId: 'com.example.storeAdmin',
  );
}
