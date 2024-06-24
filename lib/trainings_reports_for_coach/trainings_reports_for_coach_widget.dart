import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/components/empty_training_reports/empty_training_reports_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'trainings_reports_for_coach_model.dart';
export 'trainings_reports_for_coach_model.dart';

class TrainingsReportsForCoachWidget extends StatefulWidget {
  const TrainingsReportsForCoachWidget({
    super.key,
    required this.rlClient,
  });

  final String? rlClient;

  @override
  State<TrainingsReportsForCoachWidget> createState() =>
      _TrainingsReportsForCoachWidgetState();
}

class _TrainingsReportsForCoachWidgetState
    extends State<TrainingsReportsForCoachWidget>
    with TickerProviderStateMixin {
  late TrainingsReportsForCoachModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingsReportsForCoachModel());

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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: FutureBuilder<List<UsersRow>>(
          future: UsersTable().querySingleRow(
            queryFn: (q) => q.eq(
              'id',
              widget.rlClient,
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
            List<UsersRow> clientQueryUsersRowList = snapshot.data!;
            final clientQueryUsersRow = clientQueryUsersRowList.isNotEmpty
                ? clientQueryUsersRowList.first
                : null;
            return Container(
              decoration: const BoxDecoration(),
              child: FutureBuilder<List<PassedTrainingsRow>>(
                future: PassedTrainingsTable().queryRows(
                  queryFn: (q) => q
                      .eq(
                        'rl_user',
                        widget.rlClient,
                      )
                      .order('created_at'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Image.asset(
                      '',
                    );
                  }
                  List<PassedTrainingsRow> passedQueryPassedTrainingsRowList =
                      snapshot.data!;
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/bg.png',
                        ).image,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
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
                            ],
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Отчеты о выполненных тренировках',
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
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 24.0, 0.0),
                                            child: Text(
                                              'Клиент',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'NTSomic',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.3,
                                                      ),
                                            ),
                                          ),
                                          if (clientQueryUsersRow?.photoUrl !=
                                                  null &&
                                              clientQueryUsersRow?.photoUrl !=
                                                  '')
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(32.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    const Duration(milliseconds: 200),
                                                fadeOutDuration:
                                                    const Duration(milliseconds: 200),
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  clientQueryUsersRow?.photoUrl,
                                                  'null',
                                                ),
                                                width: 32.0,
                                                height: 32.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '${clientQueryUsersRow?.name} ${clientQueryUsersRow?.surname}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'NTSomic',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.3,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final trainings =
                                                  passedQueryPassedTrainingsRowList
                                                      .toList();
                                              if (trainings.isEmpty) {
                                                return const SizedBox(
                                                  height: 140.0,
                                                  child:
                                                      EmptyTrainingReportsWidget(),
                                                );
                                              }
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: trainings.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 24.0),
                                                itemBuilder:
                                                    (context, trainingsIndex) {
                                                  final trainingsItem =
                                                      trainings[trainingsIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'TrainingReport',
                                                        queryParameters: {
                                                          'passedTraining':
                                                              serializeParam(
                                                            trainingsItem,
                                                            ParamType
                                                                .SupabaseRow,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .stringUpperCase(
                                                                      dateTimeFormat(
                                                                'MMMMEEEEd',
                                                                trainingsItem
                                                                    .createdAt,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )),
                                                              'null',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'NTSomic',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .white40,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.28,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white8,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            16.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              trainingsItem.trainingName,
                                                                              'null',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'NTSomic',
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                  lineHeight: 1.1,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${trainingsItem.trainingProgress?.toString()} %',
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: 'NTSomic',
                                                                                  color: FlutterFlowTheme.of(context).white40,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                  lineHeight: 1.37,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            FFIcons.kright4,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).white40,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Icon(
                                                                            FFIcons.kstar,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                trainingsItem.rating?.toString(),
                                                                                'null',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'NTSomic',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                    lineHeight: 1.28,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              FFIcons.kuser,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                trainingsItem.userFeeling?.toString(),
                                                                                'null',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'NTSomic',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                    lineHeight: 1.28,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              FFIcons.ktimeCircle,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                functions.differenceInHoursAndMinutes(trainingsItem.startTraining!, trainingsItem.endTraining!),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'NTSomic',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
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
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].addToEnd(const SizedBox(height: 50.0)),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['columnOnPageLoadAnimation']!),
                            ),
                          ),
                        ],
                      ),
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
