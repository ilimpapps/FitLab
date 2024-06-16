import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'training_templates_add1_model.dart';
export 'training_templates_add1_model.dart';

class TrainingTemplatesAdd1Widget extends StatefulWidget {
  const TrainingTemplatesAdd1Widget({super.key});

  @override
  State<TrainingTemplatesAdd1Widget> createState() =>
      _TrainingTemplatesAdd1WidgetState();
}

class _TrainingTemplatesAdd1WidgetState
    extends State<TrainingTemplatesAdd1Widget> with TickerProviderStateMixin {
  late TrainingTemplatesAdd1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingTemplatesAdd1Model());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.nameInputTextController ??= TextEditingController();
    _model.nameInputFocusNode ??= FocusNode();

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
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/bg.png',
              ).image,
            ),
          ),
          child: Padding(
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                  child: Text(
                    'Шаг 1 из 2',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'NTSomic',
                          color: FlutterFlowTheme.of(context).white40,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                          lineHeight: 1.37,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'Создать шаблон тренировки',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'NTSomic',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                          lineHeight: 1.25,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.nameInputTextController,
                        focusNode: _model.nameInputFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.nameInputTextController',
                          const Duration(milliseconds: 200),
                          () => setState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Название тренировки',
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
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).accent1,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 20.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'NTSomic',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                              lineHeight: 1.37,
                            ),
                        validator: _model.nameInputTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.difficultyDropdownValueController ??=
                        FormFieldController<String>(null),
                    options: const ['Начинающий', 'Средний', 'Профессионал'],
                    onChanged: (val) =>
                        setState(() => _model.difficultyDropdownValue = val),
                    width: double.infinity,
                    height: 60.0,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'NTSomic',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    hintText: 'Сложность',
                    icon: Icon(
                      FFIcons.kright5,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).accent1,
                    borderWidth: 1.0,
                    borderRadius: 16.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
                    labelText: '',
                    labelTextStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'NTSomic',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
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
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }

                      context.pushNamed(
                        'TrainingTemplatesAdd2',
                        queryParameters: {
                          'name': serializeParam(
                            _model.nameInputTextController.text,
                            ParamType.String,
                          ),
                          'difficulty': serializeParam(
                            _model.difficultyDropdownValue,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: 'Далее',
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
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
          ),
        ),
      ),
    );
  }
}
