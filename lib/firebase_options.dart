// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCR32K3Nu8eT71ozfL152CNF_xv6PdNbLA',
    appId: '1:827064976353:web:adeac27e8ca465d13588a0',
    messagingSenderId: '827064976353',
    projectId: 'mile-high-matches',
    authDomain: 'mile-high-matches.firebaseapp.com',
    storageBucket: 'mile-high-matches.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtPEQaevBoKMwF8OPrmGKkDxflicXdHZw',
    appId: '1:827064976353:android:5598691a3b9fc8003588a0',
    messagingSenderId: '827064976353',
    projectId: 'mile-high-matches',
    storageBucket: 'mile-high-matches.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0AyckCYiD0LDaNAIiXS1rf0nH6eOcs50',
    appId: '1:827064976353:ios:c46dd96a092e0cb43588a0',
    messagingSenderId: '827064976353',
    projectId: 'mile-high-matches',
    storageBucket: 'mile-high-matches.appspot.com',
    iosBundleId: 'com.example.milehighmatch',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0AyckCYiD0LDaNAIiXS1rf0nH6eOcs50',
    appId: '1:827064976353:ios:501af61eba45abe33588a0',
    messagingSenderId: '827064976353',
    projectId: 'mile-high-matches',
    storageBucket: 'mile-high-matches.appspot.com',
    iosBundleId: 'com.example.milehighmatch.RunnerTests',
  );
}

