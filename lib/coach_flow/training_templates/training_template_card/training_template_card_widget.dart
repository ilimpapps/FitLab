import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'training_template_card_model.dart';
export 'training_template_card_model.dart';

class TrainingTemplateCardWidget extends StatefulWidget {
  const TrainingTemplateCardWidget({
    super.key,
    required this.viewCoachTrainings,
  });

  final ViewCoachTrainingsRow? viewCoachTrainings;

  @override
  State<TrainingTemplateCardWidget> createState() =>
      _TrainingTemplateCardWidgetState();
}

class _TrainingTemplateCardWidgetState
    extends State<TrainingTemplateCardWidget> {
  late TrainingTemplateCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingTemplateCardModel());
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
                    valueOrDefault<String>(
                      widget.viewCoachTrainings?.name,
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
                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: Text(
                      functions.getExerciseWord(
                          widget.viewCoachTrainings!.exercises.length),
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
