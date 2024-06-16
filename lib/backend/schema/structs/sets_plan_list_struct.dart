// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SetsPlanListStruct extends BaseStruct {
  SetsPlanListStruct({
    List<SetsPlanStruct>? setsPlan,
  }) : _setsPlan = setsPlan;

  // "sets_plan" field.
  List<SetsPlanStruct>? _setsPlan;
  List<SetsPlanStruct> get setsPlan => _setsPlan ?? const [];
  set setsPlan(List<SetsPlanStruct>? val) => _setsPlan = val;

  void updateSetsPlan(Function(List<SetsPlanStruct>) updateFn) {
    updateFn(setsPlan ??= []);
  }

  bool hasSetsPlan() => _setsPlan != null;

  static SetsPlanListStruct fromMap(Map<String, dynamic> data) =>
      SetsPlanListStruct(
        setsPlan: getStructList(
          data['sets_plan'],
          SetsPlanStruct.fromMap,
        ),
      );

  static SetsPlanListStruct? maybeFromMap(dynamic data) => data is Map
      ? SetsPlanListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sets_plan': _setsPlan?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sets_plan': serializeParam(
          _setsPlan,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SetsPlanListStruct fromSerializableMap(Map<String, dynamic> data) =>
      SetsPlanListStruct(
        setsPlan: deserializeStructParam<SetsPlanStruct>(
          data['sets_plan'],
          ParamType.DataStruct,
          true,
          structBuilder: SetsPlanStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SetsPlanListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SetsPlanListStruct &&
        listEquality.equals(setsPlan, other.setsPlan);
  }

  @override
  int get hashCode => const ListEquality().hash([setsPlan]);
}

SetsPlanListStruct createSetsPlanListStruct() => SetsPlanListStruct();
