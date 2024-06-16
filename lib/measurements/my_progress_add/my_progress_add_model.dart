import '/backend/schema/structs/index.dart';
import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'my_progress_add_widget.dart' show MyProgressAddWidget;
import 'package:flutter/material.dart';

class MyProgressAddModel extends FlutterFlowModel<MyProgressAddWidget> {
  ///  Local state fields for this page.

  MeasurementsStruct? measurements;
  void updateMeasurementsStruct(Function(MeasurementsStruct) updateFn) {
    updateFn(measurements ??= MeasurementsStruct());
  }

  MeasurementsTemplateStruct? measurementsTemplate;
  void updateMeasurementsTemplateStruct(
      Function(MeasurementsTemplateStruct) updateFn) {
    updateFn(measurementsTemplate ??= MeasurementsTemplateStruct());
  }

  List<MeasurementsStruct> measurementsList = [];
  void addToMeasurementsList(MeasurementsStruct item) =>
      measurementsList.add(item);
  void removeFromMeasurementsList(MeasurementsStruct item) =>
      measurementsList.remove(item);
  void removeAtIndexFromMeasurementsList(int index) =>
      measurementsList.removeAt(index);
  void insertAtIndexInMeasurementsList(int index, MeasurementsStruct item) =>
      measurementsList.insert(index, item);
  void updateMeasurementsListAtIndex(
          int index, Function(MeasurementsStruct) updateFn) =>
      measurementsList[index] = updateFn(measurementsList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // State field(s) for NameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  // State field(s) for valueInput widget.
  FocusNode? valueInputFocusNode;
  TextEditingController? valueInputTextController;
  String? Function(BuildContext, String?)? valueInputTextControllerValidator;
  // State field(s) for UnitDropDown widget.
  String? unitDropDownValue;
  FormFieldController<String>? unitDropDownValueController;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    valueInputFocusNode?.dispose();
    valueInputTextController?.dispose();
  }
}
