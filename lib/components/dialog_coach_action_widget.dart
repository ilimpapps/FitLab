import '/backend/supabase/supabase.dart';
import '/components/info_under_development/info_under_development_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'dialog_coach_action_model.dart';
export 'dialog_coach_action_model.dart';

class DialogCoachActionWidget extends StatefulWidget {
  const DialogCoachActionWidget({
    super.key,
    required this.rlCoach,
    required this.rlClient,
  });

  final String? rlCoach;
  final String? rlClient;

  @override
  State<DialogCoachActionWidget> createState() =>
      _DialogCoachActionWidgetState();
}

class _DialogCoachActionWidgetState extends State<DialogCoachActionWidget> {
  late DialogCoachActionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogCoachActionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatsRow>>(
      future: ChatsTable().querySingleRow(
        queryFn: (q) => q
            .eq(
              'rl_users',
              widget.rlClient,
            )
            .eq(
              'rl_coach',
              widget.rlCoach,
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
        List<ChatsRow> containerChatsRowList = snapshot.data!;
        final containerChatsRow = containerChatsRowList.isNotEmpty
            ? containerChatsRowList.first
            : null;
        return ClipRRect(
          borderRadius: BorderRadius.circular(13.0),
          child: Container(
            width: 259.0,
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(13.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'ChatsMessages',
                      queryParameters: {
                        'chat': serializeParam(
                          containerChatsRow,
                          ParamType.SupabaseRow,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 13.0, 16.0, 13.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Написать в чат',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'NTSomic',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.37,
                                    ),
                          ),
                          Icon(
                            FFIcons.kmessageCircle,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ],
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
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: const InfoUnderDevelopmentWidget(),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 13.0, 16.0, 13.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Завершить работу',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'NTSomic',
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.37,
                                  ),
                            ),
                            Icon(
                              FFIcons.ktrashCan,
                              color: FlutterFlowTheme.of(context).error,
                              size: 24.0,
                            ),
                          ],
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
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: const InfoUnderDevelopmentWidget(),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 13.0, 16.0, 13.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Пожаловаться',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'NTSomic',
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.37,
                                  ),
                            ),
                            Icon(
                              Icons.twenty_four_mp_sharp,
                              color: FlutterFlowTheme.of(context).error,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
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
