import 'dart:async';

import 'package:android_flutter_wifi/android_flutter_wifi.dart';
import 'package:device_policy_manager/device_policy_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_dnd/flutter_dnd.dart';
import 'resume_observer.dart';

class AndroidControls {
  static void toggleWifiButton() {
    AndroidFlutterWifi.isWifiEnabled()
        .then((value) => {if (value) AndroidFlutterWifi.disableWifi()});
  }

  static void toggleBT() {
    FlutterBluetoothSerial.instance.requestDisable().then((value) => {
          if (value == true) {print("Bluetooth is disabled")}
        });
  }

  static Future<bool?> requestPermessionLS(context) async {
    bool isGranted = await DevicePolicyManager.requestPermession(
        "Sleepy needs permission to lock your screen");
    if (isGranted) {
      return true;
    } else {
      return false;
    }
  }

  static void lockScreen() {
    DevicePolicyManager.lockNow();
  }

  static Future<bool?> requestPermessionDND(context) async {
    bool? isGranted = await FlutterDnd.isNotificationPolicyAccessGranted;
    if (isGranted == true) {
      return true;
    } else {
      await navigateToPolicySettingsAndHandleResult(context);
      if (await FlutterDnd.isNotificationPolicyAccessGranted == false) {
        return false;
      } else {
        return true;
      }
    }
  }

  static Future<void> navigateToPolicySettingsAndHandleResult(
      BuildContext context) {
    final completer = Completer<void>();

    // Navigate to policy settings
    FlutterDnd.gotoPolicySettings();

    // Listen for app resume event
    WidgetsBinding.instance.addObserver(
      ResumeObserver(completer, context),
    );

    return completer.future;
  }

  static void toggleDND() {
    FlutterDnd.setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_NONE);
  }
}
