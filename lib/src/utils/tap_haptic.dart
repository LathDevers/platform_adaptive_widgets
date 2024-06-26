import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void onTapHaptic<T>(void Function(T)? fct, T value) {
  if (fct == null) return;
  switch (defaultTargetPlatform) {
    case TargetPlatform.iOS:
    case TargetPlatform.android:
      HapticFeedback.mediumImpact();
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
      break;
  }
  return fct(value);
}

void Function()? onTapHapticFeedback(void Function()? fct) {
  if (fct == null) return null;
  switch (defaultTargetPlatform) {
    case TargetPlatform.iOS:
    case TargetPlatform.android:
      HapticFeedback.mediumImpact();
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
      break;
  }
  return fct;
}
