import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/coach_flow/bottom_exercises_add/bottom_exercises_add_widget.dart';
import '/components/back/back_widget.dart';
import '/components/exerciese_item_creation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'training_templates_add2_model.dart';
export 'training_templates_add2_model.dart';

class TrainingTemplatesAdd2Widget extends StatefulWidget {
  const TrainingTemplatesAdd2Widget({
    super.key,
    required this.name,
    required this.difficulty,
  });

  final String? name;
  final String? difficulty;

  @override
  State<TrainingTemplatesAdd2Widget> createState() =>
      _TrainingTemplatesAdd2WidgetState();
}

class _TrainingTemplatesAdd2WidgetState
    extends State<TrainingTemplatesAdd2Widget> {
  late TrainingTemplatesAdd2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingTemplatesAdd2Model());
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
                                  'Шаг 2 из 2',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'NTSomic',
                                        color: FlutterFlowTheme.of(context)
                                            .white40,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                        lineHeight: 1.37,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  'Создать шаблон тренировки',
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
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: childCoachExercisesPicker
                                                .length,
                                            itemBuilder: (context,
                                                childCoachExercisesPickerIndex) {
                                              final childCoachExercisesPickerItem =
                                                  childCoachExercisesPicker[
                                                      childCoachExercisesPickerIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 4.0),
                                                child:
                                                    ExercieseItemCreationWidget(
                                                  key: Key(
                                                      'Keyjv9_${childCoachExercisesPickerIndex}_of_${childCoachExercisesPicker.length}'),
                                                  exerciese:
                                                      childCoachExercisesPickerItem
                                                          .name,
                                                  showDelete: true,
                                                  delete: () async {
                                                    _model.removeAtIndexFromCoachExercisesPicker(
                                                        childCoachExercisesPickerIndex);
                                                    setState(() {});
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          var shouldSetState = false;
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
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
                                                      const BottomExercisesAddWidget(),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.bottomOutput = value));

                                          shouldSetState = true;
                                          _model.pickedItems = 0;
                                          setState(() {});
                                          if (_model.bottomOutput != null &&
                                              (_model.bottomOutput)!
                                                  .isNotEmpty) {
                                            while (_model.pickedItems <
                                                _model.bottomOutput!.length) {
                                              _model.addToCoachExercisesPicker(
                                                  _model.bottomOutput![
                                                      _model.pickedItems]);
                                              setState(() {});
                                              _model.pickedItems =
                                                  _model.pickedItems + 1;
                                              setState(() {});
                                            }
                                          } else {
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }

                                          if (shouldSetState) setState(() {});
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .white8,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 21.0, 0.0, 21.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    FFIcons.kplus2,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Выбрать упражнения',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'NTSomic',
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.37,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
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
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 50.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.coachTrainingsOutput =
                          await CoachTrainingsTable().insert({
                        'name': widget.name,
                        'rl_coach': currentUserUid,
                        'difficulty': widget.difficulty,
                      });
                      while (
                          _model.index < _model.coachExercisesPicker.length) {
                        await CoachTrainingsExercisesTable().insert({
                          'name':
                              _model.coachExercisesPicker[_model.index].name,
                          'rl_coach': currentUserUid,
                          'rl_exercises': _model
                              .coachExercisesPicker[_model.index].rlExercises,
                          'rl_coach_trainings': _model.coachTrainingsOutput?.id,
                        });
                        _model.index = _model.index + 1;
                        setState(() {});
                      }
                      _model.index = 0;
                      setState(() {});

                      context.goNamed('TrainingTemplates');

                      setState(() {});
                    },
                    text: 'Создать шаблон тренировки',
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
