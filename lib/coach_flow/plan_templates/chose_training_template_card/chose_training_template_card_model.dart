import '/flutter_flow/flutter_flow_util.dart';
import 'chose_training_template_card_widget.dart'
    show ChoseTrainingTemplateCardWidget;
import 'package:flutter/material.dart';

class ChoseTrainingTemplateCardModel
    extends FlutterFlowModel<ChoseTrainingTemplateCardWidget> {
  ///  Local state fields for this component.

  bool isExpand = false;

  List<String> exercisesName = [];
  void addToExercisesName(String item) => exercisesName.add(item);
  void removeFromExercisesName(String item) => exercisesName.remove(item);
  void removeAtIndexFromExercisesName(int index) =>
      exercisesName.removeAt(index);
  void insertAtIndexInExercisesName(int index, String item) =>
      exercisesName.insert(index, item);
  void updateExercisesNameAtIndex(int index, Function(String) updateFn) =>
      exercisesName[index] = updateFn(exercisesName[index]);

  List<int> rlExercises = [];
  void addToRlExercises(int item) => rlExercises.add(item);
  void removeFromRlExercises(int item) => rlExercises.remove(item);
  void removeAtIndexFromRlExercises(int index) => rlExercises.removeAt(index);
  void insertAtIndexInRlExercises(int index, int item) =>
      rlExercises.insert(index, item);
  void updateRlExercisesAtIndex(int index, Function(int) updateFn) =>
      rlExercises[index] = updateFn(rlExercises[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
