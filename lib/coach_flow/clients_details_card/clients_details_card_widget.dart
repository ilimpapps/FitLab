import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'clients_details_card_model.dart';
export 'clients_details_card_model.dart';

class ClientsDetailsCardWidget extends StatefulWidget {
  const ClientsDetailsCardWidget({
    super.key,
    required this.clientRow,
    required this.myClient,
  });

  final UsersRow? clientRow;
  final bool? myClient;

  @override
  State<ClientsDetailsCardWidget> createState() =>
      _ClientsDetailsCardWidgetState();
}

class _ClientsDetailsCardWidgetState extends State<ClientsDetailsCardWidget> {
  late ClientsDetailsCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientsDetailsCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PassedTrainingsRow>>(
      future: PassedTrainingsTable().queryRows(
        queryFn: (q) => q.eq(
          'rl_user',
          widget.clientRow?.id,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0x03E6FC70),
                ),
              ),
            ),
          );
        }
        List<PassedTrainingsRow> containerPassedTrainingsRowList =
            snapshot.data!;
        return Container(
          width: double.infinity,
          height: 80.0,
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                            functions.combineInitials(widget.clientRow!.name!,
                                widget.clientRow!.surname!),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'NTSomic',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                  lineHeight: 1.1,
                                ),
                          ),
                        ),
                      ),
                      if (widget.clientRow?.photoUrl != null &&
                          widget.clientRow?.photoUrl != '')
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 200),
                            fadeOutDuration: const Duration(milliseconds: 200),
                            imageUrl: widget.clientRow!.photoUrl!,
                            width: 56.0,
                            height: 56.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.clientRow?.name} ${widget.clientRow?.surname}',
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'NTSomic',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.37,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kdocument,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              if (containerPassedTrainingsRowList.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      functions.getWorkoutString(
                                          containerPassedTrainingsRowList
                                              .length),
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'NTSomic',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.28,
                                        ),
                                  ),
                                ),
                              if (!(containerPassedTrainingsRowList.isNotEmpty))
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Не было тренировок',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'NTSomic',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.28,
                                        ),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  FFIcons.kstar,
                                  color: FlutterFlowTheme.of(context).orange,
                                  size: 24.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '4.8',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'NTSomic',
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
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Stack(
                    children: [
                      if (widget.myClient ?? true)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 0.0, 8.0),
                          child: Icon(
                            Icons.keyboard_control_sharp,
                            color: FlutterFlowTheme.of(context).white40,
                            size: 26.0,
                          ),
                        ),
                      if (!widget.myClient!)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 0.0, 8.0),
                          child: Icon(
                            FFIcons.kright4,
                            color: FlutterFlowTheme.of(context).white40,
                            size: 24.0,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
