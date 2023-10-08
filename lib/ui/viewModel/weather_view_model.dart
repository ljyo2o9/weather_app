import 'package:flutter/widgets.dart';

import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/ignore.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository _weatherRepository = WeatherRepository();

  Map<String, dynamic> _category = {};
  List<Item> _weatherList = [];

  Map<String, dynamic> get category => _category;

  List<Item> get weatherList => _weatherList;

  WeatherViewModel() {
    _getWeatherList();
  }

  Future<void> _getWeatherList() async {
    _weatherList = await _weatherRepository.getWeatherList();

    print(hourModel);

    for (int i = 0; i < _weatherList.length; i++) {
      if (_weatherList[i].fcstTime == ('${hourModel}00')) {
        if (_weatherList[i].category == "TMP") {
          _category = {
            'tmp': _weatherList[i].fcstValue.toString(),
            'uuu': _weatherList[i + 1].fcstValue.toString(),
            'vvv': _weatherList[i + 2].fcstValue.toString(),
            'vec': _weatherList[i + 3].fcstValue.toString(),
            'wsd': _weatherList[i + 4].fcstValue.toString(),
            'sky': _weatherList[i + 5].fcstValue.toString(),
            'pty': _weatherList[i + 6].fcstValue.toString(),
            'pop': _weatherList[i + 7].fcstValue.toString(),
            'wav': _weatherList[i + 8].fcstValue.toString(),
            'pcp': _weatherList[i + 9].fcstValue.toString(),
            'reh': _weatherList[i + 10].fcstValue.toString(),
            'sno': _weatherList[i + 11].fcstValue.toString(),
          };
        }
      }
    }
    notifyListeners();
  }
}
