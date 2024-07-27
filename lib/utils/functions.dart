import 'dart:math';
 class Functions {
  static DateTime parseISODate(String dateString) {
  return DateTime.parse(dateString);
}

static String formatTimeAgo(DateTime dateTime) {
  final differenceInMilliseconds = DateTime.now().difference(dateTime).inMilliseconds;
  final minutesAgo = (differenceInMilliseconds / (1000 * 60)).round();
  print(minutesAgo);
  if (minutesAgo < 60) {
    return '$minutesAgo minutes ago';
  } else if (minutesAgo < 1440) { // Less than 24 hours
    final hoursAgo = (minutesAgo / 60).round();
    return '$hoursAgo hours ago';
  } else {
    // // Handle days, weeks, months, years as needed
    // return 'Earlier'; // Or a more specific format
    final differenceInDays = DateTime.now().difference(dateTime).inDays;

  if (differenceInDays == 0) {
    // Handle minutes or hours ago logic
    final differenceInMinutes = DateTime.now().difference(dateTime).inMinutes;
    return differenceInMinutes < 60 ? '$differenceInMinutes minutes ago' : '${(differenceInMinutes / 60).round()} hours ago';
  } else if (differenceInDays < 7) {
    return '$differenceInDays days ago';
  } else {
    // Handle weeks, months, or years as needed
    return 'Earlier';
  }
  }
}
}