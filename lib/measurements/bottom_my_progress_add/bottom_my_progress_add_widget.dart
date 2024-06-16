import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'bottom_my_progress_add_model.dart';
export 'bottom_my_progress_add_model.dart';

class BottomMyProgressAddWidget extends StatefulWidget {
  const BottomMyProgressAddWidget({
    super.key,
    required this.usersMeasurementsRow,
  });

  final UsersMeasurementsRow? usersMeasurementsRow;

  @override
  State<BottomMyProgressAddWidget> createState() =>
      _BottomMyProgressAddWidgetState();
}

class _BottomMyProgressAddWidgetState extends State<BottomMyProgressAddWidget> {
  late BottomMyProgressAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomMyProgressAddModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.measurementsTemplateJson =
          widget.usersMeasurementsRow?.measurements;
      _model.measurementsTemplate = MeasurementsTemplateStruct.maybeFromMap(
          _model.measurementsTemplateJson);
      setState(() {});
    });

    _model.valueInputTextController ??= TextEditingController();
    _model.valueInputFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Добавить измерение параметра',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'NTSomic',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).white8,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        FFIcons.kclose3,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.valueInputTextController,
                  focusNode: _model.valueInputFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.valueInputTextController',
                    const Duration(milliseconds: 200),
                    () => setState(() {}),
                  ),
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Введите новое значение',
                    labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'NTSomic',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                          lineHeight: 1.28,
                        ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
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
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: _model.valueInputTextControllerValidator
                      .asValidator(context),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^[0-9]+[.,]?[0-9]*\$'))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
              child: Text(
                'Текущий ${valueOrDefault<String>(
                  widget.usersMeasurementsRow?.name,
                  'null',
                )}: ${valueOrDefault<String>(
                  _model.measurementsTemplate?.measurements.last.value
                      .toString(),
                  'null',
                )} ${valueOrDefault<String>(
                  widget.usersMeasurementsRow?.unit,
                  'null',
                )}',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'NTSomic',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  _model.updateMeasurementsTemplateStruct(
                    (e) => e
                      ..updateMeasurements(
                        (e) => e.add(MeasurementsStruct(
                          createdAt:
                              functions.dateTimeToString(getCurrentTimestamp),
                          value: functions.stringToDouble(
                              _model.valueInputTextController.text),
                        )),
                      ),
                  );
                  setState(() {});
                  await UsersMeasurementsTable().update(
                    data: {
                      'measurements': _model.measurementsTemplate?.toMap(),
                    },
                    matchingRows: (rows) => rows.eq(
                      'id',
                      widget.usersMeasurementsRow?.id,
                    ),
                  );

                  FFAppState().update(() {});
                  Navigator.pop(context, true);
                },
                text: 'Сохранить',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 52.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'NTSomic',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                showLoadingIndicator: false,
              ),
            ),
          ].addToStart(const SizedBox(height: 14.0)).addToEnd(const SizedBox(height: 50.0)),
        ),
      ),
    );
  }
}
