// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';

class TogglesModel extends ChangeNotifier {
  bool isWifiButtonOff = true;
  bool isBluetoothButtonOff = true;
  bool isScreenOff = true;
  bool isDoNotDisturbModeOff = true;

  void toggleWifiButton() {
    isWifiButtonOff = !isWifiButtonOff;
    notifyListeners();
  }

  void toggleBluetoothButton() {
    isBluetoothButtonOff = !isBluetoothButtonOff;
    notifyListeners();
  }

  void toggleScreenOffButton() {
    isScreenOff = !isScreenOff;
    notifyListeners();
  }

  void toggleDoNotDisturbButton() {
    isDoNotDisturbModeOff = !isDoNotDisturbModeOff;
    notifyListeners();
  }

  bool get getWifiButtonState => isWifiButtonOff;  
  bool get getBluetoothButtonState => isBluetoothButtonOff;  
  bool get getScreenButtonState => isScreenOff;
  bool get getDoNotDisturbButtonState => isDoNotDisturbModeOff; 
  
}
