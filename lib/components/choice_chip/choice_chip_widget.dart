import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'choice_chip_model.dart';
export 'choice_chip_model.dart';

class ChoiceChipWidget extends StatefulWidget {
  const ChoiceChipWidget({
    super.key,
    String? text,
    bool? isPicked,
  })  : text = text ?? '',
        isPicked = isPicked ?? false;

  final String text;
  final bool isPicked;

  @override
  State<ChoiceChipWidget> createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  late ChoiceChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoiceChipModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.isPicked
            ? FlutterFlowTheme.of(context).secondary
            : FlutterFlowTheme.of(context).white8,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(23.0, 7.0, 23.0, 7.0),
        child: Text(
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
      ),
    );
  }
}
