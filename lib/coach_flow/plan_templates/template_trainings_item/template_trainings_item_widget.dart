import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'template_trainings_item_model.dart';
export 'template_trainings_item_model.dart';

class TemplateTrainingsItemWidget extends StatefulWidget {
  const TemplateTrainingsItemWidget({
    super.key,
    required this.viewTemplatesTrainingsPlans,
    bool? isChoice,
  }) : isChoice = isChoice ?? false;

  final ViewTemplatesTrainingsPlansRow? viewTemplatesTrainingsPlans;
  final bool isChoice;

  @override
  State<TemplateTrainingsItemWidget> createState() =>
      _TemplateTrainingsItemWidgetState();
}

class _TemplateTrainingsItemWidgetState
    extends State<TemplateTrainingsItemWidget> {
  late TemplateTrainingsItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemplateTrainingsItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).white8,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    valueOrDefault<String>(
                      widget.viewTemplatesTrainingsPlans?.name,
                      'null',
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'NTSomic',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                          lineHeight: 1.1,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      if (widget.isChoice) {
                        return Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).divider,
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              FFIcons.kcheck,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 16.0,
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      }
                    },
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
                    FFIcons.kdumbbell,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: Text(
                      '${valueOrDefault<String>(
                        widget.viewTemplatesTrainingsPlans?.weekdayCount
                            ?.toString(),
                        '0',
                      )} в неделю',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'NTSomic',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.28,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
