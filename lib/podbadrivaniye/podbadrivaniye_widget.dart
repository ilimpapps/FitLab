import '/components/encouregment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'podbadrivaniye_model.dart';
export 'podbadrivaniye_model.dart';

class PodbadrivaniyeWidget extends StatefulWidget {
  const PodbadrivaniyeWidget({super.key});

  @override
  State<PodbadrivaniyeWidget> createState() => _PodbadrivaniyeWidgetState();
}

class _PodbadrivaniyeWidgetState extends State<PodbadrivaniyeWidget> {
  late PodbadrivaniyeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PodbadrivaniyeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.encouregmentModel,
            updateCallback: () => setState(() {}),
            child: const EncouregmentWidget(),
          ),
        ),
      ),
    );
  }
}
