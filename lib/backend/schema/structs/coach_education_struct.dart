// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoachEducationStruct extends BaseStruct {
  CoachEducationStruct({
    String? date,
    String? text,
  })  : _date = date,
        _text = text;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  static CoachEducationStruct fromMap(Map<String, dynamic> data) =>
      CoachEducationStruct(
        date: data['date'] as String?,
        text: data['text'] as String?,
      );

  static CoachEducationStruct? maybeFromMap(dynamic data) => data is Map
      ? CoachEducationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static CoachEducationStruct fromSerializableMap(Map<String, dynamic> data) =>
      CoachEducationStruct(
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CoachEducationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CoachEducationStruct &&
        date == other.date &&
        text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([date, text]);
}

CoachEducationStruct createCoachEducationStruct({
  String? date,
  String? text,
}) =>
    CoachEducationStruct(
      date: date,
      text: text,
    );
