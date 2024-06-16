import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/coach_flow/training_templates/training_template_card/training_template_card_widget.dart';
import '/components/back/back_widget.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/components/empty_training_templates_list/empty_training_templates_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'training_templates_model.dart';
export 'training_templates_model.dart';

class TrainingTemplatesWidget extends StatefulWidget {
  const TrainingTemplatesWidget({super.key});

  @override
  State<TrainingTemplatesWidget> createState() =>
      _TrainingTemplatesWidgetState();
}

class _TrainingTemplatesWidgetState extends State<TrainingTemplatesWidget>
    with TickerProviderStateMixin {
  late TrainingTemplatesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingTemplatesModel());

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
        body: Container(
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
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
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
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                      child: Text(
                        'Шаблоны тренировок',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'NTSomic',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                  lineHeight: 1.2,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
                      child: Text(
                        'Создавай готовые тренировки и быстро добавляй их в шаблоны',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'NTSomic',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                              lineHeight: 1.37,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                                _model.picked = 'Начинающий';
                                setState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.choiceChipModel1,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: ChoiceChipWidget(
                                  text: 'Начинающий',
                                  isPicked: _model.picked == 'Начинающий',
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.picked = 'Средний';
                                setState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.choiceChipModel2,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: ChoiceChipWidget(
                                  text: 'Средний',
                                  isPicked: _model.picked == 'Средний',
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.picked = 'Профессионал';
                                setState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.choiceChipModel3,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: ChoiceChipWidget(
                                  text: 'Профессионал',
                                  isPicked: _model.picked == 'Профессионал',
                                ),
                              ),
                            ),
                          ]
                              .divide(const SizedBox(width: 8.0))
                              .addToStart(const SizedBox(width: 20.0))
                              .addToEnd(const SizedBox(width: 20.0)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 16.0, 20.0, 0.0),
                        child: FutureBuilder<List<ViewCoachTrainingsRow>>(
                          future: ViewCoachTrainingsTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'difficulty',
                                  _model.picked,
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
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0x03E6FC70),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<ViewCoachTrainingsRow>
                                queryViewCoachTrainingPlansViewCoachTrainingsRowList =
                                snapshot.data!;
                            if (queryViewCoachTrainingPlansViewCoachTrainingsRowList
                                .isEmpty) {
                              return const Center(
                                child: EmptyTrainingTemplatesListWidget(),
                              );
                            }
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    queryViewCoachTrainingPlansViewCoachTrainingsRowList
                                        .length,
                                    (queryViewCoachTrainingPlansIndex) {
                                  final queryViewCoachTrainingPlansViewCoachTrainingsRow =
                                      queryViewCoachTrainingPlansViewCoachTrainingsRowList[
                                          queryViewCoachTrainingPlansIndex];
                                  return FutureBuilder<List<CoachTrainingsRow>>(
                                    future:
                                        CoachTrainingsTable().querySingleRow(
                                      queryFn: (q) => q.eq(
                                        'id',
                                        queryViewCoachTrainingPlansViewCoachTrainingsRow
                                            .id,
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0x03E6FC70),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<CoachTrainingsRow>
                                          containerCoachTrainingsRowList =
                                          snapshot.data!;
                                      final containerCoachTrainingsRow =
                                          containerCoachTrainingsRowList
                                                  .isNotEmpty
                                              ? containerCoachTrainingsRowList
                                                  .first
                                              : null;
                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: FutureBuilder<
                                            List<CoachTrainingsExercisesRow>>(
                                          future: CoachTrainingsExercisesTable()
                                              .queryRows(
                                            queryFn: (q) => q.eq(
                                              'rl_coach_trainings',
                                              containerCoachTrainingsRow?.id,
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
                                            List<CoachTrainingsExercisesRow>
                                                trainingTemplateCardCoachTrainingsExercisesRowList =
                                                snapshot.data!;
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'TrainingTemplatesEdit',
                                                  queryParameters: {
                                                    'exerciesesList':
                                                        serializeParam(
                                                      trainingTemplateCardCoachTrainingsExercisesRowList,
                                                      ParamType.SupabaseRow,
                                                      isList: true,
                                                    ),
                                                    'idTraning': serializeParam(
                                                      containerCoachTrainingsRow
                                                          ?.id,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: TrainingTemplateCardWidget(
                                                key: Key(
                                                    'Keyaou_${queryViewCoachTrainingPlansIndex}_of_${queryViewCoachTrainingPlansViewCoachTrainingsRowList.length}'),
                                                viewCoachTrainings:
                                                    queryViewCoachTrainingPlansViewCoachTrainingsRow,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                }).divide(const SizedBox(height: 8.0)).addToEnd(
                                    const SizedBox(height: 130.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation']!),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 50.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('TrainingTemplatesAdd1');
                    },
                    text: 'Создать шаблон',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .labelSmall
                          .override(
                            fontFamily: 'NTSomic',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
