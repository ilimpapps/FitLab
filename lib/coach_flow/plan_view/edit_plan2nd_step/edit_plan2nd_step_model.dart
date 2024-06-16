import '/components/back/back_widget.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/components/warmup_closed/warmup_closed_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_plan2nd_step_widget.dart' show EditPlan2ndStepWidget;
import 'package:flutter/material.dart';

class EditPlan2ndStepModel extends FlutterFlowModel<EditPlan2ndStepWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel;
  // State field(s) for WeekDay widget.
  String? weekDayValue;
  FormFieldController<String>? weekDayValueController;
  // Model for WarmupClosed component.
  late WarmupClosedModel warmupClosedModel;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    choiceChipModel = createModel(context, () => ChoiceChipModel());
    warmupClosedModel = createModel(context, () => WarmupClosedModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    choiceChipModel.dispose();
    warmupClosedModel.dispose();
  }
}
