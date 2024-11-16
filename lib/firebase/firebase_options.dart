
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
      apiKey: 'AIzaSyALVEz5ZuXshCewaOQqhaMR1gSuMoHEhI8',
      appId: '1:821361788600:android:d47b4f80cc63c452cad64d',
      messagingSenderId: '821361788600',
      projectId: 'student-information-1c2e2',
      storageBucket: 'student-information-1c2e2.firebasestorage.app',
      databaseURL:
      'https://student-information-1c2e2-default-rtdb.firebaseio.com');

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: 'AIzaSyALVEz5ZuXshCewaOQqhaMR1gSuMoHEhI8',
      appId: '1:821361788600:android:d47b4f80cc63c452cad64d',
      messagingSenderId: '821361788600',
      projectId: 'student-information-1c2e2',
      storageBucket: 'student-information-1c2e2.firebasestorage.app',
      iosBundleId: 'com.amar_student.student_information_firebase',
      databaseURL:
      'https://student-information-1c2e2-default-rtdb.firebaseio.com');
}