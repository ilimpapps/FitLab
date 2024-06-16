import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'exerciese_item_creation_model.dart';
export 'exerciese_item_creation_model.dart';

class ExercieseItemCreationWidget extends StatefulWidget {
  const ExercieseItemCreationWidget({
    super.key,
    required this.exerciese,
    required this.delete,
    required this.showDelete,
  });

  final String? exerciese;
  final Future Function()? delete;
  final bool? showDelete;

  @override
  State<ExercieseItemCreationWidget> createState() =>
      _ExercieseItemCreationWidgetState();
}

class _ExercieseItemCreationWidgetState
    extends State<ExercieseItemCreationWidget> {
  late ExercieseItemCreationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExercieseItemCreationModel());
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
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 8.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  widget.exerciese,
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
            if (widget.showDelete ?? true)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.delete?.call();
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 8.0, 0.0),
                    child: Icon(
                      FFIcons.kclose3,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
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
