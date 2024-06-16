import '/flutter_flow/flutter_flow_util.dart';
import 'plan_creation_by_hands_item_widget.dart'
    show PlanCreationByHandsItemWidget;
import 'package:flutter/material.dart';

class PlanCreationByHandsItemModel
    extends FlutterFlowModel<PlanCreationByHandsItemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RepsInput widget.
  FocusNode? repsInputFocusNode;
  TextEditingController? repsInputTextController;
  String? Function(BuildContext, String?)? repsInputTextControllerValidator;
  // State field(s) for WeightKgInput widget.
  FocusNode? weightKgInputFocusNode;
  TextEditingController? weightKgInputTextController;
  String? Function(BuildContext, String?)? weightKgInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    repsInputFocusNode?.dispose();
    repsInputTextController?.dispose();

    weightKgInputFocusNode?.dispose();
    weightKgInputTextController?.dispose();
  }
}
