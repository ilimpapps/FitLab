import '/backend/schema/structs/index.dart';
import '/components/plan_creation_by_hands_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_sets_add_widget.dart' show BottomSetsAddWidget;
import 'package:flutter/material.dart';

class BottomSetsAddModel extends FlutterFlowModel<BottomSetsAddWidget> {
  ///  Local state fields for this component.

  int index = 0;

  List<SetsPlanStruct> setsPlan = [];
  void addToSetsPlan(SetsPlanStruct item) => setsPlan.add(item);
  void removeFromSetsPlan(SetsPlanStruct item) => setsPlan.remove(item);
  void removeAtIndexFromSetsPlan(int index) => setsPlan.removeAt(index);
  void insertAtIndexInSetsPlan(int index, SetsPlanStruct item) =>
      setsPlan.insert(index, item);
  void updateSetsPlanAtIndex(int index, Function(SetsPlanStruct) updateFn) =>
      setsPlan[index] = updateFn(setsPlan[index]);

  ///  State fields for stateful widgets in this component.

  // Models for PlanCreationByHandsItem dynamic component.
  late FlutterFlowDynamicModels<PlanCreationByHandsItemModel>
      planCreationByHandsItemModels;

  @override
  void initState(BuildContext context) {
    planCreationByHandsItemModels =
        FlutterFlowDynamicModels(() => PlanCreationByHandsItemModel());
  }

  @override
  void dispose() {
    planCreationByHandsItemModels.dispose();
  }
}
