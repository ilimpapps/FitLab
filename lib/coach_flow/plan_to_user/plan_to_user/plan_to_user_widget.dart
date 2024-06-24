import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/user_plans_card/user_plans_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'plan_to_user_model.dart';
export 'plan_to_user_model.dart';

class PlanToUserWidget extends StatefulWidget {
  const PlanToUserWidget({super.key});

  @override
  State<PlanToUserWidget> createState() => _PlanToUserWidgetState();
}

class _PlanToUserWidgetState extends State<PlanToUserWidget>
    with TickerProviderStateMixin {
  late PlanToUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanToUserModel());

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              FutureBuilder<List<ViewPlanToUserRow>>(
                future: ViewPlanToUserTable().queryRows(
                  queryFn: (q) => q.eq(
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
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0x03E6FC70),
                          ),
                        ),
                      ),
                    );
                  }
                  List<ViewPlanToUserRow> viewPlanToUserViewPlanToUserRowList =
                      snapshot.data!;
                  return Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/bg.png',
                        ).image,
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Планы',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'NTSomic',
                                        fontSize: 40.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('Exercices');
                                        },
                                        child: Container(
                                          width: 140.0,
                                          height: 140.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .greenLight,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/dumbbell.png',
                                                    width: 40.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                const Spacer(),
                                                AutoSizeText(
                                                  'База знаний',
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'NTSomic',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.37,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Актуальная информация об упражнениях',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'NTSomic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.25,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('TemplatesPlans');
                                        },
                                        child: Container(
                                          width: 140.0,
                                          height: 140.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .orangeLight,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/Like.png',
                                                    width: 40.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                const Spacer(),
                                                AutoSizeText(
                                                  'Шаблоны',
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'NTSomic',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.37,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: AutoSizeText(
                                                    'Готовые шаблоны тренировок',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'NTSomic',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.25,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                        .divide(const SizedBox(width: 15.0))
                                        .addToStart(const SizedBox(width: 20.0))
                                        .addToEnd(const SizedBox(width: 20.0)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 40.0, 0.0, 0.0),
                                child: Text(
                                  'Активные планы',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'NTSomic',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final childViewUsersTrainings =
                                        viewPlanToUserViewPlanToUserRowList
                                            .toList();
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          childViewUsersTrainings.length,
                                          (childViewUsersTrainingsIndex) {
                                        final childViewUsersTrainingsItem =
                                            childViewUsersTrainings[
                                                childViewUsersTrainingsIndex];
                                        return UserPlansCardWidget(
                                          key: Key(
                                              'Keyrxu_${childViewUsersTrainingsIndex}_of_${childViewUsersTrainings.length}'),
                                          viewPlanToUser:
                                              childViewUsersTrainingsItem,
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ].addToEnd(const SizedBox(height: 126.0)),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['columnOnPageLoadAnimation']!),
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: NavBarWidget(
                      index: 2,
                      isCoach: FFAppState().isCoach,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
