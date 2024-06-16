import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? stringToImagePath(String? string) {
  return string!;
}

int? subtractOne(int? value) {
  return (value! - 1 < 0) ? 0 : value! - 1;
}

bool? search(
  String? searchInput,
  String? title,
) {
  if (searchInput == null || title == null) {
    return false;
  }

  // Приводим обе строки к нижнему регистру для поиска без учета регистра
  String lowerCaseSearchInput = searchInput.toLowerCase();
  String lowerCaseTitle = title.toLowerCase();

  // Проверяем, содержит ли title подстроку searchInput
  if (lowerCaseTitle.contains(lowerCaseSearchInput)) {
    return true;
  } else {
    return false;
  }
}

String? listToCommaString(List<String>? stringList) {
  return stringList!.join(', ');
}

String combineInitials(
  String firstName,
  String lastName,
) {
  String firstInitial = firstName[0].toUpperCase();
  String lastInitial = lastName[0].toUpperCase();

  String combinedInitials = '$firstInitial$lastInitial';

  return combinedInitials;
}

String? formatDurationSec(int? seconds) {
  if (seconds == null) {
    return 'null';
  } else if (seconds < 60) {
    return '$seconds сек';
  } else if (seconds < 3600) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = seconds % 60;
    return '$minutes мин $remainingSeconds сек';
  } else {
    double hours = seconds / 3600;
    int remainingMinutes = (seconds % 3600 / 60).floor();
    int remainingSeconds = seconds % 60;
    return '$hours ч $remainingMinutes мин $remainingSeconds сек';
  }
}

DateTime? dateTimePlusDay(
  DateTime? dateTime,
  int? daysToAdd,
) {
  dateTime = DateTime(dateTime!.year, dateTime.month, dateTime.day);
  return dateTime.add(Duration(days: daysToAdd!));
}

DateTime? dateTimeToDate(DateTime? dateTime) {
  return DateTime(dateTime!.year, dateTime!.month, dateTime!.day);
}

List<DateTime>? dateTimeList(
  DateTime? startDate,
  DateTime? endDate,
) {
  if (startDate == null || endDate == null) {
    return null;
  }

  List<DateTime> dateTimeList = [];
  int numberOfDays =
      endDate.difference(startDate).inDays + 1; // inclusive of endDate

  for (int i = 0; i < numberOfDays; i++) {
    dateTimeList.add(startDate.add(Duration(days: i)));
  }
  return dateTimeList;
}

String? dateTimeCalendarTitle(DateTime? date) {
  if (date == null) {
    return 'null';
  }

  final List<String> months = [
    '', // Нулевой элемент, так как месяцы начинаются с 1
    'ЯНВАРЯ', 'ФЕВРАЛЯ', 'МАРТА', 'АПРЕЛЯ', 'МАЯ', 'ИЮНЯ',
    'ИЮЛЯ', 'АВГУСТА', 'СЕНТЯБРЯ', 'ОКТЯБРЯ', 'НОЯБРЯ', 'ДЕКАБРЯ'
  ];
  String monthName = months[date.month];
  return '${date.day} $monthName ${date.year}';
}

double? stringToDouble(String? input) {
  String processedInput = input!.replaceAll(',', '.');

  // Найти первую точку и удалить все последующие точки
  int firstDotIndex = processedInput.indexOf('.');
  if (firstDotIndex != -1) {
    processedInput = processedInput.substring(0, firstDotIndex + 1) +
        processedInput.substring(firstDotIndex + 1).replaceAll('.', '');
  }

  // Преобразовать строку в double
  return double.parse(processedInput);
}

bool? checkDoubleValues(
  double? min,
  double? max,
  String? input,
) {
  if (input == null || input.isEmpty) {
    return false; // Пустая строка или null не являются допустимыми значениями
  }

  // Замена запятых на точки
  String processedInput = input.replaceAll(',', '.');

  // Найти первую точку и удалить все последующие точки
  int firstDotIndex = processedInput.indexOf('.');
  if (firstDotIndex != -1) {
    processedInput = processedInput.substring(0, firstDotIndex + 1) +
        processedInput.substring(firstDotIndex + 1).replaceAll('.', '');
  }

  // Преобразовать строку в double
  double? parsedDouble;
  try {
    parsedDouble = double.parse(processedInput);
  } catch (e) {
    return false; // Если не удается преобразовать в double, возвращаем false
  }

  // Проверка на соответствие пределам
  if (parsedDouble < min! || parsedDouble > max!) {
    return false; // Если значение выходит за пределы, возвращаем false
  }

  return true; // Значение в пределах допустимых значений
}

String toLowerCase(String input) {
  return input.toLowerCase();
}

double? progressbar(
  double? plan,
  double? fact,
) {
  if (plan == null || plan.isNaN || fact == null || fact.isNaN) {
    return 0;
  }

  double result = fact / plan;

  // Проверяем, является ли результат NaN
  if (result.isNaN) {
    return 0;
  }

  if (result > 1) {
    return 1;
  }

  return result;
}

