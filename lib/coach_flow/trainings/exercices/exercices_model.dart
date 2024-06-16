import '/backend/api_requests/api_calls.dart';
import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exercices_widget.dart' show ExercicesWidget;
import 'package:flutter/material.dart';

class ExercicesModel extends FlutterFlowModel<ExercicesWidget> {
  ///  Local state fields for this page.

  int? expandIndex;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // State field(s) for SearchInput widget.
  FocusNode? searchInputFocusNode;
  TextEditingController? searchInputTextController;
  String? Function(BuildContext, String?)? searchInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (search)] action in SearchInput widget.
  ApiCallResponse? apiResultbc9;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    searchInputFocusNode?.dispose();
    searchInputTextController?.dispose();
  }
}
