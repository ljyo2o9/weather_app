class WeekData {
  Future<String> getWeekData() async {
    String dayOfWeek = await _getDayOfWeek(DateTime.now().weekday);

    return dayOfWeek;
  }

  Future<String> _getDayOfWeek(int weekday) async {
    switch (weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }
}
