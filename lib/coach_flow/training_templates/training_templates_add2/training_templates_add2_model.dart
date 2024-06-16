import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'training_templates_add2_widget.dart' show TrainingTemplatesAdd2Widget;
import 'package:flutter/material.dart';

class TrainingTemplatesAdd2Model
    extends FlutterFlowModel<TrainingTemplatesAdd2Widget> {
  ///  Local state fields for this page.

  List<CoachExercisesPickerStruct> coachExercisesPicker = [];
  void addToCoachExercisesPicker(CoachExercisesPickerStruct item) =>
      coachExercisesPicker.add(item);
  void removeFromCoachExercisesPicker(CoachExercisesPickerStruct item) =>
      coachExercisesPicker.remove(item);
  void removeAtIndexFromCoachExercisesPicker(int index) =>
      coachExercisesPicker.removeAt(index);
  void insertAtIndexInCoachExercisesPicker(
          int index, CoachExercisesPickerStruct item) =>
      coachExercisesPicker.insert(index, item);
  void updateCoachExercisesPickerAtIndex(
          int index, Function(CoachExercisesPickerStruct) updateFn) =>
      coachExercisesPicker[index] = updateFn(coachExercisesPicker[index]);

  int index = 0;

  int pickedItems = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // Stores action output result for [Bottom Sheet - BottomExercisesAdd] action in Container widget.
  List<CoachExercisesPickerStruct>? bottomOutput;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  CoachTrainingsRow? coachTrainingsOutput;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
  }
}
