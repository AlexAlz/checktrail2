import 'package:flutter/material.dart';

class SaludDataProvider extends ChangeNotifier {
  Map<String, dynamic> _saludDataValues = {};

  Map<String, dynamic> get saludDataValues => _saludDataValues;

  void setSaludDataValues(Map<String, dynamic> values) {
    _saludDataValues = values;
    notifyListeners();
  }
}
