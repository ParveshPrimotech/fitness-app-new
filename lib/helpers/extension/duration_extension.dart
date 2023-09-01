extension DurationExtension on Duration {
  String toStringInHoursMinutesSeconds() {
    if (inHours >= 1) {
      return "$inHours Hours";
    } else if (inMinutes == 1) {
      return "$inMinutes Minute";
    } else if (inMinutes >= 1) {
      return "$inMinutes Minutes";
    } else {
      return "$inSeconds Seconds";
    }
  }
}
