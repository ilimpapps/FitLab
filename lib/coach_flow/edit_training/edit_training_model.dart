import '/components/back/back_widget.dart';
import '/components/warmup_closed/warmup_closed_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_training_widget.dart' show EditTrainingWidget;
import 'package:flutter/material.dart';

class EditTrainingModel extends FlutterFlowModel<EditTrainingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // State field(s) for WeekDay widget.
  String? weekDayValue;
  FormFieldController<String>? weekDayValueController;
  // Model for WarmupClosed component.
  late WarmupClosedModel warmupClosedModel;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    warmupClosedModel = createModel(context, () => WarmupClosedModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    warmupClosedModel.dispose();
  }
}
