import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'plan_to_user_add2_name_input_model.dart';
export 'plan_to_user_add2_name_input_model.dart';

class PlanToUserAdd2NameInputWidget extends StatefulWidget {
  const PlanToUserAdd2NameInputWidget({
    super.key,
    required this.action,
    this.initialName,
  });

  final Future Function()? action;
  final String? initialName;

  @override
  State<PlanToUserAdd2NameInputWidget> createState() =>
      _PlanToUserAdd2NameInputWidgetState();
}

class _PlanToUserAdd2NameInputWidgetState
    extends State<PlanToUserAdd2NameInputWidget> {
  late PlanToUserAdd2NameInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanToUserAdd2NameInputModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.initialName != null && widget.initialName != '') {
        setState(() {
          _model.nameInputTextController?.text = widget.initialName!;
          _model.nameInputTextController?.selection = TextSelection.collapsed(
              offset: _model.nameInputTextController!.text.length);
        });
      } else {
        return;
      }
    });

    _model.nameInputTextController ??= TextEditingController();
    _model.nameInputFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: _model.nameInputTextController,
        focusNode: _model.nameInputFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.nameInputTextController',
          const Duration(milliseconds: 200),
          () async {
            await widget.action?.call();
          },
        ),
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Название тренировки',
          labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'NTSomic',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 16.0,
                letterSpacing: 0.0,
                useGoogleFonts: false,
                lineHeight: 1.28,
              ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'NTSomic',
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).accent1,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          contentPadding:
              const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 20.0),
        ),
        style: FlutterFlowTheme.of(context).bodyLarge.override(
              fontFamily: 'NTSomic',
              letterSpacing: 0.0,
              useGoogleFonts: false,
              lineHeight: 1.37,
            ),
        validator: _model.nameInputTextControllerValidator.asValidator(context),
      ),
    );
  }
}
