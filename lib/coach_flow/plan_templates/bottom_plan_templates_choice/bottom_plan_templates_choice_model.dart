import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/components/custom_picker/custom_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_plan_templates_choice_widget.dart'
    show BottomPlanTemplatesChoiceWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomPlanTemplatesChoiceModel
    extends FlutterFlowModel<BottomPlanTemplatesChoiceWidget> {
  ///  Local state fields for this component.

  String filter = 'Все шаблоны';

  DateTime? dateTime;

  ViewTemplatesTrainingsPlansRow? viewTemplatesTrainingsPlans;

  ///  State fields for stateful widgets in this component.

  // Model for Back component.
  late BackModel backModel;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel1;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel2;
  // Model for CustomPicker component.
  late CustomPickerModel customPickerModel;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    choiceChipModel1 = createModel(context, () => ChoiceChipModel());
    choiceChipModel2 = createModel(context, () => ChoiceChipModel());
    customPickerModel = createModel(context, () => CustomPickerModel());
  }

  @override
  void dispose() {
    backModel.dispose();
    choiceChipModel1.dispose();
    choiceChipModel2.dispose();
    customPickerModel.dispose();
  }
}
