import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/components/chart/chart_widget.dart';
import '/components/choice4_widget.dart';
import '/components/dialog_measurement_delete/dialog_measurement_delete_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/measurements/bottom_my_progress_add/bottom_my_progress_add_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'my_progress_chart_model.dart';
export 'my_progress_chart_model.dart';

class MyProgressChartWidget extends StatefulWidget {
  const MyProgressChartWidget({
    super.key,
    required this.rlUsersMeasurements,
  });

  final int? rlUsersMeasurements;

  @override
  State<MyProgressChartWidget> createState() => _MyProgressChartWidgetState();
}

class _MyProgressChartWidgetState extends State<MyProgressChartWidget> {
  late MyProgressChartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyProgressChartModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.queryUsersMeasurements = await UsersMeasurementsTable().queryRows(
        queryFn: (q) => q.eq(
          'id',
          widget.rlUsersMeasurements,
        ),
      );
      _model.measurementsTemplateJson =
          _model.queryUsersMeasurements?.last.measurements;
      _model.measurementsTemplate = MeasurementsTemplateStruct.maybeFromMap(
          _model.measurementsTemplateJson);
      setState(() {});
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
        body: Stack(
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
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
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
                              context.safePop();
                            },
                            child: wrapWithModel(
                              model: _model.backModel,
                              updateCallback: () => setState(() {}),
                              child: const BackWidget(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  _model.queryUsersMeasurements?.first.name,
                                  'null',
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'NTSomic',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                var shouldSetState = false;
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: DialogMeasurementDeleteWidget(
                                          measurement: valueOrDefault<String>(
                                            _model.queryUsersMeasurements?.first
                                                .name,
                                            'null',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(
                                    () => _model.deleteOutput = value));

                                shouldSetState = true;
                                if (_model.deleteOutput!) {
                                  await UsersMeasurementsTable().delete(
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      widget.rlUsersMeasurements,
                                    ),
                                  );
                                  context.safePop();
                                } else {
                                  if (shouldSetState) setState(() {});
                                  return;
                                }

                                if (shouldSetState) setState(() {});
                              },
                              child: Container(
                                width: 56.0,
                                height: 56.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).error,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    FFIcons.ktrashCan,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 8.0, 20.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              wrapWithModel(
                                model: _model.choice4Model,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: const Choice4Widget(
                                  choice1: 'Неделя',
                                  choice2: 'Месяц',
                                  choice3: 'Полгода',
                                  choice4: 'Год',
                                  initialChoice: 'Неделя',
                                ),
                              ),
                              if (_model.measurementsTemplate?.measurements !=
                                      null &&
                                  (_model.measurementsTemplate?.measurements)!
                                      .isNotEmpty)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.chartModel,
                                    updateCallback: () => setState(() {}),
                                    child: ChartWidget(
                                      axisX: _model
                                          .measurementsTemplate?.measurements
                                          .where((e) =>
                                              functions.stringToDateTime(
                                                  e.createdAt)! >
                                              functions.dateTimeMiusDay(
                                                  getCurrentTimestamp, () {
                                                if (_model.choice4Model
                                                        .choicePicked ==
                                                    'Неделя') {
                                                  return 7;
                                                } else if (_model.choice4Model
                                                        .choicePicked ==
                                                    'Месяц') {
                                                  return 30;
                                                } else if (_model.choice4Model
                                                        .choicePicked ==
                                                    'Полгода') {
                                                  return 180;
                                                } else if (_model.choice4Model
                                                        .choicePicked ==
                                                    'Год') {
                                                  return 365;
                                                } else {
                                                  return 7;
                                                }
                                              }())!)
                                          .toList()
                                          .map((e) => e.createdAt)
                                          .toList(),
                                      axisY: _model
                                          .measurementsTemplate?.measurements
                                          .where((e) =>
                                              functions.stringToDateTime(
                                                  e.createdAt)! >
                                              functions.dateTimeMiusDay(
                                                  getCurrentTimestamp, () {
                                                if (_model.choice4Model
                                                        .choicePicked ==
                                                    'Неделя') {
                                                  return 7;
                                                } else if (_model.choice4Model
                                                        .choicePicked ==
                                                    'Месяц') {
                                                  return 30;
                                                } else if (_model.choice4Model
                                                        .choicePicked ==
                                                    'Полгода') {
                                                  return 180;
                                                } else if (_model.choice4Model
                                                        .choicePicked ==
                                                    'Год') {
                                                  return 365;
                                                } else {
                                                  return 7;
                                                }
                                              }())!)
                                          .toList()
                                          .map((e) => e.value)
                                          .toList(),
                                    ),
                                  ),
                                ),
                            ]
                                .addToStart(const SizedBox(height: 8.0))
                                .addToEnd(const SizedBox(height: 50.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 50.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    var shouldSetState = false;
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => _model.unfocusNode.canRequestFocus
                              ? FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode)
                              : FocusScope.of(context).unfocus(),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: BottomMyProgressAddWidget(
                              usersMeasurementsRow:
                                  _model.queryUsersMeasurements!.last,
                            ),
                          ),
                        );
                      },
                    ).then((value) =>
                        safeSetState(() => _model.bottomOutput = value));

                    shouldSetState = true;
                    if (_model.bottomOutput!) {
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        'MyProgressChart',
                        queryParameters: {
                          'rlUsersMeasurements': serializeParam(
                            widget.rlUsersMeasurements,
                            ParamType.int,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      if (shouldSetState) setState(() {});
                      return;
                    }

                    if (shouldSetState) setState(() {});
                  },
                  text: 'Добавить значение',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 52.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'NTSomic',
                          color: FlutterFlowTheme.of(context).primaryBackground,
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
    );
  }
}
