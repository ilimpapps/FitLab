// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayCreationDayStruct extends BaseStruct {
  PlayCreationDayStruct({
    int? day,
    int? weekday,
    DateTime? time,
  })  : _day = day,
        _weekday = weekday,
        _time = time;

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  set day(int? val) => _day = val;

  void incrementDay(int amount) => day = day + amount;

  bool hasDay() => _day != null;

  // "weekday" field.
  int? _weekday;
  int get weekday => _weekday ?? 0;
  set weekday(int? val) => _weekday = val;

  void incrementWeekday(int amount) => weekday = weekday + amount;

  bool hasWeekday() => _weekday != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  static PlayCreationDayStruct fromMap(Map<String, dynamic> data) =>
      PlayCreationDayStruct(
        day: castToType<int>(data['day']),
        weekday: castToType<int>(data['weekday']),
        time: data['time'] as DateTime?,
      );

  static PlayCreationDayStruct? maybeFromMap(dynamic data) => data is Map
      ? PlayCreationDayStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'day': _day,
        'weekday': _weekday,
        'time': _time,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'day': serializeParam(
          _day,
          ParamType.int,
        ),
        'weekday': serializeParam(
          _weekday,
          ParamType.int,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static PlayCreationDayStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlayCreationDayStruct(
        day: deserializeParam(
          data['day'],
          ParamType.int,
          false,
        ),
        weekday: deserializeParam(
          data['weekday'],
          ParamType.int,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'PlayCreationDayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlayCreationDayStruct &&
        day == other.day &&
        weekday == other.weekday &&
        time == other.time;
  }

  @override
  int get hashCode => const ListEquality().hash([day, weekday, time]);
}

PlayCreationDayStruct createPlayCreationDayStruct({
  int? day,
  int? weekday,
  DateTime? time,
}) =>
    PlayCreationDayStruct(
      day: day,
      weekday: weekday,
      time: time,
    );
