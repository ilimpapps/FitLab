import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'plan_template_card_model.dart';
export 'plan_template_card_model.dart';

class PlanTemplateCardWidget extends StatefulWidget {
  const PlanTemplateCardWidget({super.key});

  @override
  State<PlanTemplateCardWidget> createState() => _PlanTemplateCardWidgetState();
}

class _PlanTemplateCardWidgetState extends State<PlanTemplateCardWidget> {
  late PlanTemplateCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanTemplateCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 92.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).white8,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'Набор массы',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'NTSomic',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                          lineHeight: 1.1,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Icon(
                    FFIcons.kright4,
                    color: FlutterFlowTheme.of(context).white40,
                    size: 24.0,
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
                    child: Text(
                      ' в неделю',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'NTSomic',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.28,
                          ),
                    ),
                  ),
                  if (FFAppState().filterPlanTemplateGender != 'Женщины')
                    Icon(
                      FFIcons.kman,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  if (FFAppState().filterPlanTemplateGender != 'Мужчины')
                    Icon(
                      FFIcons.kwoman,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  Text(
                    valueOrDefault<String>(
                      () {
                        if (FFAppState().filterPlanTemplateGender ==
                            'Любой пол') {
                          return 'Любой пол';
                        } else if (FFAppState().filterPlanTemplateGender ==
                            'Женщины') {
                          return 'Женщины';
                        } else {
                          return 'Мужчины';
                        }
                      }(),
                      'null',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'NTSomic',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
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
