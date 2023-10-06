import 'package:dio/dio.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/ignore.dart';

class WeatherData {
  Future<List<Item>> getWeatherList() async {
    Dio dio = Dio();

    final response = await dio.get(url);
    var weatherData = WeatherModel.fromJson(response.data);

    return weatherData.response?.body?.items?.item ?? [];
  }
}
