import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_photo_list_model.dart';
export 'empty_photo_list_model.dart';

class EmptyPhotoListWidget extends StatefulWidget {
  const EmptyPhotoListWidget({super.key});

  @override
  State<EmptyPhotoListWidget> createState() => _EmptyPhotoListWidgetState();
}

class _EmptyPhotoListWidgetState extends State<EmptyPhotoListWidget> {
  late EmptyPhotoListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPhotoListModel());
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
              'Добавьте свою первую фотографию',
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
