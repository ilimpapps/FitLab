import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_training_list_model.dart';
export 'empty_training_list_model.dart';

class EmptyTrainingListWidget extends StatefulWidget {
  const EmptyTrainingListWidget({super.key});

  @override
  State<EmptyTrainingListWidget> createState() =>
      _EmptyTrainingListWidgetState();
}

class _EmptyTrainingListWidgetState extends State<EmptyTrainingListWidget> {
  late EmptyTrainingListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyTrainingListModel());
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
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.asset(
              'assets/images/stars.webp',
              width: 40.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Text(
              'Предстоящих тренировок нет',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'NTSomic',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                    lineHeight: 1.37,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
