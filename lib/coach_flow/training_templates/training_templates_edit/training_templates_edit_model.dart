import '/backend/schema/structs/index.dart';
import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'training_templates_edit_widget.dart' show TrainingTemplatesEditWidget;
import 'package:flutter/material.dart';

class TrainingTemplatesEditModel
    extends FlutterFlowModel<TrainingTemplatesEditWidget> {
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

  List<CoachExercisesPickerStruct> oldList = [];
  void addToOldList(CoachExercisesPickerStruct item) => oldList.add(item);
  void removeFromOldList(CoachExercisesPickerStruct item) =>
      oldList.remove(item);
  void removeAtIndexFromOldList(int index) => oldList.removeAt(index);
  void insertAtIndexInOldList(int index, CoachExercisesPickerStruct item) =>
      oldList.insert(index, item);
  void updateOldListAtIndex(
          int index, Function(CoachExercisesPickerStruct) updateFn) =>
      oldList[index] = updateFn(oldList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;

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
