import '/components/choice_chip/choice_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_plan_to_user_template_widget.dart'
    show BottomPlanToUserTemplateWidget;
import 'package:flutter/material.dart';

class BottomPlanToUserTemplateModel
    extends FlutterFlowModel<BottomPlanToUserTemplateWidget> {
  ///  Local state fields for this component.

  String picker = 'Начинающий';

  ///  State fields for stateful widgets in this component.

  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel1;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel2;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel3;

  @override
  void initState(BuildContext context) {
    choiceChipModel1 = createModel(context, () => ChoiceChipModel());
    choiceChipModel2 = createModel(context, () => ChoiceChipModel());
    choiceChipModel3 = createModel(context, () => ChoiceChipModel());
  }

  @override
  void dispose() {
    choiceChipModel1.dispose();
    choiceChipModel2.dispose();
    choiceChipModel3.dispose();
  }
}
