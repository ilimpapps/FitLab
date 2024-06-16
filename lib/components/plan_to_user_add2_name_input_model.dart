import '/flutter_flow/flutter_flow_util.dart';
import 'plan_to_user_add2_name_input_widget.dart'
    show PlanToUserAdd2NameInputWidget;
import 'package:flutter/material.dart';

class PlanToUserAdd2NameInputModel
    extends FlutterFlowModel<PlanToUserAdd2NameInputWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for NameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();
  }
}
