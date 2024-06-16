// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SetsPlanStruct extends BaseStruct {
  SetsPlanStruct({
    String? name,
    int? reps,
    double? weightKg,
  })  : _name = name,
        _reps = reps,
        _weightKg = weightKg;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  set reps(int? val) => _reps = val;

  void incrementReps(int amount) => reps = reps + amount;

  bool hasReps() => _reps != null;

  // "weight_kg" field.
  double? _weightKg;
  double get weightKg => _weightKg ?? 0.0;
  set weightKg(double? val) => _weightKg = val;

  void incrementWeightKg(double amount) => weightKg = weightKg + amount;

  bool hasWeightKg() => _weightKg != null;

  static SetsPlanStruct fromMap(Map<String, dynamic> data) => SetsPlanStruct(
        name: data['name'] as String?,
        reps: castToType<int>(data['reps']),
        weightKg: castToType<double>(data['weight_kg']),
      );

  static SetsPlanStruct? maybeFromMap(dynamic data) =>
      data is Map ? SetsPlanStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'reps': _reps,
        'weight_kg': _weightKg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'reps': serializeParam(
          _reps,
          ParamType.int,
        ),
        'weight_kg': serializeParam(
          _weightKg,
          ParamType.double,
        ),
      }.withoutNulls;

  static SetsPlanStruct fromSerializableMap(Map<String, dynamic> data) =>
      SetsPlanStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        reps: deserializeParam(
          data['reps'],
          ParamType.int,
          false,
        ),
        weightKg: deserializeParam(
          data['weight_kg'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SetsPlanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SetsPlanStruct &&
        name == other.name &&
        reps == other.reps &&
        weightKg == other.weightKg;
  }

  @override
  int get hashCode => const ListEquality().hash([name, reps, weightKg]);
}

SetsPlanStruct createSetsPlanStruct({
  String? name,
  int? reps,
  double? weightKg,
}) =>
    SetsPlanStruct(
      name: name,
      reps: reps,
      weightKg: weightKg,
    );
