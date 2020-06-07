import 'dart:io';
import 'package:contacts/ios/ios.app.dart';
import 'package:flutter/material.dart';

import 'android/android.app.dart';

void main() {
  // if (Platform.isIOS) {
  if (true) {
    runApp(IOSApp());
  } else {
    runApp(AndroidApp());
  }
}
