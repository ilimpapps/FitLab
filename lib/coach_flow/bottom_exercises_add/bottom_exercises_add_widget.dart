import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'bottom_exercises_add_model.dart';
export 'bottom_exercises_add_model.dart';

class BottomExercisesAddWidget extends StatefulWidget {
  const BottomExercisesAddWidget({super.key});

  @override
  State<BottomExercisesAddWidget> createState() =>
      _BottomExercisesAddWidgetState();
}

class _BottomExercisesAddWidgetState extends State<BottomExercisesAddWidget> {
  late BottomExercisesAddModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomExercisesAddModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ExercisesRow>>(
      future: ExercisesTable().queryRows(
        queryFn: (q) => q,
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
        List<ExercisesRow> queryExercisesExercisesRowList = snapshot.data!;
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
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: wrapWithModel(
                              model: _model.backModel,
                              updateCallback: () => setState(() {}),
                              child: const BackWidget(),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 60.0, 0.0),
                                child: AutoSizeText(
                                  'Добавить упражнения',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'NTSomic',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                        lineHeight: 1.1,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          const Duration(milliseconds: 50),
                          () => setState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Найти упражнение',
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'NTSomic',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                                lineHeight: 1.28,
                              ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'NTSomic',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 14.0, 36.0, 14.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'NTSomic',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                              lineHeight: 1.37,
                            ),
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final childMuscle = FFAppConstants.muscle.toList();
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(childMuscle.length,
                                      (childMuscleIndex) {
                                final childMuscleItem =
                                    childMuscle[childMuscleIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.muscle = childMuscleItem;
                                    setState(() {});
                                  },
                                  child: ChoiceChipWidget(
                                    key: Key(
                                        'Keykh9_${childMuscleIndex}_of_${childMuscle.length}'),
                                    text: childMuscleItem,
                                    isPicked: _model.muscle == childMuscleItem,
                                  ),
                                );
                              })
                                  .divide(const SizedBox(width: 8.0))
                                  .addToStart(const SizedBox(width: 20.0))
                                  .addToEnd(const SizedBox(width: 20.0)),
                            ),
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 20.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final exercieses = queryExercisesExercisesRowList
                                .where((e) =>
                                    valueOrDefault<bool>(
                                      e.muscle.contains(_model.muscle),
                                      false,
                                    ) &&
                                    functions.searchStringInList(
                                        e.name!, _model.textController.text))
                                .toList();
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(exercieses.length,
                                    (exerciesesIndex) {
                                  final exerciesesItem =
                                      exercieses[exerciesesIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (_model.coachExercisesPicker
                                          .where((e) =>
                                              e.rlExercises ==
                                              exerciesesItem.id)
                                          .toList()
                                          .isNotEmpty) {
                                        _model.removeFromCoachExercisesPicker(
                                            CoachExercisesPickerStruct(
                                          rlExercises: exerciesesItem.id,
                                          name: exerciesesItem.name,
                                        ));
                                        setState(() {});
                                      } else {
                                        _model.addToCoachExercisesPicker(
                                            CoachExercisesPickerStruct(
                                          rlExercises: exerciesesItem.id,
                                          name: exerciesesItem.name,
                                        ));
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
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
                                                        exerciesesItem.name,
                                                        'null',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'NTSomic',
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.37,
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
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 8.0,
                                                            height: 8.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: () {
                                                                if (exerciesesItem
                                                                        .difficulty ==
                                                                    'Начинающий') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .success;
                                                                } else if (exerciesesItem
                                                                        .difficulty ==
                                                                    'Средний') {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .orange;
                                                                } else {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .error;
                                                                }
                                                              }(),
                                                              shape: BoxShape
                                                                  .circle,
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
                                                              valueOrDefault<
                                                                  String>(
                                                                exerciesesItem
                                                                    .difficulty,
                                                                'null',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                    lineHeight:
                                                                        1.28,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  if (_model
                                                      .coachExercisesPicker
                                                      .where((e) =>
                                                          e.rlExercises ==
                                                          exerciesesItem.id)
                                                      .toList()
                                                      .isNotEmpty) {
                                                    return Container(
                                                      width: 37.0,
                                                      height: 37.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        FFIcons.kcheck,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 24.0,
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      width: 37.0,
                                                      height: 37.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white8,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .divider,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .divider,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).addToEnd(const SizedBox(height: 130.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_model.coachExercisesPicker.isNotEmpty)
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        20.0,
                        0.0,
                        20.0,
                        valueOrDefault<double>(
                          (isWeb
                                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                                  : _isKeyboardVisible)
                              ? 8.0
                              : 50.0,
                          0.0,
                        )),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context, _model.coachExercisesPicker);
                      },
                      text:
                          'Добавить  ${functions.getExerciseWord(_model.coachExercisesPicker.length)}',
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
        );
      },
    );
  }
}
