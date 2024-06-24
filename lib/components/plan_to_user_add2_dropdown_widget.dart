import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'plan_to_user_add2_dropdown_model.dart';
export 'plan_to_user_add2_dropdown_model.dart';

class PlanToUserAdd2DropdownWidget extends StatefulWidget {
  const PlanToUserAdd2DropdownWidget({
    super.key,
    required this.action,
    this.initialWeekday,
  });

  final Future Function()? action;
  final int? initialWeekday;

  @override
  State<PlanToUserAdd2DropdownWidget> createState() =>
      _PlanToUserAdd2DropdownWidgetState();
}

class _PlanToUserAdd2DropdownWidgetState
    extends State<PlanToUserAdd2DropdownWidget> {
  late PlanToUserAdd2DropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanToUserAdd2DropdownModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.initialWeekday != null) {
        setState(() {
          _model.weekDayValueController?.value = widget.initialWeekday!;
        });
      } else {
        return;
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown<int>(
      controller: _model.weekDayValueController ??= FormFieldController<int>(
        _model.weekDayValue ??= 1,
      ),
      options: List<int>.from([1, 2, 3, 4, 5, 6, 7]),
      optionLabels: const [
        'Понедельник',
        'Вторник',
        'Среда',
        'Четверг',
        'Пятница',
        'Суббота',
        'Воскресенье'
      ],
      onChanged: (val) async {
        setState(() => _model.weekDayValue = val);
        await widget.action?.call();
      },
      width: double.infinity,
      height: 60.0,
      textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
            fontFamily: 'NTSomic',
            color: FlutterFlowTheme.of(context).secondaryText,
            fontSize: 14.0,
            letterSpacing: 0.0,
            useGoogleFonts: false,
          ),
      hintText: 'День недели',
      icon: Icon(
        FFIcons.kright5,
        color: FlutterFlowTheme.of(context).primary,
        size: 24.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: FlutterFlowTheme.of(context).accent1,
      borderWidth: 1.0,
      borderRadius: 16.0,
      margin: const EdgeInsetsDirectional.fromSTEB(15.0, 4.0, 16.0, 4.0),
      hidesUnderline: true,
      isOverButton: true,
      isSearchable: false,
      isMultiSelect: false,
      labelText: '',
      labelTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'NTSomic',
            color: FlutterFlowTheme.of(context).secondaryText,
            letterSpacing: 0.0,
            useGoogleFonts: false,
          ),
    );
  }
}
