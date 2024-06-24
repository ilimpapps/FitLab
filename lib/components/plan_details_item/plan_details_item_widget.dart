import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/encouregment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'plan_details_item_model.dart';
export 'plan_details_item_model.dart';

class PlanDetailsItemWidget extends StatefulWidget {
  const PlanDetailsItemWidget({
    super.key,
    bool? isCompleted,
    bool? isStartTraining,
    this.dateTime,
    this.usersTrainingExercisesRow,
    bool? isCoachView,
  })  : isCompleted = isCompleted ?? false,
        isStartTraining = isStartTraining ?? false,
        isCoachView = isCoachView ?? false;

  final bool isCompleted;
  final bool isStartTraining;
  final DateTime? dateTime;
  final UsersTrainingsExercisesRow? usersTrainingExercisesRow;
  final bool isCoachView;

  @override
  State<PlanDetailsItemWidget> createState() => _PlanDetailsItemWidgetState();
}

class _PlanDetailsItemWidgetState extends State<PlanDetailsItemWidget> {
  late PlanDetailsItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanDetailsItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.setFactListJson = widget.usersTrainingExercisesRow?.setsFact;
      _model.setsFact =
          SetsFactListStruct.maybeFromMap(_model.setFactListJson!)!
              .setsFact
              .toList()
              .cast<SetsFactStruct>();
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
    context.watch<FFAppState>();

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
                        Builder(
                          builder: (context) {
                            if (widget.isCompleted) {
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FFIcons.kcheck,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget
                                              .usersTrainingExercisesRow?.name,
                                          'null',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'NTSomic',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              useGoogleFonts: false,
                                              lineHeight: 1.37,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Text(
                                valueOrDefault<String>(
                                  widget.usersTrainingExercisesRow?.name,
                                  'null',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'NTSomic',
                                      color: widget.isCompleted
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryText
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.37,
                                    ),
                              );
                            }
                          },
                        ),
                        if (!widget.isCompleted)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  FFIcons.ktimeCircle,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    '${valueOrDefault<String>(
                                      SetsPlanListStruct.maybeFromMap(widget
                                              .usersTrainingExercisesRow
                                              ?.setsPlan)
                                          ?.setsPlan
                                          .length
                                          .toString(),
                                      '0',
                                    )} подходов',
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
            if ((SetsPlanListStruct.maybeFromMap(
                        widget.usersTrainingExercisesRow!.setsPlan!)!
                    .setsPlan
                    .isNotEmpty) &&
                _model.isExpand)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).white8,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 9.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final childSets = SetsPlanListStruct.maybeFromMap(
                                        widget.usersTrainingExercisesRow
                                            ?.setsPlan)
                                    ?.setsPlan
                                    .toList() ??
                                [];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(childSets.length,
                                  (childSetsIndex) {
                                final childSetsItem = childSets[childSetsIndex];
                                return Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (widget.isCoachView) {
                                        return;
                                      }

                                      if (widget.isStartTraining) {
                                        if (_model.setsFact
                                            .where((e) =>
                                                (e.index == childSetsIndex) &&
                                                (functions.dateTimeToDate(functions
                                                        .stringToDateTime(e
                                                            .completedDateTime)) ==
                                                    functions.dateTimeToDate(
                                                        widget.dateTime)))
                                            .toList()
                                            .isNotEmpty) {
                                          _model.removeAtIndexFromSetsFact(
                                              childSetsIndex);
                                          setState(() {});
                                        } else {
                                          _model.addToSetsFact(SetsFactStruct(
                                            index: childSetsIndex,
                                            completedDateTime:
                                                functions.dateTimeToString(
                                                    getCurrentTimestamp),
                                            reps: valueOrDefault<int>(
                                              childSetsItem.reps,
                                              0,
                                            ),
                                            kg: valueOrDefault<double>(
                                              childSetsItem.weightKg,
                                              0.0,
                                            ),
                                          ));
                                          setState(() {});
                                          FFAppState().evenCounter =
                                              FFAppState().evenCounter + 1;
                                          setState(() {});
                                          if (functions.isEven(
                                              FFAppState().evenCounter)!) {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      const AlignmentDirectional(
                                                              0.0, 1.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: const EncouregmentWidget(),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          }
                                        }

                                        _model.updateSetsFactListStruct(
                                          (e) => e
                                            ..setsFact =
                                                _model.setsFact.toList(),
                                        );
                                        _model.updatePage(() {});
                                        await UsersTrainingsExercisesTable()
                                            .update(
                                          data: {
                                            'sets_fact':
                                                _model.setsFactList?.toMap(),
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget
                                                .usersTrainingExercisesRow?.id,
                                          ),
                                        );
                                      } else {
                                        return;
                                      }
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        '${valueOrDefault<String>(
                                                          (childSetsIndex + 1)
                                                              .toString(),
                                                          '1',
                                                        )} подход',
                                                        'null',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'NTSomic',
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${valueOrDefault<String>(
                                                          childSetsItem.reps
                                                              .toString(),
                                                          'null',
                                                        )} раз • ${valueOrDefault<String>(
                                                          formatNumber(
                                                            childSetsItem
                                                                .weightKg,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '#.#',
                                                            locale: '',
                                                          ),
                                                          'null',
                                                        )} кг',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'NTSomic',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (!widget.isCoachView)
                                                Container(
                                                  width: 36.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: _model.setsFact
                                                            .where((e) =>
                                                                (e.index ==
                                                                    childSetsIndex) &&
                                                                (functions.dateTimeToDate(
                                                                        functions.stringToDateTime(e
                                                                            .completedDateTime)) ==
                                                                    functions
                                                                        .dateTimeToDate(widget
                                                                            .dateTime)))
                                                            .toList()
                                                            .isNotEmpty
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .white8,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: const Color(0x06949494),
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.kcheck,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        if (childSetsIndex !=
                                            functions.subtractOne(
                                                SetsPlanListStruct.maybeFromMap(
                                                        widget
                                                            .usersTrainingExercisesRow
                                                            ?.setsPlan)
                                                    ?.setsPlan
                                                    .length))
                                          Container(
                                            width: double.infinity,
                                            height: 1.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x1EFDFDFD),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              }).divide(const SizedBox(height: 8.0)),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                        widget.usersTrainingExercisesRow?.rlExercises,
                        ParamType.int,
                      ),
                      'rlCoach': serializeParam(
                        widget.usersTrainingExercisesRow?.rlCoach,
                        ParamType.String,
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Подробнее о упражнении',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'NTSomic',
                                color: FlutterFlowTheme.of(context).secondary,
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
      ),
    );
  }
}