int? trainingsRepsLeft(
  int? setsPlan,
  int? setsFact,
) {
  if (setsPlan == null || setsFact == null) {
    return 0;
  }

  return setsPlan - setsFact;
}

String? dateTimeShortWeekday(DateTime? dateTime) {
  if (dateTime == null) {
    return 'null';
  }

  const List<String> weekdays = [
    'ПН', // Monday
    'ВТ', // Tuesday
    'СР', // Wednesday
    'ЧТ', // Thursday
    'ПТ', // Friday
    'СБ', // Saturday
    'ВС' // Sunday
  ];

  // In Dart, DateTime.weekday returns 1 for Monday and 7 for Sunday.
  return weekdays[dateTime.weekday - 1];
}

int? trainingTotalReps(
  int? reps,
  int? sets,
) {
  if (reps == null || sets == null) {
    return 0;
  }

  return reps! * sets!;
}

bool? isInStringList(
  String? target,
  List<String>? stringList,
) {
  return stringList!.contains(target!) ?? false;
}

String? homeGreet(DateTime? dateTime) {
  if (dateTime == null) {
    return 'Доброго времени суток';
  }

  int hour = dateTime.hour;

  switch (hour ~/ 6) {
    case 1:
      return 'Доброе утро';
    case 2:
      return 'Добрый день';
    case 3:
      return 'Добрый вечер';
    default:
      return 'Доброго времени суток';
  }
}

String? stringUpperCase(String? input) {
  if (input == null) {
    return 'null';
  }

  return input.toUpperCase();
}

DateTime? dateTimeUtc(DateTime? dateTime) {
  return dateTime!.toUtc(); // Получаем текущее время в UTC
}

int? sumIntList(List<int>? intList) {
  if (intList == null || intList.isEmpty) {
    return 0;
  }

  int sum = 0;
  for (int number in intList) {
    sum += number;
  }

  return sum;
}

List<DateTime> generateCarouselDateList() {
  var now = DateTime.now();
  var startDate = now.subtract(Duration(days: 10));
  var dates = <DateTime>[];

  for (int i = 0; i <= 40; i++) {
    // 10 дней назад + 30 дней вперед = 41 дата
    dates.add(startDate.add(Duration(days: i)));
  }

  return dates;
}

DateTime startOfDay(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}

DateTime endOfDay(DateTime date) {
  return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
}

List<int>? chartAxisYpx(List<double>? values) {
  if (values == null || values.isEmpty) {
    return null;
  }

  List<int> result = [];

  // Find the maximum value in the list
  double maxValue =
      values.reduce((value, element) => value > element ? value : element);

  // Find the minimum value in the list
  double minValue =
      values.reduce((value, element) => value < element ? value : element);

  // If all values are equal, set increment to 1
  double increment = maxValue == minValue ? 1 : (maxValue - minValue) / 4;

  // Add the rounded values to the result list
  for (int i = 0; i < 5; i++) {
    int value = (minValue + i * increment).round();
    if (!result.contains(value)) {
      result.add(value);
    }
  }

  return result.reversed.toList();
}

List<int>? chartAxisXitems(int? items) {
  List<int> list = [];
  if (items! == null) return list;
  for (var i = 0; i < items!; i++) {
    list.add(i);
  }
  return list;
}

double? diaryChartContainerWidth(
  double? amountDays,
  double? stepPx,
) {
  final a = amountDays! * stepPx!;
  return a;
}

DateTime? dateTimeMiusDay(
  DateTime? dateTime,
  int? daysToSubtract,
) {
  dateTime = DateTime(dateTime!.year, dateTime.month, dateTime.day);
  return dateTime.subtract(Duration(days: daysToSubtract!));
}

String? dateTimeToString(DateTime? dateTime) {
  return dateTime!.toIso8601String();
}

DateTime? stringToDateTime(String? dateTimeString) {
  return DateTime.parse(dateTimeString!);
}

String? getThirdWeekRange() {
  // Получаем текущую дату
  DateTime now = DateTime.now();

  // Вычисляем начало второй недели
  DateTime startOfSecondWeek =
      now.add(Duration(days: (2 * 7) - now.weekday + 1));

  // Вычисляем конец второй недели
  DateTime endOfSecondWeek = startOfSecondWeek.add(Duration(days: 6));

  // Форматируем даты
  DateFormat dateFormat = DateFormat('d MMM', 'ru_RU');
  String startFormatted = dateFormat.format(startOfSecondWeek);
  String endFormatted = dateFormat.format(endOfSecondWeek);

  // Возвращаем диапазон дат
  return '$startFormatted - $endFormatted';
}

int? dateTimeWeekday(DateTime? dateTime) {
  return dateTime!.weekday;
}

double? customProgressBar(
  double? fact,
  double? plan,
  double? maxScreenWidth,
  double? progressBarPadding,
) {
  if (fact! <= 0 || plan! <= 0 || maxScreenWidth! <= 0) {
    return 1;
  }

  double progress =
      (fact! / plan!) * (maxScreenWidth! - (progressBarPadding! * 2));
  if (progress < 0) {
    return 1;
  } else if (progress > maxScreenWidth! - (progressBarPadding! * 2)) {
    return maxScreenWidth! - (progressBarPadding! * 2);
  }

  return progress;
}

