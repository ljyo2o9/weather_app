import 'package:flutter/widgets.dart';

import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository _weatherRepository = WeatherRepository();

  List<Item> _weatherList = List.empty(growable: true);

  List<Item> get weatherList => _weatherList;

  WeatherViewModel() {
    _getWeatherList();
  }

  Future<void> _getWeatherList() async {
    _weatherList = await _weatherRepository.getWeatherList();
    notifyListeners();
  }
}
