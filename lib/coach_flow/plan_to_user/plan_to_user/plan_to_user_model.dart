import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'plan_to_user_widget.dart' show PlanToUserWidget;
import 'package:flutter/material.dart';

class PlanToUserModel extends FlutterFlowModel<PlanToUserWidget> {
  ///  Local state fields for this page.

  DateTime? pickedDate;

  bool passedTrainings = false;

  bool futureTrainings = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBarModel.dispose();
  }
}
