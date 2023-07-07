import 'package:android_flutter_wifi/android_flutter_wifi.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class AndroidControls {
  static void toggleWifiButton() {
    AndroidFlutterWifi.isWifiEnabled()
        .then((value) => {if (value) AndroidFlutterWifi.disableWifi()});
  }

  static void toggleBT() {
    FlutterBluetoothSerial.instance.requestDisable().then((value) => {
      if(value == true) {
        print("Bluetooth is disabled")
      }
    });
  }
}