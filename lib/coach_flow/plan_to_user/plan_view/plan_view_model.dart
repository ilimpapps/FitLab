import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'plan_view_widget.dart' show PlanViewWidget;
import 'package:flutter/material.dart';

class PlanViewModel extends FlutterFlowModel<PlanViewWidget> {
  ///  Local state fields for this page.

  int index = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // Stores action output result for [Bottom Sheet - BottomPlanDelete] action in Button widget.
  bool? outputPlanDelete;

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
