import 'package:beu_/for%20homepage/date&time/date_time.dart';
import 'package:hive/hive.dart';

final _myBox = Hive.box("Habit_Database");

class HabitDatabase {
  List<dynamic>? todaysHabitList = [];
  Map<DateTime, int> heatMapDataSet = {};

  // create initial default data
  void createDefaultData() {
    todaysHabitList = [
      ["Run", false],
      ["Read", false],
    ];

    _myBox.put("START_DATE", todaysDateFormatted());
  }

  // load data if it already exists
  void loadData() {
    // if it's a new day, get habit list from the database
    if (_myBox.get(todaysDateFormatted()) == null) {
      todaysHabitList = _myBox.get("CURRENT_HABIT_LIST");
      // set all habit completed to false since it's a new day
      for (int i = 0; todaysHabitList != null && i < todaysHabitList!.length; i++) {
        todaysHabitList![i][1] = false;
      }
    }
    // if it's not a new day, load today's list
    else {
      todaysHabitList = _myBox.get(todaysDateFormatted());
    }
  }

  // update database
  void updateDatabase() {
    // update today's entry
    _myBox.put(todaysDateFormatted(), todaysHabitList);

    // update universal habit list in case it changed (new habit, edit habit, delete habit)
    _myBox.put("CURRENT_HABIT_LIST", todaysHabitList);

    // calculate habit completion percentages for each day
    calculateHabitPercentages();

    // load heat map
    loadHeatMap();
  }

  void calculateHabitPercentages() {
    if (todaysHabitList == null) {
      todaysHabitList = []; // Initialize it as an empty list
    }

    int countCompleted = 0;

    // Check if todaysHabitList is not null before attempting to access its length
    if (todaysHabitList != null) {
      for (int i = 0; i < todaysHabitList!.length; i++) {
        // Check if the second element in the inner list exists before accessing it
        if (todaysHabitList![i].length > 1 && todaysHabitList![i][1] == true) {
          countCompleted++;
        }
      }
    }

    // Use null-aware operator to handle potential null values
    String percent = todaysHabitList?.isEmpty ?? true
        ? '0.0'
        : (countCompleted / todaysHabitList!.length).toStringAsFixed(1);

    // key: "PERCENTAGE_SUMMARY_yyyymmdd"
    // value: string of 1dp number between 0.0-1.0 inclusive
    _myBox.put("PERCENTAGE_SUMMARY_${todaysDateFormatted()}", percent);
  }

  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(_myBox.get("START_DATE"));

    // count the number of days to load
    int daysInBetween = DateTime.now().difference(startDate).inDays;

    // go from start date to today and add each percentage to the dataset
    // "PERCENTAGE_SUMMARY_yyyymmdd" will be the key in the database
    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd = convertDateTimeToString(
        startDate.add(Duration(days: i)),
      );

      double strengthAsPercent = double.parse(
        _myBox.get("PERCENTAGE_SUMMARY_$yyyymmdd") ?? "0.0",
      );

      // split the datetime up like below so it doesn't worry about hours/mins/secs etc.

      // year
      int year = startDate.add(Duration(days: i)).year;

      // month
      int month = startDate.add(Duration(days: i)).month;

      // day
      int day = startDate.add(Duration(days: i)).day;

      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): (10 * strengthAsPercent).toInt(),
      };

      heatMapDataSet.addEntries(percentForEachDay.entries);
      print(heatMapDataSet);
    }
  }
}