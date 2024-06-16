import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/components/plan_details_item/plan_details_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'training_widget.dart' show TrainingWidget;
import 'package:flutter/material.dart';

class TrainingModel extends FlutterFlowModel<TrainingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<List<UsersTrainingsExercisesRow>>? requestCompleter1;
  // Model for Back component.
  late BackModel backModel;
  // Models for PlanDetailsItem dynamic component.
  late FlutterFlowDynamicModels<PlanDetailsItemModel> planDetailsItemModels;
  Completer<List<UsersTrainingsRow>>? requestCompleter2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  PassedTrainingsRow? passedTraining;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    planDetailsItemModels =
        FlutterFlowDynamicModels(() => PlanDetailsItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    planDetailsItemModels.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
