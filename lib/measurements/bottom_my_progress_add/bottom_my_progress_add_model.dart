import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_my_progress_add_widget.dart' show BottomMyProgressAddWidget;
import 'package:flutter/material.dart';

class BottomMyProgressAddModel
    extends FlutterFlowModel<BottomMyProgressAddWidget> {
  ///  Local state fields for this component.

  MeasurementsTemplateStruct? measurementsTemplate;
  void updateMeasurementsTemplateStruct(
      Function(MeasurementsTemplateStruct) updateFn) {
    updateFn(measurementsTemplate ??= MeasurementsTemplateStruct());
  }

  MeasurementsStruct? measurement;
  void updateMeasurementStruct(Function(MeasurementsStruct) updateFn) {
    updateFn(measurement ??= MeasurementsStruct());
  }

  dynamic measurementsTemplateJson;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ValueInput widget.
  FocusNode? valueInputFocusNode;
  TextEditingController? valueInputTextController;
  String? Function(BuildContext, String?)? valueInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    valueInputFocusNode?.dispose();
    valueInputTextController?.dispose();
  }
}
