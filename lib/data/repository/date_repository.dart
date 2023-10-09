import 'package:weather_app/data/dataSource/date_data.dart';

class WeekRepository {
  final WeekData _weekData = WeekData();

  Future<String> getDayOfWeeky() async {
    return _weekData.getWeekData();
  }
}
