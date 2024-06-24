import '/components/back/back_widget.dart';
import '/components/custom_picker/custom_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'plan_to_user_add1_widget.dart' show PlanToUserAdd1Widget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanToUserAdd1Model extends FlutterFlowModel<PlanToUserAdd1Widget> {
  ///  Local state fields for this page.

  DateTime? endDate;

  int? trainingsCount;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // Model for CustomPicker component.
  late CustomPickerModel customPickerModel;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    customPickerModel = createModel(context, () => CustomPickerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    customPickerModel.dispose();
  }
}
