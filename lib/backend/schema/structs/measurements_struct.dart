// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeasurementsStruct extends BaseStruct {
  MeasurementsStruct({
    String? createdAt,
    double? value,
  })  : _createdAt = createdAt,
        _value = value;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  static MeasurementsStruct fromMap(Map<String, dynamic> data) =>
      MeasurementsStruct(
        createdAt: data['created_at'] as String?,
        value: castToType<double>(data['value']),
      );

  static MeasurementsStruct? maybeFromMap(dynamic data) => data is Map
      ? MeasurementsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
      }.withoutNulls;

  static MeasurementsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MeasurementsStruct(
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MeasurementsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MeasurementsStruct &&
        createdAt == other.createdAt &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([createdAt, value]);
}

MeasurementsStruct createMeasurementsStruct({
  String? createdAt,
  double? value,
}) =>
    MeasurementsStruct(
      createdAt: createdAt,
      value: value,
    );
