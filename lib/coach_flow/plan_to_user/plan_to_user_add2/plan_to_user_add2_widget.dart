import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/coach_flow/bottom_exercises_add/bottom_exercises_add_widget.dart';
import '/coach_flow/plan_to_user/bottom_sets_add/bottom_sets_add_widget.dart';
import '/coach_flow/plan_view/edit_exerciese_card/edit_exerciese_card_widget.dart';
import '/components/back/back_widget.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/components/plan_to_user_add2_dropdown_widget.dart';
import '/components/plan_to_user_add2_name_input_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'plan_to_user_add2_model.dart';
export 'plan_to_user_add2_model.dart';

class PlanToUserAdd2Widget extends StatefulWidget {
  const PlanToUserAdd2Widget({
    super.key,
    required this.trainingsCount,
    required this.usersName,
    required this.usersSurname,
    required this.rlUsers,
    required this.endDate,
  });

  final int? trainingsCount;
  final String? usersName;
  final String? usersSurname;
  final String? rlUsers;
  final DateTime? endDate;

  @override
  State<PlanToUserAdd2Widget> createState() => _PlanToUserAdd2WidgetState();
}

class _PlanToUserAdd2WidgetState extends State<PlanToUserAdd2Widget>
    with TickerProviderStateMixin {
  late PlanToUserAdd2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanToUserAdd2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (_model.trainingIndex < widget.trainingsCount!) {
        _model.addToPlanToUserAdd(PlanToUserAddStruct(
          day: _model.trainingIndex + 1,
          weekday: 1,
        ));
        setState(() {});
        _model.trainingIndex = _model.trainingIndex + 1;
        setState(() {});
      }
      _model.trainingIndex = 0;
      setState(() {});
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

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

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
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
                    Column(
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
                                  color: FlutterFlowTheme.of(context).white40,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                  lineHeight: 1.37,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'Создайте план для пользователя!',
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
                          child: AutoSizeText(
                            '${valueOrDefault<String>(
                              widget.usersName,
                              'null',
                            )} ${valueOrDefault<String>(
                              widget.usersSurname,
                              'null',
                            )} • до ${dateTimeFormat(
                              'MMMMEEEEd',
                              widget.endDate,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                            maxLines: 1,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'NTSomic',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.37,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final intList = functions
                                      .intList(widget.trainingsCount)
                                      ?.toList() ??
                                  [];
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(intList.length,
                                      (intListIndex) {
                                    final intListItem = intList[intListIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.dayPicked = intListItem;
                                        setState(() {});
                                      },
                                      child: ChoiceChipWidget(
                                        key: Key(
                                            'Keyucf_${intListIndex}_of_${intList.length}'),
                                        text: 'День ${valueOrDefault<String>(
                                          (intListIndex + 1).toString(),
                                          '0',
                                        )}',
                                        isPicked:
                                            intListItem == _model.dayPicked,
                                      ),
                                    );
                                  }).divide(const SizedBox(width: 8.0)),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final childPlanToUserAdd =
                                _model.planToUserAdd.toList();
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(childPlanToUserAdd.length,
                                        (childPlanToUserAddIndex) {
                                  final childPlanToUserAddItem =
                                      childPlanToUserAdd[
                                          childPlanToUserAddIndex];
                                  return Visibility(
                                    visible: _model.dayPicked ==
                                        childPlanToUserAddItem.day,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          wrapWithModel(
                                            model: _model
                                                .planToUserAdd2NameInputModels
                                                .getModel(
                                              childPlanToUserAddIndex
                                                  .toString(),
                                              childPlanToUserAddIndex,
                                            ),
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child:
                                                PlanToUserAdd2NameInputWidget(
                                              key: Key(
                                                'Key8r6_${childPlanToUserAddIndex.toString()}',
                                              ),
                                              action: () async {
                                                _model
                                                    .updatePlanToUserAddAtIndex(
                                                  childPlanToUserAddIndex,
                                                  (e) => e
                                                    ..name = _model
                                                        .planToUserAdd2NameInputModels
                                                        .getValueAtIndex(
                                                      childPlanToUserAddIndex,
                                                      (m) => m
                                                          .nameInputTextController
                                                          .text,
                                                    ),
                                                );
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .planToUserAdd2DropdownModels
                                                  .getModel(
                                                childPlanToUserAddIndex
                                                    .toString(),
                                                childPlanToUserAddIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child:
                                                  PlanToUserAdd2DropdownWidget(
                                                key: Key(
                                                  'Keyqow_${childPlanToUserAddIndex.toString()}',
                                                ),
                                                action: () async {
                                                  _model
                                                      .updatePlanToUserAddAtIndex(
                                                    childPlanToUserAddIndex,
                                                    (e) => e
                                                      ..weekday = _model
                                                          .planToUserAdd2DropdownModels
                                                          .getValueAtIndex(
                                                        childPlanToUserAddIndex,
                                                        (m) => m.weekDayValue,
                                                      ),
                                                  );
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 0.0),
                                            child: Text(
                                              'План тренировки',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'NTSomic',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final childExercisesPicker =
                                                    childPlanToUserAddItem
                                                        .coachExercisePicker
                                                        .toList();
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      childExercisesPicker
                                                          .length,
                                                      (childExercisesPickerIndex) {
                                                    final childExercisesPickerItem =
                                                        childExercisesPicker[
                                                            childExercisesPickerIndex];
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
                                                        var shouldSetState =
                                                            false;
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    BottomSetsAddWidget(
                                                                  exerciseName:
                                                                      childExercisesPickerItem
                                                                          .name,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(() =>
                                                                _model.bottomSetsOutput =
                                                                    value));

                                                        shouldSetState = true;
                                                        if (_model
                                                                .bottomSetsOutput !=
                                                            null) {
                                                          _model
                                                              .updatePlanToUserAddAtIndex(
                                                            childPlanToUserAddIndex,
                                                            (e) => e
                                                              ..updateCoachExercisePicker(
                                                                (e) => e[
                                                                    childExercisesPickerIndex]
                                                                  ..sets = _model
                                                                      .bottomSetsOutput,
                                                              ),
                                                          );
                                                          setState(() {});
                                                        } else {
                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                          return;
                                                        }

                                                        if (shouldSetState) {
                                                          setState(() {});
                                                        }
                                                      },
                                                      child:
                                                          EditExercieseCardWidget(
                                                        key: Key(
                                                            'Keyxcm_${childExercisesPickerIndex}_of_${childExercisesPicker.length}'),
                                                        isValidate:
                                                            _model.isValidate,
                                                        coachExercisePicker:
                                                            childExercisesPickerItem,
                                                      ),
                                                    );
                                                  }).divide(
                                                      const SizedBox(height: 8.0)),
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var shouldSetState = false;
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
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            const BottomExercisesAddWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => safeSetState(
                                                    () => _model
                                                            .bottomExerciseOutput =
                                                        value));

                                                shouldSetState = true;
                                                if (_model.bottomExerciseOutput !=
                                                        null &&
                                                    (_model.bottomExerciseOutput)!
                                                        .isNotEmpty) {
                                                  _model
                                                      .updatePlanToUserAddAtIndex(
                                                    childPlanToUserAddIndex,
                                                    (e) => e
                                                      ..coachExercisePicker = functions
                                                          .coachExercisesPickerMerge(
                                                              childPlanToUserAddItem
                                                                  .coachExercisePicker
                                                                  .toList(),
                                                              _model
                                                                  .bottomExerciseOutput
                                                                  ?.toList())!
                                                          .toList(),
                                                  );
                                                  setState(() {});
                                                } else {
                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                }

                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white8,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 21.0,
                                                                0.0, 21.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          FFIcons.kplus2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
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
                                                            'Добавить упражнение',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'NTSomic',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.37,
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
                                        ].addToEnd(const SizedBox(height: 130.0)),
                                      ),
                                    ),
                                  );
                                }),
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
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 50.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var shouldSetState = false;
                        _model.isValidate = true;
                        setState(() {});
                        if (_model.planToUserAdd
                                .where((e) =>
                                    (e.day != null) &&
                                    (e.weekday != null) &&
                                    (e.coachExercisePicker
                                        .where((e) =>
                                            (e.rlExercises != null) &&
                                            (e.name != '') &&
                                            (e.sets.setsPlan
                                                .where((e) =>
                                                    (e.reps != null) &&
                                                    (e.reps != 0) &&
                                                    (e.weightKg != null) &&
                                                    (e.weightKg != 0.0))
                                                .toList()
                                                .isNotEmpty))
                                        .toList()
                                        .isNotEmpty) &&
                                    (e.name != ''))
                                .toList()
                                .length ==
                            widget.trainingsCount) {
                          while (_model.trainingIndex <
                              _model.planToUserAdd.length) {
                            _model.usersTrainingsOutput =
                                await UsersTrainingsTable().insert({
                              'rl_users': widget.rlUsers,
                              'rl_coach': currentUserUid,
                              'weekday': _model
                                  .planToUserAdd[_model.trainingIndex].weekday,
                              'name': _model
                                  .planToUserAdd[_model.trainingIndex].name,
                              'end_date':
                                  supaSerialize<DateTime>(widget.endDate),
                            });
                            shouldSetState = true;
                            while (_model.exerciseIndex <
                                _model.planToUserAdd[_model.trainingIndex]
                                    .coachExercisePicker.length) {
                              await UsersTrainingsExercisesTable().insert({
                                'name': _model
                                    .planToUserAdd[_model.trainingIndex]
                                    .coachExercisePicker[_model.exerciseIndex]
                                    .name,
                                'rl_users': widget.rlUsers,
                                'rl_coach': currentUserUid,
                                'rl_users_trainings':
                                    _model.usersTrainingsOutput?.id,
                                'rl_exercises': _model
                                    .planToUserAdd[_model.trainingIndex]
                                    .coachExercisePicker[_model.exerciseIndex]
                                    .rlExercises,
                                'sets_plan': _model
                                    .planToUserAdd[_model.trainingIndex]
                                    .coachExercisePicker[_model.exerciseIndex]
                                    .sets
                                    .toMap(),
                              });
                              _model.exerciseIndex = _model.exerciseIndex + 1;
                              setState(() {});
                            }
                            _model.trainingIndex = _model.trainingIndex + 1;
                            _model.exerciseIndex = 0;
                            setState(() {});
                          }
                          _model.trainingIndex = 0;
                          _model.exerciseIndex = 0;
                          setState(() {});
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Заполните все значения!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                ),
                              ),
                              duration: const Duration(milliseconds: 2000),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          );
                          if (shouldSetState) setState(() {});
                          return;
                        }

                        context.goNamed('PlanToUser');

                        if (shouldSetState) setState(() {});
                      },
                      text: 'Сохранить',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 52.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).labelSmall.override(
                                  fontFamily: 'NTSomic',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
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
