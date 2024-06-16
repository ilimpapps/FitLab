// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoachExperienceStruct extends BaseStruct {
  CoachExperienceStruct({
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

  static CoachExperienceStruct fromMap(Map<String, dynamic> data) =>
      CoachExperienceStruct(
        date: data['date'] as String?,
        text: data['text'] as String?,
      );

  static CoachExperienceStruct? maybeFromMap(dynamic data) => data is Map
      ? CoachExperienceStruct.fromMap(data.cast<String, dynamic>())
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

  static CoachExperienceStruct fromSerializableMap(Map<String, dynamic> data) =>
      CoachExperienceStruct(
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
  String toString() => 'CoachExperienceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CoachExperienceStruct &&
        date == other.date &&
        text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([date, text]);
}

CoachExperienceStruct createCoachExperienceStruct({
  String? date,
  String? text,
}) =>
    CoachExperienceStruct(
      date: date,
      text: text,
    );
