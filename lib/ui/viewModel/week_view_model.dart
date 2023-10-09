import 'package:flutter/material.dart';
import 'package:weather_app/data/repository/week_repository.dart';

class WeekViewModel extends ChangeNotifier {
  final WeekRepository _weekRepository = WeekRepository();

  String _dayOfWeek = '';

  String get dayOfWeek => _dayOfWeek;

  WeekViewModel() {
    _getDayOfWeek();
  }

  Future<void> _getDayOfWeek() async {
    _dayOfWeek = await _weekRepository.getDayOfWeeky();
    notifyListeners();
  }
}
