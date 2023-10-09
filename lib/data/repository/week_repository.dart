import 'package:weather_app/data/dataSource/week_data.dart';

class WeekRepository {
  final WeekData _weekData = WeekData();

  Future<String> getWeekOfDay() async {
    return _weekData.getWeekData();
  }
}