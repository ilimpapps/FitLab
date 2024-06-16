import '/components/back/back_widget.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'training_templates_widget.dart' show TrainingTemplatesWidget;
import 'package:flutter/material.dart';

class TrainingTemplatesModel extends FlutterFlowModel<TrainingTemplatesWidget> {
  ///  Local state fields for this page.

  String picked = 'Начинающий';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel1;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel2;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel3;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    choiceChipModel1 = createModel(context, () => ChoiceChipModel());
    choiceChipModel2 = createModel(context, () => ChoiceChipModel());
    choiceChipModel3 = createModel(context, () => ChoiceChipModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    choiceChipModel1.dispose();
    choiceChipModel2.dispose();
    choiceChipModel3.dispose();
  }
}
