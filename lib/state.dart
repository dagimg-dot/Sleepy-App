// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';

class TogglesModel extends ChangeNotifier {
  bool isWifiButtonOff = false;

  // isWifiButtonOff get => isWifiButtonOff;
  // isWifiButtonOff get => isWifiButtonOff;

  bool get getState {
    return isWifiButtonOff;
  }

  toggle() {
    isWifiButtonOff = !isWifiButtonOff;
    notifyListeners();  
  }
}
