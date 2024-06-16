import '/backend/supabase/supabase.dart';
import '/coach_flow/plan_view/training_view_card/training_view_card_widget.dart';
import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'plan_view_model.dart';
export 'plan_view_model.dart';

class PlanViewWidget extends StatefulWidget {
  const PlanViewWidget({
    super.key,
    required this.rlUsers,
  });

  final String? rlUsers;

  @override
  State<PlanViewWidget> createState() => _PlanViewWidgetState();
}

class _PlanViewWidgetState extends State<PlanViewWidget>
    with TickerProviderStateMixin {
  late PlanViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanViewModel());

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
        body: FutureBuilder<List<ViewUsersTrainingsRow>>(
          future: ViewUsersTrainingsTable().queryRows(
            queryFn: (q) => q
                .eq(
                  'rl_users',
                  widget.rlUsers,
                )
                .order('weekday', ascending: true),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Image.asset(
                '',
              );
            }
            List<ViewUsersTrainingsRow> containerViewUsersTrainingsRowList =
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
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'TrainingsReportsForCoach',
                                  queryParameters: {
                                    'rlClient': serializeParam(
                                      widget.rlUsers,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 6.0),
                                  child: Text(
                                    'Отчёты о тренировках',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'NTSomic',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.28,
                                        ),
                                  ),
                                ),
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
                                    'План ',
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
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Text(
                                            'Клиент',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'NTSomic',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.37,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(32.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(milliseconds: 200),
                                              fadeOutDuration:
                                                  const Duration(milliseconds: 200),
                                              imageUrl: valueOrDefault<String>(
                                                containerViewUsersTrainingsRowList
                                                    .first.usersPhotoUrl,
                                                'null',
                                              ),
                                              width: 32.0,
                                              height: 32.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '${valueOrDefault<String>(
                                              containerViewUsersTrainingsRowList
                                                  .first.usersName,
                                              'null',
                                            )} ${valueOrDefault<String>(
                                              containerViewUsersTrainingsRowList
                                                  .first.usersSurname,
                                              'null',
                                            )}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'NTSomic',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.37,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 28.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final trainings =
                                              containerViewUsersTrainingsRowList
                                                  .toList();
                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: trainings.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 24.0),
                                            itemBuilder:
                                                (context, trainingsIndex) {
                                              final trainingsItem =
                                                  trainings[trainingsIndex];
                                              return Container(
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions
                                                            .dateTimeCapsWeekday(
                                                                trainingsItem
                                                                    .weekday),
                                                        'null',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'NTSomic',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .white40,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.28,
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
                                                      child: InkWell(
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
                                                            'Training',
                                                            queryParameters: {
                                                              'rlUsersTrainings':
                                                                  serializeParam(
                                                                trainingsItem
                                                                    .id,
                                                                ParamType.int,
                                                              ),
                                                              'isCoachView':
                                                                  serializeParam(
                                                                true,
                                                                ParamType.bool,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child:
                                                            TrainingViewCardWidget(
                                                          key: Key(
                                                              'Keytg2_${trainingsIndex}_of_${trainings.length}'),
                                                          name: valueOrDefault<
                                                              String>(
                                                            trainingsItem.name,
                                                            'null',
                                                          ),
                                                          exerciesesCount:
                                                              valueOrDefault<
                                                                  String>(
                                                            functions.getExerciseWord(
                                                                trainingsItem
                                                                    .exercisesCount!),
                                                            'null',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ].addToEnd(const SizedBox(height: 60.0)),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation']!),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
