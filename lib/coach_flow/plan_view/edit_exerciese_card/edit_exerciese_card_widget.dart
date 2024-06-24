import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'edit_exerciese_card_model.dart';
export 'edit_exerciese_card_model.dart';

class EditExercieseCardWidget extends StatefulWidget {
  const EditExercieseCardWidget({
    super.key,
    required this.coachExercisePicker,
    bool? isValidate,
    this.addAction,
    this.deleteAction,
  }) : isValidate = isValidate ?? false;

  final CoachExercisesPickerStruct? coachExercisePicker;
  final bool isValidate;
  final Future Function()? addAction;
  final Future Function()? deleteAction;

  @override
  State<EditExercieseCardWidget> createState() =>
      _EditExercieseCardWidgetState();
}

class _EditExercieseCardWidgetState extends State<EditExercieseCardWidget> {
  late EditExercieseCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditExercieseCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.addAction?.call();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).white8,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.coachExercisePicker?.name,
                        'null',
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'NTSomic',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.1,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          if (widget.isValidate ||
                              (widget.coachExercisePicker!.sets.setsPlan
                                  .isNotEmpty)) {
                            return Text(
                              '${valueOrDefault<String>(
                                widget
                                    .coachExercisePicker?.sets.setsPlan.length
                                    .toString(),
                                'null',
                              )} ${valueOrDefault<String>(
                                functions.getApproachWord(valueOrDefault<int>(
                                  widget.coachExercisePicker?.sets.setsPlan
                                      .length,
                                  0,
                                )),
                                'null',
                              )}',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'NTSomic',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.28,
                                  ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 7.0, 0.0, 0.0),
                              child: Text(
                                'Настройте упражнение',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'NTSomic',
                                      color: widget.isValidate &&
                                              !(widget.coachExercisePicker!.sets
                                                  .setsPlan.isNotEmpty)
                                          ? FlutterFlowTheme.of(context).error
                                          : FlutterFlowTheme.of(context)
                                              .secondary,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.28,
                                    ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) {
                  if (widget.isValidate ||
                      (widget.coachExercisePicker!.sets.setsPlan.isNotEmpty)) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.deleteAction?.call();
                      },
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            FFIcons.ktrashCan,
                            color: FlutterFlowTheme.of(context).error,
                            size: 24.0,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FFIcons.kedit1,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
