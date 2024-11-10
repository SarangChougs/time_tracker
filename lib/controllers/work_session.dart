// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class WorkSession with ChangeNotifier {
  late DateTime _startTime;
  late DateTime _pauseTime;
  late DateTime _endTime;
  bool _isPaused = false;

  void startSession() {
    _startTime = DateTime.now();
    _isPaused = false;
    notifyListeners();
  }

  void pauseSession() {
    _pauseTime = DateTime.now();
    _isPaused = true;
    notifyListeners();
  }

  void endSession() {
    _endTime = DateTime.now();
    notifyListeners();
  }
}