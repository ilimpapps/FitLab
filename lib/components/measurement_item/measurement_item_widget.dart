import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/measurements/bottom_my_progress_add/bottom_my_progress_add_widget.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'measurement_item_model.dart';
export 'measurement_item_model.dart';

class MeasurementItemWidget extends StatefulWidget {
  const MeasurementItemWidget({
    super.key,
    required this.usersMeasurementsRow,
    required this.action,
  });

  final UsersMeasurementsRow? usersMeasurementsRow;
  final Future Function()? action;

  @override
  State<MeasurementItemWidget> createState() => _MeasurementItemWidgetState();
}

class _MeasurementItemWidgetState extends State<MeasurementItemWidget> {
  late MeasurementItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeasurementItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'MyProgressChart',
          queryParameters: {
            'rlUsersMeasurements': serializeParam(
              widget.usersMeasurementsRow?.id,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          width: double.infinity,
          height: 80.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).white8,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: const Color(0x1FFFFFFF),
              width: 1.0,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.usersMeasurementsRow?.name,
                                  'null',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'NTSomic',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            'Прошлое значение: ${valueOrDefault<String>(
                              MeasurementsTemplateStruct.maybeFromMap(widget
                                              .usersMeasurementsRow!
                                              .measurements!)!
                                          .measurements
                                          .length >
                                      1
                                  ? valueOrDefault<String>(
                                      (MeasurementsTemplateStruct.maybeFromMap(
                                                  widget.usersMeasurementsRow
                                                      ?.measurements)
                                              ?.measurements[MeasurementsTemplateStruct
                                                          .maybeFromMap(widget
                                                              .usersMeasurementsRow!
                                                              .measurements!)!
                                                      .measurements
                                                      .length -
                                                  2 ??
                                              0])
                                          ?.value
                                          .toString(),
                                      'null',
                                    )
                                  : ' -/-',
                              ' -/-',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'NTSomic',
                                  color: FlutterFlowTheme.of(context).white40,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: valueOrDefault<String>(
                              MeasurementsTemplateStruct.maybeFromMap(
                                      widget.usersMeasurementsRow?.measurements)
                                  ?.measurements
                                  .last
                                  .value
                                  .toString(),
                              'null',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'NTSomic',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                          TextSpan(
                            text: ' ',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'NTSomic',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              widget.usersMeasurementsRow?.unit,
                              'null',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'NTSomic',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'NTSomic',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              if (!FFAppState().isCoach)
                Align(
                  alignment: const AlignmentDirectional(1.2, -9.0),
                  child: Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              if (!FFAppState().isCoach)
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      FFIcons.kplus2,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
                    ),
                  ),
                ),
              if (!FFAppState().isCoach)
                Align(
                  alignment: const AlignmentDirectional(1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: BottomMyProgressAddWidget(
                              usersMeasurementsRow:
                                  widget.usersMeasurementsRow!,
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));

                      await widget.action?.call();
                    },
                    child: Container(
                      width: 60.0,
                      height: double.infinity,
                      decoration: const BoxDecoration(),
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
