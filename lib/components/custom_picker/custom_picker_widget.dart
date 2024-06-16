import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'custom_picker_model.dart';
export 'custom_picker_model.dart';

class CustomPickerWidget extends StatefulWidget {
  const CustomPickerWidget({
    super.key,
    this.label,
    this.text,
  });

  final String? label;
  final String? text;

  @override
  State<CustomPickerWidget> createState() => _CustomPickerWidgetState();
}

class _CustomPickerWidgetState extends State<CustomPickerWidget> {
  late CustomPickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomPickerModel());
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
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent1,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0,
                  valueOrDefault<double>(
                    widget.text != null && widget.text != '' ? 9.0 : 19.0,
                    0.0,
                  ),
                  0.0,
                  0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.label,
                  'null',
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'NTSomic',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            if (widget.text != null && widget.text != '')
              Text(
                valueOrDefault<String>(
                  widget.text,
                  'null',
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'NTSomic',
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
