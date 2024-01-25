import 'package:intl/intl.dart';

abstract class TimeUtilities {
  static String? fromServerFormatDateTime12(String? dbTime) {
    return strDateFormatter(dbTime, 'yyyy-MM-dd hh:mm:ss a');
  }

  static String? fromServerFormatDateTime24(String? dbTime) {
    return strDateFormatter(dbTime, 'yyyy-MM-dd HH:mm:ss');
  }

  static String? strDateFormatter(String? strDate, String format) {
    try {
      if (strDate == null) {
        throw Exception('Invalid date format.');
      }
      // Parse the input time string into a DateTime object, assuming UTC timezone
      final dateTime = DateTime.parse(strDate).toUtc();
      // Format the DateTime object with the desired output format
      final formattedTime = DateFormat(format).format(dateTime);
      return formattedTime;
    } catch (error, stack) {
      // Handle any errors during parsing or formatting
      print('Error converting time: $error');
      print(stack);
      return strDate; // Return the original value if conversion fails
    }
  }
  static String calculateTimeAgo(DateTime? givenTime) {
    try {
      if (givenTime==null){
        throw Exception('GivenTime is null.');
      }
      final now = DateTime.now();
      final difference = now.difference(givenTime);

      if (difference.inSeconds < 60) {
        return '${difference.inSeconds} seconds ago';
      } else if (difference.inMinutes < 60) {
        final minutes = difference.inMinutes;
        return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
      } else if (difference.inHours < 24) {
        final hours = difference.inHours;
        return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
      } else if (difference.inDays < 7) {
        final days = difference.inDays;
        return '$days ${days == 1 ? 'day' : 'days'} ago';
      } else if (difference.inDays < 30) {
        final weeks = (difference.inDays / 7).floor();
        return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
      } else if (difference.inDays < 365) {
        final months = (difference.inDays / 30).floor();
        return '$months ${months == 1 ? 'month' : 'months'} ago';
      } else {
        final years = (difference.inDays / 365).floor();
        return '$years ${years == 1 ? 'year' : 'years'} ago';
      }
    }catch (e,s) {
      print(e);
      print(s);
      return 'Now';
    }
  }
}
