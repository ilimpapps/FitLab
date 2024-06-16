import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/components/plan_to_user_add2_dropdown_widget.dart';
import '/components/plan_to_user_add2_name_input_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'plan_to_user_add2_widget.dart' show PlanToUserAdd2Widget;
import 'package:flutter/material.dart';

class PlanToUserAdd2Model extends FlutterFlowModel<PlanToUserAdd2Widget> {
  ///  Local state fields for this page.

  int dayPicked = 1;

  List<PlanToUserAddStruct> planToUserAdd = [];
  void addToPlanToUserAdd(PlanToUserAddStruct item) => planToUserAdd.add(item);
  void removeFromPlanToUserAdd(PlanToUserAddStruct item) =>
      planToUserAdd.remove(item);
  void removeAtIndexFromPlanToUserAdd(int index) =>
      planToUserAdd.removeAt(index);
  void insertAtIndexInPlanToUserAdd(int index, PlanToUserAddStruct item) =>
      planToUserAdd.insert(index, item);
  void updatePlanToUserAddAtIndex(
          int index, Function(PlanToUserAddStruct) updateFn) =>
      planToUserAdd[index] = updateFn(planToUserAdd[index]);

  int trainingIndex = 0;

  int exerciseIndex = 0;

  bool isValidate = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // Models for PlanToUserAdd2NameInput dynamic component.
  late FlutterFlowDynamicModels<PlanToUserAdd2NameInputModel>
      planToUserAdd2NameInputModels;
  // Models for PlanToUserAdd2Dropdown dynamic component.
  late FlutterFlowDynamicModels<PlanToUserAdd2DropdownModel>
      planToUserAdd2DropdownModels;
  // Stores action output result for [Bottom Sheet - BottomSetsAdd] action in EditExercieseCard widget.
  SetsPlanListStruct? bottomSetsOutput;
  // Stores action output result for [Bottom Sheet - BottomExercisesAdd] action in Container widget.
  List<CoachExercisesPickerStruct>? bottomExerciseOutput;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersTrainingsRow? usersTrainingsOutput;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    planToUserAdd2NameInputModels =
        FlutterFlowDynamicModels(() => PlanToUserAdd2NameInputModel());
    planToUserAdd2DropdownModels =
        FlutterFlowDynamicModels(() => PlanToUserAdd2DropdownModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    planToUserAdd2NameInputModels.dispose();
    planToUserAdd2DropdownModels.dispose();
  }
}
