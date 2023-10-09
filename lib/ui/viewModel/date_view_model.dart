import 'package:flutter/material.dart';
import 'package:weather_app/data/repository/date_repository.dart';

class DateViewModel extends ChangeNotifier {
  final WeekRepository _weekRepository = WeekRepository();

  String _dayOfWeek = '';

  String get dayOfWeek => _dayOfWeek;

  DateViewModel() {
    _getDayOfWeek();
  }

  Future<void> _getDayOfWeek() async {
    _dayOfWeek = await _weekRepository.getDayOfWeek();
    notifyListeners();
  }
}
