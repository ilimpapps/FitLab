import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'plan_templates_add1_widget.dart' show PlanTemplatesAdd1Widget;
import 'package:flutter/material.dart';

class PlanTemplatesAdd1Model extends FlutterFlowModel<PlanTemplatesAdd1Widget> {
  ///  Local state fields for this page.

  int trainingCount = 3;

  String difficulty = 'Начинающий';

  List<String> gender = [];
  void addToGender(String item) => gender.add(item);
  void removeFromGender(String item) => gender.remove(item);
  void removeAtIndexFromGender(int index) => gender.removeAt(index);
  void insertAtIndexInGender(int index, String item) =>
      gender.insert(index, item);
  void updateGenderAtIndex(int index, Function(String) updateFn) =>
      gender[index] = updateFn(gender[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for Back component.
  late BackModel backModel;
  // State field(s) for NameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  String? _nameInputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле';
    }

    if (val.length < 3) {
      return 'Название слишком корокое';
    }
    if (val.length > 20) {
      return 'Название слишком длинное';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    nameInputTextControllerValidator = _nameInputTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();
  }
}
