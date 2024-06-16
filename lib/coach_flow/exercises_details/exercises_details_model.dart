import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'exercises_details_widget.dart' show ExercisesDetailsWidget;
import 'package:flutter/material.dart';

class ExercisesDetailsModel extends FlutterFlowModel<ExercisesDetailsWidget> {
  ///  Local state fields for this page.

  String picker = 'Описание';

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
