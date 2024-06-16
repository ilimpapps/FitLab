// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanToUserAddStruct extends BaseStruct {
  PlanToUserAddStruct({
    List<CoachExercisesPickerStruct>? coachExercisePicker,
    int? day,
    DateTime? time,
    bool? isValidate,
    int? weekday,
    String? name,
  })  : _coachExercisePicker = coachExercisePicker,
        _day = day,
        _time = time,
        _isValidate = isValidate,
        _weekday = weekday,
        _name = name;

  // "coachExercisePicker" field.
  List<CoachExercisesPickerStruct>? _coachExercisePicker;
  List<CoachExercisesPickerStruct> get coachExercisePicker =>
      _coachExercisePicker ?? const [];
  set coachExercisePicker(List<CoachExercisesPickerStruct>? val) =>
      _coachExercisePicker = val;

  void updateCoachExercisePicker(
      Function(List<CoachExercisesPickerStruct>) updateFn) {
    updateFn(coachExercisePicker ??= []);
  }

  bool hasCoachExercisePicker() => _coachExercisePicker != null;

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  set day(int? val) => _day = val;

  void incrementDay(int amount) => day = day + amount;

  bool hasDay() => _day != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  // "isValidate" field.
  bool? _isValidate;
  bool get isValidate => _isValidate ?? false;
  set isValidate(bool? val) => _isValidate = val;

  bool hasIsValidate() => _isValidate != null;

  // "weekday" field.
  int? _weekday;
  int get weekday => _weekday ?? 0;
  set weekday(int? val) => _weekday = val;

  void incrementWeekday(int amount) => weekday = weekday + amount;

  bool hasWeekday() => _weekday != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static PlanToUserAddStruct fromMap(Map<String, dynamic> data) =>
      PlanToUserAddStruct(
        coachExercisePicker: getStructList(
          data['coachExercisePicker'],
          CoachExercisesPickerStruct.fromMap,
        ),
        day: castToType<int>(data['day']),
        time: data['time'] as DateTime?,
        isValidate: data['isValidate'] as bool?,
        weekday: castToType<int>(data['weekday']),
        name: data['name'] as String?,
      );

  static PlanToUserAddStruct? maybeFromMap(dynamic data) => data is Map
      ? PlanToUserAddStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'coachExercisePicker':
            _coachExercisePicker?.map((e) => e.toMap()).toList(),
        'day': _day,
        'time': _time,
        'isValidate': _isValidate,
        'weekday': _weekday,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'coachExercisePicker': serializeParam(
          _coachExercisePicker,
          ParamType.DataStruct,
          isList: true,
        ),
        'day': serializeParam(
          _day,
          ParamType.int,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'isValidate': serializeParam(
          _isValidate,
          ParamType.bool,
        ),
        'weekday': serializeParam(
          _weekday,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlanToUserAddStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlanToUserAddStruct(
        coachExercisePicker: deserializeStructParam<CoachExercisesPickerStruct>(
          data['coachExercisePicker'],
          ParamType.DataStruct,
          true,
          structBuilder: CoachExercisesPickerStruct.fromSerializableMap,
        ),
        day: deserializeParam(
          data['day'],
          ParamType.int,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        isValidate: deserializeParam(
          data['isValidate'],
          ParamType.bool,
          false,
        ),
        weekday: deserializeParam(
          data['weekday'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlanToUserAddStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlanToUserAddStruct &&
        listEquality.equals(coachExercisePicker, other.coachExercisePicker) &&
        day == other.day &&
        time == other.time &&
        isValidate == other.isValidate &&
        weekday == other.weekday &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([coachExercisePicker, day, time, isValidate, weekday, name]);
}

PlanToUserAddStruct createPlanToUserAddStruct({
  int? day,
  DateTime? time,
  bool? isValidate,
  int? weekday,
  String? name,
}) =>
    PlanToUserAddStruct(
      day: day,
      time: time,
      isValidate: isValidate,
      weekday: weekday,
      name: name,
    );