String getExerciseWord(int count) {
  int lastDigit = count % 10;
  int lastTwoDigits = count % 100;

  if (lastTwoDigits >= 11 && lastTwoDigits <= 14) {
    return '$count упражнений';
  } else if (lastDigit == 1) {
    return '$count упражнение';
  } else if (lastDigit >= 2 && lastDigit <= 4) {
    return '$count упражнения';
  } else {
    return '$count упражнений';
  }
}

List<int>? intList(int? lastValue) {
  List<int> result = [];
  for (int i = 1; i <= lastValue!; i++) {
    result.add(i);
  }
  return result;
}

String formatShortDate(DateTime date) {
  // Создаем список сокращенных названий месяцев
  const List<String> months = [
    "янв",
    "фев",
    "мар",
    "апр",
    "мая",
    "июн",
    "июл",
    "авг",
    "сен",
    "окт",
    "ноя",
    "дек"
  ];

  // Получаем номер дня и месяца
  int day = date.day;
  String month = months[date.month - 1];

  // Формируем и возвращаем строку в нужном формате
  return "$day $month";
}

List<CoachExercisesPickerStruct>? coachExercisesPickerMerge(
  List<CoachExercisesPickerStruct>? coachExercisesPicker1,
  List<CoachExercisesPickerStruct>? coachExercisesPicker2,
) {
  // Initialize an empty list to store the merged results
  final List<CoachExercisesPickerStruct> mergedList = [];

  // Add all elements from coachExercisesPicker1 if it's not null
  if (coachExercisesPicker1 != null) {
    mergedList.addAll(coachExercisesPicker1);
  }

  // Add all elements from coachExercisesPicker2 if it's not null
  if (coachExercisesPicker2 != null) {
    mergedList.addAll(coachExercisesPicker2);
  }

  return mergedList;
}

String? dateTimeCapsWeekday(int? dayNumber) {
  switch (dayNumber) {
    case 1:
      return 'ПОНЕДЕЛЬНИК';
    case 2:
      return 'ВТОРНИК';
    case 3:
      return 'СРЕДА';
    case 4:
      return 'ЧЕТВЕРГ';
    case 5:
      return 'ПЯТНИЦА';
    case 6:
      return 'СУББОТА';
    case 7:
      return 'ВОСКРЕСЕНЬЕ';
    default:
      return 'НЕВЕРНЫЙ ДЕНЬ';
  }
}

List<DateTime>? addDateTimeToList(
  DateTime? dateTime,
  List<DateTime>? dateTimeList,
) {
// Если оба значения null, возвращаем пустой список
  if (dateTimeList == null && dateTime == null) {
    return [];
  }

  // Если список null, создаем новый список
  if (dateTimeList == null) {
    dateTimeList = [];
  }

  // Если dateTime не null, добавляем его в список
  if (dateTime != null) {
    dateTimeList.add(dateTime);
  }

  // Возвращаем обновленный список
  return dateTimeList;
}

String getWorkoutString(int count) {
  String workoutWord;
  if (count % 10 == 1 && count % 100 != 11) {
    workoutWord = 'тренировка';
  } else if ((count % 10 >= 2 && count % 10 <= 4) &&
      !(count % 100 >= 12 && count % 100 <= 14)) {
    workoutWord = 'тренировки';
  } else {
    workoutWord = 'тренировок';
  }
  return '$count $workoutWord';
}

String getSetWordString(int count) {
  String approachWord;
  if (count % 10 == 1 && count % 100 != 11) {
    approachWord = 'подход';
  } else if ((count % 10 >= 2 && count % 10 <= 4) &&
      !(count % 100 >= 12 && count % 100 <= 14)) {
    approachWord = 'подхода';
  } else {
    approachWord = 'подходов';
  }
  return '$count $approachWord';
}

String differenceInHoursAndMinutes(
  DateTime start,
  DateTime end,
) {
  Duration diff = end.difference(start);

  int hours = diff.inHours;
  int minutes = diff.inMinutes.remainder(60);

  String hoursStr;
  if (hours == 1) {
    hoursStr = '1 час';
  } else if (hours > 1 && hours < 5) {
    hoursStr = '$hours часа';
  } else {
    hoursStr = '$hours часов';
  }

  String minutesStr;
  if (minutes == 1) {
    minutesStr = '1 минута';
  } else if (minutes > 1 && minutes < 5) {
    minutesStr = '$minutes минуты';
  } else {
    minutesStr = '$minutes минут';
  }

  return '$hoursStr $minutesStr';
}

bool searchStringInList(
  String stringList,
  String stringSearch,
) {
  if (stringList!.toLowerCase().contains(stringSearch!.toLowerCase())) {
    return true;
  } else {
    return false;
  }
}
