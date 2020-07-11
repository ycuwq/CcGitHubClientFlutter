
import 'dart:ui';

import 'package:ccgithubclientflutter/generated/l10n.dart';
/// String 工具类
class StringUtils {
  static final double MILLIS_LIMIT = 1000.0;

  static final double SECONDS_LIMIT = 60 * MILLIS_LIMIT;

  static final double MINUTES_LIMIT = 60 * SECONDS_LIMIT;

  static final double HOURS_LIMIT = 24 * MINUTES_LIMIT;

  static final double DAYS_LIMIT = 30 * HOURS_LIMIT;

  static String getDateStr(DateTime date) {
    if (date == null || date.toString() == null) {
      return "";
    } else if (date.toString().length < 10) {
      return date.toString();
    }
    return date.toString().substring(0, 10);
  }

  static String getNewsTimeStr(S appLocation, DateTime date) {

    int subTimes =
        DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;
    if (subTimes < MILLIS_LIMIT) {
      return appLocation.right_now;
    } else if (subTimes < SECONDS_LIMIT) {
      return appLocation.seconds_ago((subTimes / MILLIS_LIMIT).round().toString());
    } else if (subTimes < MINUTES_LIMIT) {
      return appLocation.minute_ago((subTimes / SECONDS_LIMIT).round().toString());
    } else if (subTimes < HOURS_LIMIT) {
      return appLocation.hours_ago((subTimes / MINUTES_LIMIT).round().toString());
    } else if (subTimes < DAYS_LIMIT) {
      return appLocation.days_ago((subTimes / HOURS_LIMIT).round().toString());
    } else {
      return getDateStr(date);
    }
  }

}
