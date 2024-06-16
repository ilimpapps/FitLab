import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/coach_flow/plan_templates/chose_training_template_card/chose_training_template_card_widget.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'bottom_chose_training_for_plan_model.dart';
export 'bottom_chose_training_for_plan_model.dart';

class BottomChoseTrainingForPlanWidget extends StatefulWidget {
  const BottomChoseTrainingForPlanWidget({
    super.key,
    String? picker,
  }) : picker = picker ?? 'Начинающий';

  final String picker;

  @override
  State<BottomChoseTrainingForPlanWidget> createState() =>
      _BottomChoseTrainingForPlanWidgetState();
}

class _BottomChoseTrainingForPlanWidgetState
    extends State<BottomChoseTrainingForPlanWidget> {
  late BottomChoseTrainingForPlanModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomChoseTrainingForPlanModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
      child: FutureBuilder<List<ViewCoachTrainingsRow>>(
        future: ViewCoachTrainingsTable().queryRows(
          queryFn: (q) => q.eq(
            'rl_coach',
            currentUserUid,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<ViewCoachTrainingsRow> containerViewCoachTrainingsRowList =
              snapshot.data!;
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Выбрать тренировку',
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
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).white8,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FFIcons.kclose3,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
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
                                  _model.filter = 'Начинающий';
                                  setState(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.choiceChipModel1,
                                  updateCallback: () => setState(() {}),
                                  child: const ChoiceChipWidget(
                                    text: 'Начинающий',
                                    isPicked: false,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.filter = 'Средний';
                                  setState(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.choiceChipModel2,
                                  updateCallback: () => setState(() {}),
                                  child: const ChoiceChipWidget(
                                    text: 'Средний',
                                    isPicked: false,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.filter = 'Профессионал';
                                  setState(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.choiceChipModel3,
                                  updateCallback: () => setState(() {}),
                                  child: const ChoiceChipWidget(
                                    text: 'Профессионал',
                                    isPicked: false,
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
                          child: Builder(
                            builder: (context) {
                              final viewCoachTrainings =
                                  containerViewCoachTrainingsRowList
                                      .where(
                                          (e) => e.difficulty == widget.picker)
                                      .toList();
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      List.generate(viewCoachTrainings.length,
                                              (viewCoachTrainingsIndex) {
                                    final viewCoachTrainingsItem =
                                        viewCoachTrainings[
                                            viewCoachTrainingsIndex];
                                    return ChoseTrainingTemplateCardWidget(
                                      key: Key(
                                          'Keyzk7_${viewCoachTrainingsIndex}_of_${viewCoachTrainings.length}'),
                                      viewCoachTrainings:
                                          viewCoachTrainingsItem,
                                    );
                                  })
                                          .divide(const SizedBox(height: 8.0))
                                          .addToEnd(const SizedBox(height: 130.0)),
                                ),
                              );
                            },
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
                      onPressed: false
                          ? null
                          : () {
                              print('Button pressed ...');
                            },
                      text: 'Добавить',
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
                        disabledColor: FlutterFlowTheme.of(context).divider,
                        disabledTextColor: FlutterFlowTheme.of(context).white40,
                      ),
                      showLoadingIndicator: false,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
