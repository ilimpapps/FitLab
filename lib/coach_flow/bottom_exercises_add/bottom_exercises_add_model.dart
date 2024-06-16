import '/backend/schema/structs/index.dart';
import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_exercises_add_widget.dart' show BottomExercisesAddWidget;
import 'package:flutter/material.dart';

class BottomExercisesAddModel
    extends FlutterFlowModel<BottomExercisesAddWidget> {
  ///  Local state fields for this component.

  String muscle = 'Абдукторы';

  int index = 0;

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

  ///  State fields for stateful widgets in this component.

  // Model for Back component.
  late BackModel backModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
  }

  @override
  void dispose() {
    backModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
