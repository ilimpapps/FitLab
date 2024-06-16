import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trainings_reports_for_coach_widget.dart'
    show TrainingsReportsForCoachWidget;
import 'package:flutter/material.dart';

class TrainingsReportsForCoachModel
    extends FlutterFlowModel<TrainingsReportsForCoachWidget> {
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
