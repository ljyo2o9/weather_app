import 'package:dio/dio.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/ignore.dart';

class WeatherData {
  Future<List<WeatherModel>> getWeatherList() async {
    Dio dio = Dio();

    final response = await dio.get(url);
    return response.data
        .map<WeatherModel>((json) => WeatherModel.fromJson(json))
        .toList();
  }
}
