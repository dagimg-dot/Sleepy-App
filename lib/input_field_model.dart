import 'package:flutter/foundation.dart';

class InputFieldModel extends ChangeNotifier {
  String _inputFieldText = '';
  late int choosenMin;

  void updateInputFieldText(String text) {
    _inputFieldText = text;
    notifyListeners();
  }

  void updateChoosenMin(int num) {
    choosenMin = num;
    notifyListeners();
  }

  String get getInputFieldText => _inputFieldText;
  int get getChoosenMin => choosenMin;
  
}