// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SetsFactStruct extends BaseStruct {
  SetsFactStruct({
    int? index,
    String? completedDateTime,
    int? reps,
    double? kg,
  })  : _index = index,
        _completedDateTime = completedDateTime,
        _reps = reps,
        _kg = kg;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  // "completed_date_time" field.
  String? _completedDateTime;
  String get completedDateTime => _completedDateTime ?? '';
  set completedDateTime(String? val) => _completedDateTime = val;

  bool hasCompletedDateTime() => _completedDateTime != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  set reps(int? val) => _reps = val;

  void incrementReps(int amount) => reps = reps + amount;

  bool hasReps() => _reps != null;

  // "kg" field.
  double? _kg;
  double get kg => _kg ?? 0.0;
  set kg(double? val) => _kg = val;

  void incrementKg(double amount) => kg = kg + amount;

  bool hasKg() => _kg != null;

  static SetsFactStruct fromMap(Map<String, dynamic> data) => SetsFactStruct(
        index: castToType<int>(data['index']),
        completedDateTime: data['completed_date_time'] as String?,
        reps: castToType<int>(data['reps']),
        kg: castToType<double>(data['kg']),
      );

  static SetsFactStruct? maybeFromMap(dynamic data) =>
      data is Map ? SetsFactStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'index': _index,
        'completed_date_time': _completedDateTime,
        'reps': _reps,
        'kg': _kg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
        'completed_date_time': serializeParam(
          _completedDateTime,
          ParamType.String,
        ),
        'reps': serializeParam(
          _reps,
          ParamType.int,
        ),
        'kg': serializeParam(
          _kg,
          ParamType.double,
        ),
      }.withoutNulls;

  static SetsFactStruct fromSerializableMap(Map<String, dynamic> data) =>
      SetsFactStruct(
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
        completedDateTime: deserializeParam(
          data['completed_date_time'],
          ParamType.String,
          false,
        ),
        reps: deserializeParam(
          data['reps'],
          ParamType.int,
          false,
        ),
        kg: deserializeParam(
          data['kg'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SetsFactStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SetsFactStruct &&
        index == other.index &&
        completedDateTime == other.completedDateTime &&
        reps == other.reps &&
        kg == other.kg;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([index, completedDateTime, reps, kg]);
}

SetsFactStruct createSetsFactStruct({
  int? index,
  String? completedDateTime,
  int? reps,
  double? kg,
}) =>
    SetsFactStruct(
      index: index,
      completedDateTime: completedDateTime,
      reps: reps,
      kg: kg,
    );
