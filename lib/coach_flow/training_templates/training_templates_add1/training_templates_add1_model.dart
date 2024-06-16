import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'training_templates_add1_widget.dart' show TrainingTemplatesAdd1Widget;
import 'package:flutter/material.dart';

class TrainingTemplatesAdd1Model
    extends FlutterFlowModel<TrainingTemplatesAdd1Widget> {
  ///  Local state fields for this page.

  String? difficulty;

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
      return 'Слишком короткое название';
    }
    if (val.length > 35) {
      return 'Слишком длинное название';
    }

    return null;
  }

  // State field(s) for DifficultyDropdown widget.
  String? difficultyDropdownValue;
  FormFieldController<String>? difficultyDropdownValueController;

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
