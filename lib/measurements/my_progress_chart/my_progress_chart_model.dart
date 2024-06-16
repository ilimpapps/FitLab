import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/components/chart/chart_widget.dart';
import '/components/choice4_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_progress_chart_widget.dart' show MyProgressChartWidget;
import 'package:flutter/material.dart';

class MyProgressChartModel extends FlutterFlowModel<MyProgressChartWidget> {
  ///  Local state fields for this page.

  dynamic measurementsTemplateJson;

  MeasurementsTemplateStruct? measurementsTemplate;
  void updateMeasurementsTemplateStruct(
      Function(MeasurementsTemplateStruct) updateFn) {
    updateFn(measurementsTemplate ??= MeasurementsTemplateStruct());
  }

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in MyProgressChart widget.
  List<UsersMeasurementsRow>? queryUsersMeasurements;
  // Model for Back component.
  late BackModel backModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? deleteOutput;
  // Model for Choice4 component.
  late Choice4Model choice4Model;
  // Model for Chart component.
  late ChartModel chartModel;
  // Stores action output result for [Bottom Sheet - BottomMyProgressAdd] action in Button widget.
  bool? bottomOutput;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    choice4Model = createModel(context, () => Choice4Model());
    chartModel = createModel(context, () => ChartModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    choice4Model.dispose();
    chartModel.dispose();
  }
}
