import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'plan_templates_add2_widget.dart' show PlanTemplatesAdd2Widget;
import 'package:flutter/material.dart';

class PlanTemplatesAdd2Model extends FlutterFlowModel<PlanTemplatesAdd2Widget> {
  ///  Local state fields for this page.

  String picker = 'Выбрать';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

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
