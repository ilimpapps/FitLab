import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'plan_details_item_widget.dart' show PlanDetailsItemWidget;
import 'package:flutter/material.dart';

class PlanDetailsItemModel extends FlutterFlowModel<PlanDetailsItemWidget> {
  ///  Local state fields for this component.

  bool isExpand = false;

  dynamic setFactListJson;

  List<SetsFactStruct> setsFact = [];
  void addToSetsFact(SetsFactStruct item) => setsFact.add(item);
  void removeFromSetsFact(SetsFactStruct item) => setsFact.remove(item);
  void removeAtIndexFromSetsFact(int index) => setsFact.removeAt(index);
  void insertAtIndexInSetsFact(int index, SetsFactStruct item) =>
      setsFact.insert(index, item);
  void updateSetsFactAtIndex(int index, Function(SetsFactStruct) updateFn) =>
      setsFact[index] = updateFn(setsFact[index]);

  SetsFactListStruct? setsFactList;
  void updateSetsFactListStruct(Function(SetsFactListStruct) updateFn) {
    updateFn(setsFactList ??= SetsFactListStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
