/// General platform adaptive widgets
library;

import 'package:flutter/foundation.dart';

/// Returns true if the platform is iOS or macOS, returns false otherwise.
bool get isCupertino {
  //if (kIsWeb) return false;
  // in the case of a web app, [defaultTargetPlatform] returns the platform the application's browser is running in
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return false;
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return true;
  }
}

CitecPlatform get designPlatform {
  return switch (defaultTargetPlatform) {
    TargetPlatform.android => CitecPlatform.material,
    TargetPlatform.fuchsia => CitecPlatform.material,
    TargetPlatform.linux => CitecPlatform.yaru,
    TargetPlatform.windows => CitecPlatform.fluent,
    TargetPlatform.iOS => CitecPlatform.ios,
    TargetPlatform.macOS => CitecPlatform.macos,
  };
}

enum CitecPlatform {
  /// Google defines Material design guidelines for Android devices
  ///
  /// [Material 3 Design](https://m3.material.io)
  material,

  /// Apple defines design guidelines for iOS and iPadOS
  ///
  /// [Apple HIG - Designing for iOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-ios)\
  /// [Apple HIG - Designing for iPadOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-ipados)
  ios,

  /// Microsoft defines Fluent design guidelines for Windows
  ///
  /// [Fluent 2 UI for Windows](https://fluent2.microsoft.design/components/windows)
  fluent,

  /// Apple defines design guidelines for macOS
  ///
  /// [Apple HIG - Designing for macOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-macos)
  macos,

  /// Yaru is the default theme for Ubuntu
  ///
  /// [Yaru](https://github.com/ubuntu/yaru)
  yaru
}
