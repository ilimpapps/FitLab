import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/components/exerciese_item_creation_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'training_templates_edit_model.dart';
export 'training_templates_edit_model.dart';

class TrainingTemplatesEditWidget extends StatefulWidget {
  const TrainingTemplatesEditWidget({
    super.key,
    required this.exerciesesList,
    required this.idTraning,
  });

  final List<CoachTrainingsExercisesRow>? exerciesesList;
  final int? idTraning;

  @override
  State<TrainingTemplatesEditWidget> createState() =>
      _TrainingTemplatesEditWidgetState();
}

class _TrainingTemplatesEditWidgetState
    extends State<TrainingTemplatesEditWidget> with TickerProviderStateMixin {
  late TrainingTemplatesEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingTemplatesEditModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (_model.pickedItems < widget.exerciesesList!.length) {
        _model.addToCoachExercisesPicker(CoachExercisesPickerStruct(
          rlExercises: widget.exerciesesList?[_model.pickedItems].rlExercises,
          name: widget.exerciesesList?[_model.pickedItems].name,
        ));
        setState(() {});
        _model.pickedItems = _model.pickedItems + 1;
        setState(() {});
      }
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
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
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
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
                            await CoachTrainingsTable().delete(
                              matchingRows: (rows) => rows.eq(
                                'id',
                                widget.idTraning,
                              ),
                            );
                            context.safePop();

                            setState(() {});
                          },
                          child: Container(
                            width: 56.0,
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).error,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FFIcons.ktrashCan,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  'Шаблон тренировки',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'NTSomic',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                        lineHeight: 1.25,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final childCoachExercisesPicker =
                                              _model.coachExercisesPicker
                                                  .toList();
                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: childCoachExercisesPicker
                                                .length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 8.0),
                                            itemBuilder: (context,
                                                childCoachExercisesPickerIndex) {
                                              final childCoachExercisesPickerItem =
                                                  childCoachExercisesPicker[
                                                      childCoachExercisesPickerIndex];
                                              return ExercieseItemCreationWidget(
                                                key: Key(
                                                    'Keyouh_${childCoachExercisesPickerIndex}_of_${childCoachExercisesPicker.length}'),
                                                exerciese:
                                                    childCoachExercisesPickerItem
                                                        .name,
                                                showDelete: false,
                                                delete: () async {
                                                  _model.removeAtIndexFromCoachExercisesPicker(
                                                      childCoachExercisesPickerIndex);
                                                  setState(() {});
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].addToEnd(const SizedBox(height: 130.0)),
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
        ),
      ),
    );
  }
}
