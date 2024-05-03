import 'package:intl/intl.dart';

class DateTimeLibraryHelper {
  // Private constructor
  DateTimeLibraryHelper._({this.dateFormat = "dd MMM, yyyy"}) {
    df = DateFormat(dateFormat);
  }

  // Singleton instance
  static final DateTimeLibraryHelper _instance = DateTimeLibraryHelper._();

  // Getter for the singleton instance
  static DateTimeLibraryHelper get instance => _instance;
  final String dateFormat;
  late final DateFormat df; // Declare df as late

  // Getter for the current date and time
  String get now => df.format(DateTime.now());

  String getDate(DateTime? date) => df.format(date ?? DateTime.now());

  DateTime parseDate(String inputDate) => DateTime.parse(inputDate);

  //get starting day of week by given today
  DateTime getDateStartOfWeek(DateTime today) =>
      today.subtract(Duration(days: today.weekday - 1));
}
