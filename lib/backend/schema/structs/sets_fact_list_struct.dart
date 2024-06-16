// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SetsFactListStruct extends BaseStruct {
  SetsFactListStruct({
    List<SetsFactStruct>? setsFact,
  }) : _setsFact = setsFact;

  // "sets_fact" field.
  List<SetsFactStruct>? _setsFact;
  List<SetsFactStruct> get setsFact => _setsFact ?? const [];
  set setsFact(List<SetsFactStruct>? val) => _setsFact = val;

  void updateSetsFact(Function(List<SetsFactStruct>) updateFn) {
    updateFn(setsFact ??= []);
  }

  bool hasSetsFact() => _setsFact != null;

  static SetsFactListStruct fromMap(Map<String, dynamic> data) =>
      SetsFactListStruct(
        setsFact: getStructList(
          data['sets_fact'],
          SetsFactStruct.fromMap,
        ),
      );

  static SetsFactListStruct? maybeFromMap(dynamic data) => data is Map
      ? SetsFactListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sets_fact': _setsFact?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sets_fact': serializeParam(
          _setsFact,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SetsFactListStruct fromSerializableMap(Map<String, dynamic> data) =>
      SetsFactListStruct(
        setsFact: deserializeStructParam<SetsFactStruct>(
          data['sets_fact'],
          ParamType.DataStruct,
          true,
          structBuilder: SetsFactStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SetsFactListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SetsFactListStruct &&
        listEquality.equals(setsFact, other.setsFact);
  }

  @override
  int get hashCode => const ListEquality().hash([setsFact]);
}

SetsFactListStruct createSetsFactListStruct() => SetsFactListStruct();
