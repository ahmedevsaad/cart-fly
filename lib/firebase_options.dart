// PLACEHOLDER — replace by running `flutterfire configure` in this project.
// Until you do, Firebase calls will fail at runtime, but the app will compile.
//
// Steps for the developer:
//   dart pub global activate flutterfire_cli
//   flutterfire configure
//
// That command writes a real DefaultFirebaseOptions for android/ios/web and
// drops native config files (google-services.json, GoogleService-Info.plist).

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return _placeholder;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _placeholder;
      default:
        return _placeholder;
    }
  }

  static const FirebaseOptions _placeholder = FirebaseOptions(
    apiKey: 'PLACEHOLDER',
    appId: 'PLACEHOLDER',
    messagingSenderId: 'PLACEHOLDER',
    projectId: 'cartfly-placeholder',
  );
}
