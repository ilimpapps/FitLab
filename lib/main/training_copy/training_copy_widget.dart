import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/components/bottom_training_feedback/bottom_training_feedback_widget.dart';
import '/components/plan_details_item/plan_details_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'training_copy_model.dart';
export 'training_copy_model.dart';

class TrainingCopyWidget extends StatefulWidget {
  const TrainingCopyWidget({
    super.key,
    this.rlUsersTrainings,
    bool? isCoachView,
    this.dateTime,
  }) : isCoachView = isCoachView ?? false;

  final int? rlUsersTrainings;
  final bool isCoachView;
  final DateTime? dateTime;

  @override
  State<TrainingCopyWidget> createState() => _TrainingCopyWidgetState();
}

class _TrainingCopyWidgetState extends State<TrainingCopyWidget> {
  late TrainingCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.disconnect(
        'users_trainings_exercises',
      );
      await Future.delayed(const Duration(milliseconds: 1000));
      await actions.connect(
        'users_trainings_exercises',
        () async {
          setState(() => _model.requestCompleter1 = null);
          await _model.waitForRequestCompleted1();
          HapticFeedback.mediumImpact();
        },
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: FutureBuilder<List<UsersTrainingsExercisesRow>>(
          future: (_model.requestCompleter1 ??=
                  Completer<List<UsersTrainingsExercisesRow>>()
                    ..complete(UsersTrainingsExercisesTable().queryRows(
                      queryFn: (q) => q.eq(
                        'rl_users_trainings',
                        widget.rlUsersTrainings,
                      ),
                    )))
              .future,
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<UsersTrainingsExercisesRow>
                queryUsersExercisesUsersTrainingsExercisesRowList =
                snapshot.data!;
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/bg.png',
                  ).image,
                ),
              ),
              child: FutureBuilder<List<UsersTrainingsRow>>(
                future: (_model.requestCompleter2 ??=
                        Completer<List<UsersTrainingsRow>>()
                          ..complete(UsersTrainingsTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'id',
                              widget.rlUsersTrainings,
                            ),
                          )))
                    .future,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<UsersTrainingsRow>
                      queryUsersTrainingsUsersTrainingsRowList = snapshot.data!;
                  final queryUsersTrainingsUsersTrainingsRow =
                      queryUsersTrainingsUsersTrainingsRowList.isNotEmpty
                          ? queryUsersTrainingsUsersTrainingsRowList.first
                          : null;
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.safePop();
                                    },
                                    child: wrapWithModel(
                                      model: _model.backModel,
                                      updateCallback: () => setState(() {}),
                                      child: const BackWidget(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        queryUsersTrainingsUsersTrainingsRow
                                            ?.name,
                                        'null',
                                      ),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'NTSomic',
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  FutureBuilder<List<ChatsRow>>(
                                    future: ChatsTable().querySingleRow(
                                      queryFn: (q) => q
                                          .eq(
                                            'rl_users',
                                            currentUserUid,
                                          )
                                          .eq(
                                            'rl_coach',
                                            queryUsersExercisesUsersTrainingsExercisesRowList
                                                .first.rlCoach,
                                          ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ChatsRow> containerChatsRowList =
                                          snapshot.data!;
                                      final containerChatsRow =
                                          containerChatsRowList.isNotEmpty
                                              ? containerChatsRowList.first
                                              : null;
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'ChatsMessages',
                                            queryParameters: {
                                              'chat': serializeParam(
                                                containerChatsRow,
                                                ParamType.SupabaseRow,
                                              ),
                                              'rlUsersTraining': serializeParam(
                                                widget.rlUsersTrainings,
                                                ParamType.int,
                                              ),
                                              'trainingDateTime':
                                                  serializeParam(
                                                widget.dateTime,
                                                ParamType.DateTime,
                                              ),
                                              'trainingName': serializeParam(
                                                valueOrDefault<String>(
                                                  queryUsersTrainingsUsersTrainingsRow
                                                      ?.name,
                                                  'null',
                                                ),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 56.0,
                                          height: 56.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              FFIcons.kmessageCircle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (!widget.isCoachView)
                                        Text(
                                          valueOrDefault<String>(
                                            functions.dateTimeCalendarTitle(
                                                widget.dateTime),
                                            'null',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'NTSomic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white40,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 0.0, 0.0),
                                        child: Text(
                                          'План тренировки',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'NTSomic',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                                lineHeight: 1.25,
                                              ),
                                        ),
                                      ),
                                      if (!widget.isCoachView)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Выполнено:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NTSomic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              if (queryUsersExercisesUsersTrainingsExercisesRowList
                                                      .first.setsFact !=
                                                  null)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '${valueOrDefault<String>(
                                                      (((functions.sumIntList(queryUsersExercisesUsersTrainingsExercisesRowList
                                                                      .map((e) => SetsFactListStruct.maybeFromMap(e
                                                                              .setsFact)
                                                                          ?.setsFact
                                                                          .length)
                                                                      .withoutNulls
                                                                      .toList())!) /
                                                                  valueOrDefault<
                                                                      int>(
                                                                    functions.sumIntList(queryUsersExercisesUsersTrainingsExercisesRowList
                                                                        .map((e) => SetsPlanListStruct.maybeFromMap(e.setsPlan)
                                                                            ?.setsPlan
                                                                            .length)
                                                                        .withoutNulls
                                                                        .toList()),
                                                                    0,
                                                                  ) *
                                                                  100)
                                                              .round())
                                                          .toString(),
                                                      '0',
                                                    )}%',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NTSomic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              if (queryUsersExercisesUsersTrainingsExercisesRowList
                                                      .first.setsFact ==
                                                  null)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '0%',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NTSomic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final childTraining =
                                                queryUsersExercisesUsersTrainingsExercisesRowList
                                                    .toList();
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: List.generate(
                                                  childTraining.length,
                                                  (childTrainingIndex) {
                                                final childTrainingItem =
                                                    childTraining[
                                                        childTrainingIndex];
                                                return PlanDetailsItemWidget(
                                                  key: Key(
                                                      'Keypdp_${childTrainingIndex}_of_${childTraining.length}'),
                                                  isCompleted: SetsPlanListStruct
                                                              .maybeFromMap(
                                                                  childTrainingItem
                                                                      .setsPlan)
                                                          ?.setsPlan
                                                          .length ==
                                                      SetsFactListStruct.maybeFromMap(
                                                              childTrainingItem
                                                                  .setsFact)
                                                          ?.setsFact
                                                          .where((e) =>
                                                              functions.dateTimeToDate(widget
                                                                  .dateTime) ==
                                                              functions.dateTimeToDate(
                                                                  functions
                                                                      .stringToDateTime(e.completedDateTime)))
                                                          .toList()
                                                          .length,
                                                  isStartTraining: queryUsersTrainingsUsersTrainingsRow
                                                              ?.trainingStartDates
                                                              .where((e) =>
                                                                  functions
                                                                      .dateTimeToDate(
                                                                          e) ==
                                                                  functions
                                                                      .dateTimeToDate(
                                                                          widget
                                                                              .dateTime))
                                                              .toList() !=
                                                          null &&
                                                      (queryUsersTrainingsUsersTrainingsRow
                                                              ?.trainingStartDates
                                                              .where((e) =>
                                                                  functions
                                                                      .dateTimeToDate(
                                                                          e) ==
                                                                  functions
                                                                      .dateTimeToDate(
                                                                          widget
                                                                              .dateTime))
                                                              .toList())!
                                                          .isNotEmpty,
                                                  dateTime: widget.dateTime,
                                                  usersTrainingExercisesRow:
                                                      childTrainingItem,
                                                  isCoachView:
                                                      widget.isCoachView,
                                                );
                                              }).divide(const SizedBox(height: 9.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    ]
                                        .addToStart(const SizedBox(height: 12.0))
                                        .addToEnd(const SizedBox(height: 130.0)),
                                  ),
                                ),
                              ),
                            ),
                          ].addToStart(const SizedBox(height: 54.0)),
                        ),
                        if (!widget.isCoachView &&
                            !(queryUsersTrainingsUsersTrainingsRow!
                                .trainingEndDates
                                .where((e) =>
                                    functions.dateTimeToDate(widget.dateTime) ==
                                    functions.dateTimeToDate(e))
                                .toList()
                                .isNotEmpty))
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 50.0),
                              child: Builder(
                                builder: (context) {
                                  if (!(queryUsersTrainingsUsersTrainingsRow
                                      .trainingStartDates
                                      .where((e) =>
                                          functions.dateTimeToDate(
                                              widget.dateTime) ==
                                          functions.dateTimeToDate(e))
                                      .toList()
                                      .isNotEmpty)) {
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        await UsersTrainingsTable().update(
                                          data: {
                                            'training_start_dates':
                                                supaSerializeList<DateTime>(
                                                    functions.addDateTimeToList(
                                                        functions.dateTimeUtc(
                                                            getCurrentTimestamp),
                                                        queryUsersTrainingsUsersTrainingsRow
                                                            .trainingStartDates
                                                            .toList())),
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.rlUsersTrainings,
                                          ),
                                        );
                                        setState(() =>
                                            _model.requestCompleter2 = null);
                                        await _model.waitForRequestCompleted2();
                                      },
                                      text: 'Начать тренировку',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 52.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'NTSomic',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      showLoadingIndicator: false,
                                    );
                                  } else {
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        await UsersTrainingsTable().update(
                                          data: {
                                            'training_end_dates':
                                                supaSerializeList<DateTime>(
                                                    functions.addDateTimeToList(
                                                        functions.dateTimeUtc(
                                                            getCurrentTimestamp),
                                                        queryUsersTrainingsUsersTrainingsRow
                                                            .trainingEndDates
                                                            .toList())),
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.rlUsersTrainings,
                                          ),
                                        );
                                        _model.passedTraining =
                                            await PassedTrainingsTable()
                                                .insert({
                                          'rl_user': currentUserUid,
                                          'end_date': supaSerialize<DateTime>(
                                              getCurrentTimestamp),
                                          'rl_training':
                                              widget.rlUsersTrainings,
                                          'training_progress':
                                              valueOrDefault<int>(
                                            ((queryUsersExercisesUsersTrainingsExercisesRowList
                                                                .first.setsFact!
                                                                .toList()
                                                                .map<SetsFactStruct?>(
                                                                    SetsFactStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                SetsFactStruct?>)
                                                        .withoutNulls
                                                        .length /
                                                    (queryUsersExercisesUsersTrainingsExercisesRowList
                                                                .first.setsPlan!
                                                                .toList()
                                                                .map<SetsPlanStruct?>(
                                                                    SetsPlanStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                SetsPlanStruct?>)
                                                        .withoutNulls
                                                        .length *
                                                    100)
                                                .round(),
                                            0,
                                          ),
                                          'training_name':
                                              queryUsersTrainingsUsersTrainingsRow
                                                  .name,
                                        });
                                        setState(() =>
                                            _model.requestCompleter2 = null);
                                        await _model.waitForRequestCompleted2();
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    BottomTrainingFeedbackWidget(
                                                  passedTrainiing:
                                                      _model.passedTraining!,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        setState(() {});
                                      },
                                      text: 'Завершить тренировку',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 52.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'NTSomic',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      showLoadingIndicator: false,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
