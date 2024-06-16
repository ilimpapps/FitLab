// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeasurementsTemplateStruct extends BaseStruct {
  MeasurementsTemplateStruct({
    List<MeasurementsStruct>? measurements,
  }) : _measurements = measurements;

  // "measurements" field.
  List<MeasurementsStruct>? _measurements;
  List<MeasurementsStruct> get measurements => _measurements ?? const [];
  set measurements(List<MeasurementsStruct>? val) => _measurements = val;

  void updateMeasurements(Function(List<MeasurementsStruct>) updateFn) {
    updateFn(measurements ??= []);
  }

  bool hasMeasurements() => _measurements != null;

  static MeasurementsTemplateStruct fromMap(Map<String, dynamic> data) =>
      MeasurementsTemplateStruct(
        measurements: getStructList(
          data['measurements'],
          MeasurementsStruct.fromMap,
        ),
      );

  static MeasurementsTemplateStruct? maybeFromMap(dynamic data) => data is Map
      ? MeasurementsTemplateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'measurements': _measurements?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'measurements': serializeParam(
          _measurements,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MeasurementsTemplateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MeasurementsTemplateStruct(
        measurements: deserializeStructParam<MeasurementsStruct>(
          data['measurements'],
          ParamType.DataStruct,
          true,
          structBuilder: MeasurementsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MeasurementsTemplateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MeasurementsTemplateStruct &&
        listEquality.equals(measurements, other.measurements);
  }

  @override
  int get hashCode => const ListEquality().hash([measurements]);
}

MeasurementsTemplateStruct createMeasurementsTemplateStruct() =>
    MeasurementsTemplateStruct();
