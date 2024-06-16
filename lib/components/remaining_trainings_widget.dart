import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'remaining_trainings_model.dart';
export 'remaining_trainings_model.dart';

class RemainingTrainingsWidget extends StatefulWidget {
  const RemainingTrainingsWidget({
    super.key,
    required this.userRow,
    required this.thisWeek,
  });

  final UsersRow? userRow;
  final bool? thisWeek;

  @override
  State<RemainingTrainingsWidget> createState() =>
      _RemainingTrainingsWidgetState();
}

class _RemainingTrainingsWidgetState extends State<RemainingTrainingsWidget> {
  late RemainingTrainingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RemainingTrainingsModel());
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
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 56.0,
            height: 56.0,
            child: Stack(
              children: [
                Container(
                  width: 56.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).orange,
                    shape: BoxShape.circle,
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      functions.combineInitials(
                          widget.userRow!.name!, widget.userRow!.surname!),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'NTSomic',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.37,
                          ),
                    ),
                  ),
                ),
                if (widget.userRow?.photoUrl != null &&
                    widget.userRow?.photoUrl != '')
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 200),
                      fadeOutDuration: const Duration(milliseconds: 200),
                      imageUrl: widget.userRow!.photoUrl!,
                      width: 56.0,
                      height: 56.0,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.userRow?.name} ${widget.userRow?.surname}',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'NTSomic',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                        lineHeight: 1.37,
                      ),
                ),
                Text(
                  widget.thisWeek! ? 'Осталось ' : 'Создано ',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'NTSomic',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                        lineHeight: 1.28,
                      ),
                ),
              ],
            ),
          ),
          Container(
            width: 37.0,
            height: 37.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              FFIcons.kplus2,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 24.0,
            ),
          ),
        ].divide(const SizedBox(width: 12.0)),
      ),
    );
  }
}
