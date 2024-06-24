import '/components/encouregment_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'podbadrivaniye_widget.dart' show PodbadrivaniyeWidget;
import 'package:flutter/material.dart';

class PodbadrivaniyeModel extends FlutterFlowModel<PodbadrivaniyeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Encouregment component.
  late EncouregmentModel encouregmentModel;

  @override
  void initState(BuildContext context) {
    encouregmentModel = createModel(context, () => EncouregmentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    encouregmentModel.dispose();
  }
}
