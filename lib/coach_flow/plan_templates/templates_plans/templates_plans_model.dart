import '/components/back/back_widget.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'templates_plans_widget.dart' show TemplatesPlansWidget;
import 'package:flutter/material.dart';

class TemplatesPlansModel extends FlutterFlowModel<TemplatesPlansWidget> {
  ///  Local state fields for this page.

  String filter = 'Все шаблоны';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel1;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel2;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    choiceChipModel1 = createModel(context, () => ChoiceChipModel());
    choiceChipModel2 = createModel(context, () => ChoiceChipModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    choiceChipModel1.dispose();
    choiceChipModel2.dispose();
  }
}
