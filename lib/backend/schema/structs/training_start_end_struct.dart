// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrainingStartEndStruct extends BaseStruct {
  TrainingStartEndStruct({
    String? startDateTime,
    String? endDateTime,
  })  : _startDateTime = startDateTime,
        _endDateTime = endDateTime;

  // "start_date_time" field.
  String? _startDateTime;
  String get startDateTime => _startDateTime ?? '';
  set startDateTime(String? val) => _startDateTime = val;

  bool hasStartDateTime() => _startDateTime != null;

  // "end_date_time" field.
  String? _endDateTime;
  String get endDateTime => _endDateTime ?? '';
  set endDateTime(String? val) => _endDateTime = val;

  bool hasEndDateTime() => _endDateTime != null;

  static TrainingStartEndStruct fromMap(Map<String, dynamic> data) =>
      TrainingStartEndStruct(
        startDateTime: data['start_date_time'] as String?,
        endDateTime: data['end_date_time'] as String?,
      );

  static TrainingStartEndStruct? maybeFromMap(dynamic data) => data is Map
      ? TrainingStartEndStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'start_date_time': _startDateTime,
        'end_date_time': _endDateTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'start_date_time': serializeParam(
          _startDateTime,
          ParamType.String,
        ),
        'end_date_time': serializeParam(
          _endDateTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static TrainingStartEndStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TrainingStartEndStruct(
        startDateTime: deserializeParam(
          data['start_date_time'],
          ParamType.String,
          false,
        ),
        endDateTime: deserializeParam(
          data['end_date_time'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TrainingStartEndStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TrainingStartEndStruct &&
        startDateTime == other.startDateTime &&
        endDateTime == other.endDateTime;
  }

  @override
  int get hashCode => const ListEquality().hash([startDateTime, endDateTime]);
}

TrainingStartEndStruct createTrainingStartEndStruct({
  String? startDateTime,
  String? endDateTime,
}) =>
    TrainingStartEndStruct(
      startDateTime: startDateTime,
      endDateTime: endDateTime,
    );
