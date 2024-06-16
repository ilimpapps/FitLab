import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_plan1st_step_widget.dart' show EditPlan1stStepWidget;
import 'package:flutter/material.dart';

class EditPlan1stStepModel extends FlutterFlowModel<EditPlan1stStepWidget> {
  ///  Local state fields for this page.

  int pickedDays = 3;

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
