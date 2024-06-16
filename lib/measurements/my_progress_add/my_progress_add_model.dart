import '/backend/schema/structs/index.dart';
import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'my_progress_add_widget.dart' show MyProgressAddWidget;
import 'package:flutter/material.dart';

class MyProgressAddModel extends FlutterFlowModel<MyProgressAddWidget> {
  ///  Local state fields for this page.

  MeasurementsTemplateStruct? measurementsTemplate;
  void updateMeasurementsTemplateStruct(
      Function(MeasurementsTemplateStruct) updateFn) {
    updateFn(measurementsTemplate ??= MeasurementsTemplateStruct());
  }

  MeasurementsStruct? measurement;
  void updateMeasurementStruct(Function(MeasurementsStruct) updateFn) {
    updateFn(measurement ??= MeasurementsStruct());
  }

  List<double> valuesList = [];
  void addToValuesList(double item) => valuesList.add(item);
  void removeFromValuesList(double item) => valuesList.remove(item);
  void removeAtIndexFromValuesList(int index) => valuesList.removeAt(index);
  void insertAtIndexInValuesList(int index, double item) =>
      valuesList.insert(index, item);
  void updateValuesListAtIndex(int index, Function(double) updateFn) =>
      valuesList[index] = updateFn(valuesList[index]);

  List<DateTime> dateTimeList = [];
  void addToDateTimeList(DateTime item) => dateTimeList.add(item);
  void removeFromDateTimeList(DateTime item) => dateTimeList.remove(item);
  void removeAtIndexFromDateTimeList(int index) => dateTimeList.removeAt(index);
  void insertAtIndexInDateTimeList(int index, DateTime item) =>
      dateTimeList.insert(index, item);
  void updateDateTimeListAtIndex(int index, Function(DateTime) updateFn) =>
      dateTimeList[index] = updateFn(dateTimeList[index]);

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
