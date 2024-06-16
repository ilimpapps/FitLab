import '/components/back/back_widget.dart';
import '/components/custom_picker/custom_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'fill_user_info_widget.dart' show FillUserInfoWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FillUserInfoModel extends FlutterFlowModel<FillUserInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for Back component.
  late BackModel backModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for NameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  String? _nameInputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполнены не все поля';
    }

    if (val.length < 2) {
      return 'Имя слишком короткое';
    }

    return null;
  }

  // State field(s) for SurnameInput widget.
  FocusNode? surnameInputFocusNode;
  TextEditingController? surnameInputTextController;
  String? Function(BuildContext, String?)? surnameInputTextControllerValidator;
  String? _surnameInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполнены не все поля';
    }

    if (val.length < 2) {
      return 'Фамилия слишком короткая';
    }
    if (val.length > 17) {
      return 'Вы превысили максимальное число символов';
    }

    return null;
  }

  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  final phoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполнены не все поля';
    }

    if (val.length < 17) {
      return 'Номер телефона должен быть длинее';
    }

    return null;
  }

  // State field(s) for CityInput widget.
  FocusNode? cityInputFocusNode;
  TextEditingController? cityInputTextController;
  String? Function(BuildContext, String?)? cityInputTextControllerValidator;
  String? _cityInputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполнены не все поля';
    }

    if (val.length < 2) {
      return 'Неверные данные';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for GenderDropdown widget.
  String? genderDropdownValue;
  FormFieldController<String>? genderDropdownValueController;
  // Model for CustomPicker component.
  late CustomPickerModel customPickerModel;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    nameInputTextControllerValidator = _nameInputTextControllerValidator;
    surnameInputTextControllerValidator = _surnameInputTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    cityInputTextControllerValidator = _cityInputTextControllerValidator;
    customPickerModel = createModel(context, () => CustomPickerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    surnameInputFocusNode?.dispose();
    surnameInputTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    cityInputFocusNode?.dispose();
    cityInputTextController?.dispose();

    customPickerModel.dispose();
  }
}
