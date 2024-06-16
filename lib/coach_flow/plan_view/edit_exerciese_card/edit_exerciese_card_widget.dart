import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'edit_exerciese_card_model.dart';
export 'edit_exerciese_card_model.dart';

class EditExercieseCardWidget extends StatefulWidget {
  const EditExercieseCardWidget({
    super.key,
    required this.coachExercisePicker,
    bool? isValidate,
  }) : isValidate = isValidate ?? false;

  final CoachExercisesPickerStruct? coachExercisePicker;
  final bool isValidate;

  @override
  State<EditExercieseCardWidget> createState() =>
      _EditExercieseCardWidgetState();
}

class _EditExercieseCardWidgetState extends State<EditExercieseCardWidget> {
  late EditExercieseCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditExercieseCardModel());
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
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.coachExercisePicker?.name,
                      'null',
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'NTSomic',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                          lineHeight: 1.1,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                    child: Text(
                      'Настройте упражнение',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'NTSomic',
                            color: widget.isValidate &&
                                    !(widget.coachExercisePicker!.sets.setsPlan
                                        .isNotEmpty)
                                ? FlutterFlowTheme.of(context).error
                                : FlutterFlowTheme.of(context).secondary,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.28,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
              child: Icon(
                FFIcons.kedit1,
                color: FlutterFlowTheme.of(context).secondary,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
