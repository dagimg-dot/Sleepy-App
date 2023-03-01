// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';

class TogglesModel extends ChangeNotifier {
  bool isWifiButtonOff = false;
  bool isBluetoothButtonOff = false;
  bool isScreenOff = false;
  bool isDoNotDisturbModeOff = false;

  void toggleWifiButton() {
    isWifiButtonOff = !isWifiButtonOff;
    notifyListeners();
  }

  void toggleBluetoothButton() {
    isBluetoothButtonOff = !isBluetoothButtonOff;
    notifyListeners();
  }

  void toggleDoNotDisturbButton() {
    isScreenOff = !isScreenOff;
    notifyListeners();
  }

  void toggleAirplaneModeButton() {
    isDoNotDisturbModeOff = !isDoNotDisturbModeOff;
    notifyListeners();
  }

  bool get getWifiButtonState => isWifiButtonOff;  
  bool get getBluetoothButtonState => isBluetoothButtonOff;  
  bool get getScreenButtonState => isScreenOff;
  bool get getDoNotDisturbButtonState => isDoNotDisturbModeOff; 
  
}
