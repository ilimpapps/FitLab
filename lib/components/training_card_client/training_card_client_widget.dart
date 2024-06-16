import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'training_card_client_model.dart';
export 'training_card_client_model.dart';

class TrainingCardClientWidget extends StatefulWidget {
  const TrainingCardClientWidget({
    super.key,
    required this.viewUsersTrainingsRow,
    bool? isCurrentDate,
    required this.dateTime,
  }) : isCurrentDate = isCurrentDate ?? false;

  final ViewUsersTrainingsRow? viewUsersTrainingsRow;
  final bool isCurrentDate;
  final DateTime? dateTime;

  @override
  State<TrainingCardClientWidget> createState() =>
      _TrainingCardClientWidgetState();
}

class _TrainingCardClientWidgetState extends State<TrainingCardClientWidget> {
  late TrainingCardClientModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingCardClientModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.isCurrentDate) {
          context.pushNamed(
            'Training',
            queryParameters: {
              'rlUsersTrainings': serializeParam(
                widget.viewUsersTrainingsRow?.id,
                ParamType.int,
              ),
              'dateTime': serializeParam(
                widget.dateTime,
                ParamType.DateTime,
              ),
              'isCoachView': serializeParam(
                false,
                ParamType.bool,
              ),
            }.withoutNulls,
          );
        } else {
          return;
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.isCurrentDate
              ? FlutterFlowTheme.of(context).primary
              : FlutterFlowTheme.of(context).white8,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.viewUsersTrainingsRow?.name,
                          'null',
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'NTSomic',
                              color: widget.isCurrentDate
                                  ? FlutterFlowTheme.of(context)
                                      .primaryBackground
                                  : FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                              lineHeight: 1.37,
                            ),
                      ),
                    ),
                  ),
                  if (!widget.isCurrentDate)
                    Icon(
                      FFIcons.kright4,
                      color: FlutterFlowTheme.of(context).white40,
                      size: 24.0,
                    ),
                  if (widget.isCurrentDate)
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 8.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Начать',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'NTSomic',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.28,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                FFIcons.kright4,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      FFIcons.ktimeCircle,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 24.0,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        '1.5 часа',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'NTSomic',
                              color: widget.isCurrentDate
                                  ? FlutterFlowTheme.of(context)
                                      .primaryBackground
                                  : FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                              lineHeight: 1.28,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.network(
                          valueOrDefault<String>(
                            widget.viewUsersTrainingsRow?.coachPhotoUrl,
                            'null',
                          ),
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.viewUsersTrainingsRow?.coachName,
                            'null',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'NTSomic',
                                    color: widget.isCurrentDate
                                        ? FlutterFlowTheme.of(context)
                                            .primaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.28,
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
    );
  }
}
