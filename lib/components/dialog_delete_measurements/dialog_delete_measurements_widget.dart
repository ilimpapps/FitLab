import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'dialog_delete_measurements_model.dart';
export 'dialog_delete_measurements_model.dart';

class DialogDeleteMeasurementsWidget extends StatefulWidget {
  const DialogDeleteMeasurementsWidget({
    super.key,
    required this.idPhoto,
  });

  final int? idPhoto;

  @override
  State<DialogDeleteMeasurementsWidget> createState() =>
      _DialogDeleteMeasurementsWidgetState();
}

class _DialogDeleteMeasurementsWidgetState
    extends State<DialogDeleteMeasurementsWidget> {
  late DialogDeleteMeasurementsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogDeleteMeasurementsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Хотите удалить замеры по весу?',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    fontFamily: 'NTSomic',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                    lineHeight: 1.37,
                  ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: Text(
                  'Вы больше не сможете увидеть ваши результаты',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'NTSomic',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                        lineHeight: 1.28,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).divider,
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await PhotoProgressTable().delete(
                  matchingRows: (rows) => rows.eq(
                    'id',
                    widget.idPhoto,
                  ),
                );
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      'Удалить',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'NTSomic',
                            color: FlutterFlowTheme.of(context).error,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.37,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).divider,
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
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      'Отмена',
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'NTSomic',
                            color: FlutterFlowTheme.of(context).primary,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.37,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
