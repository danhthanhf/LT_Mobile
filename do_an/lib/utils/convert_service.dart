class ConvertService {
  static String convertToTitle(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  static String convertDuration(int duration) {
    int hours = duration ~/ 3600;
    int minutes = duration ~/ 60;
    if(hours == 0) return "$minutes Minutes";
    if(minutes == 0 && hours == 0) return "$duration Seconds";
    return "$hours Hours $minutes Minutes";
  }
}