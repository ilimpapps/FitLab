// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoachExercisesPickerStruct extends BaseStruct {
  CoachExercisesPickerStruct({
    int? rlExercises,
    String? name,
    SetsPlanListStruct? sets,
  })  : _rlExercises = rlExercises,
        _name = name,
        _sets = sets;

  // "rl_exercises" field.
  int? _rlExercises;
  int get rlExercises => _rlExercises ?? 0;
  set rlExercises(int? val) => _rlExercises = val;

  void incrementRlExercises(int amount) => rlExercises = rlExercises + amount;

  bool hasRlExercises() => _rlExercises != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "sets" field.
  SetsPlanListStruct? _sets;
  SetsPlanListStruct get sets => _sets ?? SetsPlanListStruct();
  set sets(SetsPlanListStruct? val) => _sets = val;

  void updateSets(Function(SetsPlanListStruct) updateFn) {
    updateFn(sets ??= SetsPlanListStruct());
  }

  bool hasSets() => _sets != null;

  static CoachExercisesPickerStruct fromMap(Map<String, dynamic> data) =>
      CoachExercisesPickerStruct(
        rlExercises: castToType<int>(data['rl_exercises']),
        name: data['name'] as String?,
        sets: SetsPlanListStruct.maybeFromMap(data['sets']),
      );

  static CoachExercisesPickerStruct? maybeFromMap(dynamic data) => data is Map
      ? CoachExercisesPickerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rl_exercises': _rlExercises,
        'name': _name,
        'sets': _sets?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rl_exercises': serializeParam(
          _rlExercises,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'sets': serializeParam(
          _sets,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CoachExercisesPickerStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CoachExercisesPickerStruct(
        rlExercises: deserializeParam(
          data['rl_exercises'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        sets: deserializeStructParam(
          data['sets'],
          ParamType.DataStruct,
          false,
          structBuilder: SetsPlanListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CoachExercisesPickerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CoachExercisesPickerStruct &&
        rlExercises == other.rlExercises &&
        name == other.name &&
        sets == other.sets;
  }

  @override
  int get hashCode => const ListEquality().hash([rlExercises, name, sets]);
}

CoachExercisesPickerStruct createCoachExercisesPickerStruct({
  int? rlExercises,
  String? name,
  SetsPlanListStruct? sets,
}) =>
    CoachExercisesPickerStruct(
      rlExercises: rlExercises,
      name: name,
      sets: sets ?? SetsPlanListStruct(),
    );
