import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'template_details_card_model.dart';
export 'template_details_card_model.dart';

class TemplateDetailsCardWidget extends StatefulWidget {
  const TemplateDetailsCardWidget({
    super.key,
    required this.viewTemplatesTrainingsExercisesRow,
  });

  final ViewTemplatesTrainingsExercisesRow? viewTemplatesTrainingsExercisesRow;

  @override
  State<TemplateDetailsCardWidget> createState() =>
      _TemplateDetailsCardWidgetState();
}

class _TemplateDetailsCardWidgetState extends State<TemplateDetailsCardWidget> {
  late TemplateDetailsCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemplateDetailsCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).white8,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 21.0, 16.0, 21.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (_model.isExpand) {
                  _model.isExpand = false;
                  setState(() {});
                } else {
                  _model.isExpand = true;
                  setState(() {});
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.viewTemplatesTrainingsExercisesRow
                                ?.exerciseName,
                            'null',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'NTSomic',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.37,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.ktimeCircle,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '${valueOrDefault<String>(
                                    SetsPlanListStruct.maybeFromMap(widget
                                            .viewTemplatesTrainingsExercisesRow
                                            ?.setsPlan)
                                        ?.setsPlan
                                        .length
                                        .toString(),
                                    '0',
                                  )} ${functions.getApproachWord(valueOrDefault<int>(
                                    SetsPlanListStruct.maybeFromMap(widget
                                            .viewTemplatesTrainingsExercisesRow
                                            ?.setsPlan)
                                        ?.setsPlan
                                        .length,
                                    0,
                                  ))}',
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (_model.isExpand) {
                          return Icon(
                            FFIcons.kup2,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          );
                        } else {
                          return Icon(
                            FFIcons.kdown3,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (_model.isExpand)
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).white8,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Builder(
                          builder: (context) {
                            final childSets = SetsPlanListStruct.maybeFromMap(
                                        widget
                                            .viewTemplatesTrainingsExercisesRow
                                            ?.setsPlan)
                                    ?.setsPlan
                                    .toList() ??
                                [];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(childSets.length,
                                  (childSetsIndex) {
                                final childSetsItem = childSets[childSetsIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${valueOrDefault<String>(
                                                  (childSetsIndex + 1)
                                                      .toString(),
                                                  'null',
                                                )} ${functions.getApproachWord(valueOrDefault<int>(
                                                  childSetsIndex + 1,
                                                  0,
                                                ))}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NTSomic',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  '${valueOrDefault<String>(
                                                    childSetsItem.reps
                                                        .toString(),
                                                    'null',
                                                  )} раз • ${valueOrDefault<String>(
                                                    childSetsItem.weightKg
                                                        .toString(),
                                                    'null',
                                                  )} кг',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'NTSomic',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 1.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0x1EFDFDFD),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).divide(const SizedBox(height: 8.0)),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'ExercisesDetails',
                          queryParameters: {
                            'rlExercises': serializeParam(
                              widget.viewTemplatesTrainingsExercisesRow
                                  ?.rlExercises,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kinfoCircle,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 20.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Подробнее о упражнении',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'NTSomic',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
