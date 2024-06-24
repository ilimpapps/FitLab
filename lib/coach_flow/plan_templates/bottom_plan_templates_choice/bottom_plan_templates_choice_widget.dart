import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/coach_flow/plan_templates/template_trainings_item/template_trainings_item_widget.dart';
import '/components/back/back_widget.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/components/custom_picker/custom_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'bottom_plan_templates_choice_model.dart';
export 'bottom_plan_templates_choice_model.dart';

class BottomPlanTemplatesChoiceWidget extends StatefulWidget {
  const BottomPlanTemplatesChoiceWidget({
    super.key,
    required this.rlUsers,
    this.usersName,
    this.usersSurname,
  });

  final String? rlUsers;
  final String? usersName;
  final String? usersSurname;

  @override
  State<BottomPlanTemplatesChoiceWidget> createState() =>
      _BottomPlanTemplatesChoiceWidgetState();
}

class _BottomPlanTemplatesChoiceWidgetState
    extends State<BottomPlanTemplatesChoiceWidget> {
  late BottomPlanTemplatesChoiceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomPlanTemplatesChoiceModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dateTime = functions.dateTimeToDate(getCurrentTimestamp);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ViewTemplatesTrainingsPlansRow>>(
      future: ViewTemplatesTrainingsPlansTable().queryRows(
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
        List<ViewTemplatesTrainingsPlansRow>
            viewTemplatesTrainingsPlansViewTemplatesTrainingsPlansRowList =
            snapshot.data!;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
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
                            Navigator.pop(context);
                          },
                          child: wrapWithModel(
                            model: _model.backModel,
                            updateCallback: () => setState(() {}),
                            child: const BackWidget(),
                          ),
                        ),
                        Container(
                          width: 56.0,
                          height: 56.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
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
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 6.0, 0.0),
                        child: Text(
                          'Выберите шаблон',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'NTSomic',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                    lineHeight: 1.25,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.filter = 'Мои шаблоны';
                              setState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.choiceChipModel1,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: ChoiceChipWidget(
                                text: 'Мои шаблоны',
                                isPicked: _model.filter == 'Мои шаблоны',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.filter = 'Все шаблоны';
                              setState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.choiceChipModel2,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: ChoiceChipWidget(
                                text: 'Все шаблоны',
                                isPicked: _model.filter == 'Все шаблоны',
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet<bool>(
                              context: context,
                              builder: (context) {
                                final datePickedCupertinoTheme =
                                    CupertinoTheme.of(context);
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  child: CupertinoTheme(
                                    data: datePickedCupertinoTheme.copyWith(
                                      textTheme: datePickedCupertinoTheme
                                          .textTheme
                                          .copyWith(
                                        dateTimePickerTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'NTSomic',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                      ),
                                    ),
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      minimumDate: getCurrentTimestamp,
                                      initialDateTime: getCurrentTimestamp,
                                      maximumDate: DateTime(2050),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      use24hFormat: false,
                                      onDateTimeChanged: (newDateTime) =>
                                          safeSetState(() {
                                        _model.datePicked = newDateTime;
                                      }),
                                    ),
                                  ),
                                );
                              });
                          if (_model.datePicked != null) {
                            _model.dateTime = _model.datePicked;
                            setState(() {});
                          }
                        },
                        child: wrapWithModel(
                          model: _model.customPickerModel,
                          updateCallback: () => setState(() {}),
                          child: CustomPickerWidget(
                            label: 'Дата окончания',
                            text: valueOrDefault<String>(
                              dateTimeFormat(
                                'dd.MM.yy',
                                _model.dateTime,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              'null',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final childViewTemplateTrainings =
                                viewTemplatesTrainingsPlansViewTemplatesTrainingsPlansRowList
                                    .where((e) => _model.filter == 'Мои шаблоны'
                                        ? (e.rlCoach == currentUserUid)
                                        : true)
                                    .toList();
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    childViewTemplateTrainings.length,
                                    (childViewTemplateTrainingsIndex) {
                                  final childViewTemplateTrainingsItem =
                                      childViewTemplateTrainings[
                                          childViewTemplateTrainingsIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.viewTemplatesTrainingsPlans =
                                          childViewTemplateTrainingsItem;
                                      setState(() {});
                                    },
                                    child: TemplateTrainingsItemWidget(
                                      key: Key(
                                          'Key6mz_${childViewTemplateTrainingsIndex}_of_${childViewTemplateTrainings.length}'),
                                      isChoice:
                                          childViewTemplateTrainingsItem.id ==
                                              _model.viewTemplatesTrainingsPlans
                                                  ?.id,
                                      viewTemplatesTrainingsPlans:
                                          childViewTemplateTrainingsItem,
                                    ),
                                  );
                                }).divide(const SizedBox(height: 8.0)),
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
                    onPressed: ((_model.dateTime == null) ||
                            (_model.viewTemplatesTrainingsPlans == null))
                        ? null
                        : () async {
                            context.pushNamed(
                              'PlanToUserAdd2',
                              queryParameters: {
                                'usersName': serializeParam(
                                  widget.usersName,
                                  ParamType.String,
                                ),
                                'usersSurname': serializeParam(
                                  widget.usersSurname,
                                  ParamType.String,
                                ),
                                'rlUsers': serializeParam(
                                  widget.rlUsers,
                                  ParamType.String,
                                ),
                                'endDate': serializeParam(
                                  _model.dateTime,
                                  ParamType.DateTime,
                                ),
                                'viewTemplatesTrainingsPlans': serializeParam(
                                  _model.viewTemplatesTrainingsPlans,
                                  ParamType.SupabaseRow,
                                ),
                              }.withoutNulls,
                            );
                          },
                    text: 'Применить',
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
    );
  }
}
