import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/components/bottom_training_feedback/bottom_training_feedback_widget.dart';
import '/components/plan_details_item/plan_details_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
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
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'training_model.dart';
export 'training_model.dart';

class TrainingWidget extends StatefulWidget {
  const TrainingWidget({
    super.key,
    this.rlUsersTrainings,
    bool? isCoachView,
    this.dateTime,
  }) : isCoachView = isCoachView ?? false;

  final int? rlUsersTrainings;
  final bool isCoachView;
  final DateTime? dateTime;

  @override
  State<TrainingWidget> createState() => _TrainingWidgetState();
}

class _TrainingWidgetState extends State<TrainingWidget>
    with TickerProviderStateMixin {
  late TrainingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingModel());

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

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                      queryFn: (q) => q
                          .eq(
                            'rl_users_trainings',
                            widget.rlUsersTrainings,
                          )
                          .order('id', ascending: true),
                    )))
              .future,
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return const Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0x03E6FC70),
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
                future: UsersTrainingsTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'id',
                    widget.rlUsersTrainings,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return const Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0x03E6FC70),
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
                    child: FutureBuilder<List<PassedTrainingsRow>>(
                      future: (_model.requestCompleter2 ??=
                              Completer<List<PassedTrainingsRow>>()
                                ..complete(PassedTrainingsTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'rl_user',
                                        currentUserUid,
                                      )
                                      .eq(
                                        'rl_training',
                                        widget.rlUsersTrainings,
                                      ),
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0x03E6FC70),
                                ),
                              ),
                            ),
                          );
                        }
                        List<PassedTrainingsRow>
                            queryPassedTrainingsPassedTrainingsRowList =
                            snapshot.data!;
                        return Container(
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
                                          MainAxisAlignment.start,
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
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: const BackWidget(),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  queryUsersTrainingsUsersTrainingsRow
                                                      ?.name,
                                                  'null',
                                                ),
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NTSomic',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (FFAppState().isCoach)
                                          FutureBuilder<List<ChatsRow>>(
                                            future: ChatsTable().querySingleRow(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'rl_users',
                                                    queryUsersTrainingsUsersTrainingsRow
                                                        ?.rlUsers,
                                                  )
                                                  .eq(
                                                    'rl_coach',
                                                    currentUserUid,
                                                  ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return const Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        Color(0x03E6FC70),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ChatsRow>
                                                  isCoachChatsRowList =
                                                  snapshot.data!;
                                              final isCoachChatsRow =
                                                  isCoachChatsRowList.isNotEmpty
                                                      ? isCoachChatsRowList
                                                          .first
                                                      : null;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'ChatsMessages',
                                                    queryParameters: {
                                                      'chat': serializeParam(
                                                        isCoachChatsRow,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                      'rlUsersTraining':
                                                          serializeParam(
                                                        widget.rlUsersTrainings,
                                                        ParamType.int,
                                                      ),
                                                      'trainingDateTime':
                                                          serializeParam(
                                                        widget.dateTime,
                                                        ParamType.DateTime,
                                                      ),
                                                      'trainingName':
                                                          serializeParam(
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.kmessageCircle,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        if (!FFAppState().isCoach)
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
                                                return const Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        Color(0x03E6FC70),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ChatsRow>
                                                  isClientChatsRowList =
                                                  snapshot.data!;
                                              final isClientChatsRow =
                                                  isClientChatsRowList
                                                          .isNotEmpty
                                                      ? isClientChatsRowList
                                                          .first
                                                      : null;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'ChatsMessages',
                                                    queryParameters: {
                                                      'chat': serializeParam(
                                                        isClientChatsRow,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                      'rlUsersTraining':
                                                          serializeParam(
                                                        widget.rlUsersTrainings,
                                                        ParamType.int,
                                                      ),
                                                      'trainingDateTime':
                                                          serializeParam(
                                                        widget.dateTime,
                                                        ParamType.DateTime,
                                                      ),
                                                      'trainingName':
                                                          serializeParam(
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.kmessageCircle,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (!widget.isCoachView)
                                              Text(
                                                valueOrDefault<String>(
                                                  functions
                                                      .dateTimeCalendarTitle(
                                                          widget.dateTime),
                                                  'null',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'NTSomic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .white40,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 6.0, 0.0, 0.0),
                                              child: Text(
                                                'План тренировки',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'NTSomic',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.25,
                                                        ),
                                              ),
                                            ),
                                            if (!widget.isCoachView)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: LinearPercentIndicator(
                                                  percent:
                                                      valueOrDefault<double>(
                                                    functions.progressbar(
                                                        valueOrDefault<double>(
                                                          functions
                                                              .sumIntList(queryUsersExercisesUsersTrainingsExercisesRowList
                                                                  .where((e) =>
                                                                      SetsPlanListStruct
                                                                          .maybeFromMap(e
                                                                              .setsPlan) !=
                                                                      null)
                                                                  .toList()
                                                                  .map((e) => SetsPlanListStruct
                                                                          .maybeFromMap(
                                                                              e.setsPlan)
                                                                      ?.setsPlan
                                                                      .length)
                                                                  .withoutNulls
                                                                  .toList())
                                                              ?.toDouble(),
                                                          0.0,
                                                        ),
                                                        valueOrDefault<double>(
                                                          functions
                                                              .sumIntList(queryUsersExercisesUsersTrainingsExercisesRowList
                                                                  .where((e) =>
                                                                      SetsFactListStruct
                                                                          .maybeFromMap(e
                                                                              .setsFact) !=
                                                                      null)
                                                                  .toList()
                                                                  .map((e) => SetsFactListStruct
                                                                          .maybeFromMap(
                                                                              e.setsFact)
                                                                      ?.setsFact
                                                                      .length)
                                                                  .withoutNulls
                                                                  .toList())
                                                              ?.toDouble(),
                                                          0.0,
                                                        )),
                                                    0.0,
                                                  ),
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.85,
                                                  lineHeight: 6.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .divider,
                                                  barRadius:
                                                      const Radius.circular(4.0),
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ),
                                            if (!widget.isCoachView)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 6.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'Выполнено:',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'NTSomic',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${valueOrDefault<String>(
                                                          ((valueOrDefault<int>(
                                                                        functions.sumIntList(queryUsersExercisesUsersTrainingsExercisesRowList
                                                                            .where((e) =>
                                                                                SetsFactListStruct.maybeFromMap(e.setsFact) !=
                                                                                null)
                                                                            .toList()
                                                                            .map((e) =>
                                                                                SetsFactListStruct.maybeFromMap(e.setsFact)?.setsFact.length)
                                                                            .withoutNulls
                                                                            .toList()),
                                                                        0,
                                                                      ) /
                                                                      valueOrDefault<
                                                                          int>(
                                                                        functions.sumIntList(queryUsersExercisesUsersTrainingsExercisesRowList
                                                                            .where((e) =>
                                                                                SetsPlanListStruct.maybeFromMap(e.setsPlan) !=
                                                                                null)
                                                                            .toList()
                                                                            .map((e) =>
                                                                                SetsPlanListStruct.maybeFromMap(e.setsPlan)?.setsPlan.length)
                                                                            .withoutNulls
                                                                            .toList()),
                                                                        0,
                                                                      ) *
                                                                      100)
                                                                  .round())
                                                              .toString(),
                                                          '0',
                                                        )}%',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'NTSomic',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final childTraining =
                                                      queryUsersExercisesUsersTrainingsExercisesRowList
                                                          .toList();
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: List.generate(
                                                        childTraining.length,
                                                        (childTrainingIndex) {
                                                      final childTrainingItem =
                                                          childTraining[
                                                              childTrainingIndex];
                                                      return wrapWithModel(
                                                        model: _model
                                                            .planDetailsItemModels
                                                            .getModel(
                                                          childTrainingItem.id
                                                              .toString(),
                                                          childTrainingIndex,
                                                        ),
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            PlanDetailsItemWidget(
                                                          key: Key(
                                                            'Keycdb_${childTrainingItem.id.toString()}',
                                                          ),
                                                          isCompleted: widget
                                                                  .isCoachView
                                                              ? false
                                                              : (SetsPlanListStruct.maybeFromMap(
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
                                                                          functions
                                                                              .dateTimeToDate(functions.stringToDateTime(e.completedDateTime)))
                                                                      .toList()
                                                                      .length),
                                                          isStartTraining: widget
                                                                  .isCoachView
                                                              ? false
                                                              : (queryPassedTrainingsPassedTrainingsRowList
                                                                  .where((e) =>
                                                                      (e.startTraining !=
                                                                          null) &&
                                                                      (functions.dateTimeToDate(widget
                                                                              .dateTime) ==
                                                                          functions
                                                                              .dateTimeToDate(e.startTraining)))
                                                                  .toList()
                                                                  .isNotEmpty),
                                                          dateTime:
                                                              widget.dateTime,
                                                          usersTrainingExercisesRow:
                                                              childTrainingItem,
                                                          isCoachView: widget
                                                              .isCoachView,
                                                        ),
                                                      );
                                                    }).divide(
                                                        const SizedBox(height: 9.0)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ]
                                              .addToStart(
                                                  const SizedBox(height: 12.0))
                                              .addToEnd(
                                                  const SizedBox(height: 130.0)),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation']!),
                                    ),
                                  ),
                                ].addToStart(const SizedBox(height: 54.0)),
                              ),
                              if (!widget.isCoachView &&
                                  !valueOrDefault<bool>(
                                    queryPassedTrainingsPassedTrainingsRowList
                                        .where((e) =>
                                            (e.endTraining != null) &&
                                            (functions.dateTimeToDate(
                                                    widget.dateTime) ==
                                                functions.dateTimeToDate(
                                                    e.endTraining)))
                                        .toList()
                                        .isNotEmpty,
                                    false,
                                  ))
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 50.0),
                                    child: Builder(
                                      builder: (context) {
                                        if (!valueOrDefault<bool>(
                                          queryPassedTrainingsPassedTrainingsRowList
                                              .where((e) =>
                                                  (e.startTraining != null) &&
                                                  (functions.dateTimeToDate(
                                                          widget.dateTime) ==
                                                      functions.dateTimeToDate(
                                                          e.startTraining)))
                                              .toList()
                                              .isNotEmpty,
                                          false,
                                        )) {
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              _model.passedTraining =
                                                  await PassedTrainingsTable()
                                                      .insert({
                                                'rl_user': currentUserUid,
                                                'rl_training':
                                                    widget.rlUsersTrainings,
                                                'training_progress':
                                                    valueOrDefault<int>(
                                                  ((functions.sumIntList(queryUsersExercisesUsersTrainingsExercisesRowList
                                                              .map((e) => SetsFactListStruct
                                                                      .maybeFromMap(
                                                                          e.setsFact)
                                                                  ?.setsFact
                                                                  .length)
                                                              .withoutNulls
                                                              .toList())!) /
                                                          valueOrDefault<int>(
                                                            functions.sumIntList(
                                                                queryUsersExercisesUsersTrainingsExercisesRowList
                                                                    .map((e) => SetsPlanListStruct.maybeFromMap(
                                                                            e.setsPlan)
                                                                        ?.setsPlan
                                                                        .length)
                                                                    .withoutNulls
                                                                    .toList()),
                                                            0,
                                                          ) *
                                                          100)
                                                      .round(),
                                                  0,
                                                ),
                                                'training_name':
                                                    queryUsersTrainingsUsersTrainingsRow
                                                        ?.name,
                                                'start_training': supaSerialize<
                                                        DateTime>(
                                                    functions.dateTimeUtc(
                                                        getCurrentTimestamp)),
                                                'rl_coach':
                                                    queryUsersTrainingsUsersTrainingsRow
                                                        ?.rlCoach,
                                              });
                                              setState(() => _model
                                                  .requestCompleter2 = null);
                                              await _model
                                                  .waitForRequestCompleted2();

                                              setState(() {});
                                            },
                                            text: 'Начать тренировку',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 52.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'NTSomic',
                                                        color: FlutterFlowTheme
                                                                .of(context)
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
                                              await PassedTrainingsTable()
                                                  .update(
                                                data: {
                                                  'rl_user': currentUserUid,
                                                  'end_training': supaSerialize<
                                                          DateTime>(
                                                      functions.dateTimeUtc(
                                                          getCurrentTimestamp)),
                                                  'rl_training':
                                                      widget.rlUsersTrainings,
                                                  'training_progress':
                                                      valueOrDefault<int>(
                                                    ((functions.sumIntList(queryUsersExercisesUsersTrainingsExercisesRowList
                                                                .map((e) => SetsFactListStruct
                                                                        .maybeFromMap(
                                                                            e.setsFact)
                                                                    ?.setsFact
                                                                    .length)
                                                                .withoutNulls
                                                                .toList())!) /
                                                            valueOrDefault<int>(
                                                              functions.sumIntList(queryUsersExercisesUsersTrainingsExercisesRowList
                                                                  .map((e) => SetsPlanListStruct
                                                                          .maybeFromMap(
                                                                              e.setsPlan)
                                                                      ?.setsPlan
                                                                      .length)
                                                                  .withoutNulls
                                                                  .toList()),
                                                              0,
                                                            ) *
                                                            100)
                                                        .round(),
                                                    0,
                                                  ),
                                                  'training_name':
                                                      queryUsersTrainingsUsersTrainingsRow
                                                          ?.name,
                                                  'rl_coach':
                                                      queryUsersTrainingsUsersTrainingsRow
                                                          ?.rlCoach,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  queryPassedTrainingsPassedTrainingsRowList
                                                      .where((e) =>
                                                          (e.startTraining !=
                                                              null) &&
                                                          (functions.dateTimeToDate(e
                                                                  .startTraining) ==
                                                              functions
                                                                  .dateTimeToDate(
                                                                      widget
                                                                          .dateTime)))
                                                      .toList()
                                                      .last
                                                      .id,
                                                ),
                                              );
                                              setState(() => _model
                                                  .requestCompleter2 = null);
                                              await _model
                                                  .waitForRequestCompleted2();
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          BottomTrainingFeedbackWidget(
                                                        rlPassedTrainings: queryPassedTrainingsPassedTrainingsRowList
                                                            .where((e) =>
                                                                (e.startTraining !=
                                                                    null) &&
                                                                (functions.dateTimeToDate(e
                                                                        .startTraining) ==
                                                                    functions.dateTimeToDate(
                                                                        widget
                                                                            .dateTime)))
                                                            .toList()
                                                            .last
                                                            .id,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              setState(() {});
                                            },
                                            text: 'Завершить тренировку',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 52.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'NTSomic',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
            );
          },
        ),
      ),
    );
  }
}
