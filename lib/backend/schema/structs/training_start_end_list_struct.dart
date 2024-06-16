// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrainingStartEndListStruct extends BaseStruct {
  TrainingStartEndListStruct({
    List<TrainingStartEndStruct>? trainingStartEnd,
  }) : _trainingStartEnd = trainingStartEnd;

  // "training_start_end" field.
  List<TrainingStartEndStruct>? _trainingStartEnd;
  List<TrainingStartEndStruct> get trainingStartEnd =>
      _trainingStartEnd ?? const [];
  set trainingStartEnd(List<TrainingStartEndStruct>? val) =>
      _trainingStartEnd = val;

  void updateTrainingStartEnd(Function(List<TrainingStartEndStruct>) updateFn) {
    updateFn(trainingStartEnd ??= []);
  }

  bool hasTrainingStartEnd() => _trainingStartEnd != null;

  static TrainingStartEndListStruct fromMap(Map<String, dynamic> data) =>
      TrainingStartEndListStruct(
        trainingStartEnd: getStructList(
          data['training_start_end'],
          TrainingStartEndStruct.fromMap,
        ),
      );

  static TrainingStartEndListStruct? maybeFromMap(dynamic data) => data is Map
      ? TrainingStartEndListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'training_start_end': _trainingStartEnd?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'training_start_end': serializeParam(
          _trainingStartEnd,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TrainingStartEndListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TrainingStartEndListStruct(
        trainingStartEnd: deserializeStructParam<TrainingStartEndStruct>(
          data['training_start_end'],
          ParamType.DataStruct,
          true,
          structBuilder: TrainingStartEndStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TrainingStartEndListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TrainingStartEndListStruct &&
        listEquality.equals(trainingStartEnd, other.trainingStartEnd);
  }

  @override
  int get hashCode => const ListEquality().hash([trainingStartEnd]);
}

TrainingStartEndListStruct createTrainingStartEndListStruct() =>
    TrainingStartEndListStruct();
