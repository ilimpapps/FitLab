import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'bottom_training_feedback_model.dart';
export 'bottom_training_feedback_model.dart';

class BottomTrainingFeedbackWidget extends StatefulWidget {
  const BottomTrainingFeedbackWidget({
    super.key,
    required this.rlPassedTrainings,
  });

  final int? rlPassedTrainings;

  @override
  State<BottomTrainingFeedbackWidget> createState() =>
      _BottomTrainingFeedbackWidgetState();
}

class _BottomTrainingFeedbackWidgetState
    extends State<BottomTrainingFeedbackWidget> {
  late BottomTrainingFeedbackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomTrainingFeedbackModel());

    _model.commentInputTextController ??= TextEditingController();
    _model.commentInputFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/muscle.webp',
                        width: 64.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Text(
                      'Отличная работа!',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'NTSomic',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.25,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      'Вы завершили все упражнения',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'NTSomic',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.37,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.75,
                      decoration: const BoxDecoration(
                        color: Color(0x15FFFFFF),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 32.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Поделись мнением',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'NTSomic',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.1,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).white8,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).divider,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 11.0, 16.0, 11.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Как прошла тренировка?',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'NTSomic',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.37,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: RatingBar.builder(
                                          onRatingUpdate: (newValue) =>
                                              setState(() =>
                                                  _model.trainingRatingValue =
                                                      newValue),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          direction: Axis.horizontal,
                                          initialRating: _model
                                              .trainingRatingValue ??= 0.0,
                                          unratedColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent3,
                                          itemCount: 5,
                                          itemSize: 40.0,
                                          glowColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).white8,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).divider,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 11.0, 16.0, 11.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Оцени свое состояние',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'NTSomic',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.37,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: RatingBar.builder(
                                          onRatingUpdate: (newValue) =>
                                              setState(() => _model
                                                  .stateRatingValue = newValue),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          direction: Axis.horizontal,
                                          initialRating:
                                              _model.stateRatingValue ??= 0.0,
                                          unratedColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent3,
                                          itemCount: 5,
                                          itemSize: 40.0,
                                          glowColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.commentInputTextController,
                                  focusNode: _model.commentInputFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.commentInputTextController',
                                    const Duration(milliseconds: 200),
                                    () => setState(() {}),
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Добавь свой комментарий',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'NTSomic',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.28,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'NTSomic',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.37,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .divider,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).white8,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 20.0, 16.0, 20.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'NTSomic',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                        lineHeight: 1.37,
                                      ),
                                  maxLines: 6,
                                  minLines: 1,
                                  validator: _model
                                      .commentInputTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 50.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await PassedTrainingsTable().update(
                                      data: {
                                        'rating':
                                            _model.trainingRatingValue?.round(),
                                        'user_feeling':
                                            _model.stateRatingValue?.round(),
                                        'training_comment': _model
                                            .commentInputTextController.text,
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        widget.rlPassedTrainings,
                                      ),
                                    );
                                    Navigator.pop(context);
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed('Home');
                                  },
                                  text: 'Отправить',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 52.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
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
                          ].addToEnd(const SizedBox(height: 50.0)),
                        ),
                      ),
                    ),
                  ),
                ].addToStart(const SizedBox(height: 48.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
