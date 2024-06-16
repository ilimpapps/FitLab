import '/coach_flow/training_report_card/training_report_card_widget.dart';
import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'training_report_widget.dart' show TrainingReportWidget;
import 'package:flutter/material.dart';

class TrainingReportModel extends FlutterFlowModel<TrainingReportWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // Models for TrainingReportCard dynamic component.
  late FlutterFlowDynamicModels<TrainingReportCardModel>
      trainingReportCardModels;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    trainingReportCardModels =
        FlutterFlowDynamicModels(() => TrainingReportCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    trainingReportCardModels.dispose();
  }
}
