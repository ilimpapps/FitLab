import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chats_message_item_model.dart';
export 'chats_message_item_model.dart';

class ChatsMessageItemWidget extends StatefulWidget {
  const ChatsMessageItemWidget({
    super.key,
    bool? isMyMessage,
    required this.chatsMessagesRow,
    required this.coachRow,
    required this.myName,
  }) : isMyMessage = isMyMessage ?? false;

  final bool isMyMessage;
  final ChatsMessagesRow? chatsMessagesRow;
  final UsersRow? coachRow;
  final String? myName;

  @override
  State<ChatsMessageItemWidget> createState() => _ChatsMessageItemWidgetState();
}

class _ChatsMessageItemWidgetState extends State<ChatsMessageItemWidget> {
  late ChatsMessageItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsMessageItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(
          valueOrDefault<double>(
            widget.isMyMessage ? 1.0 : -1.0,
            0.0,
          ),
          0.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!widget.isMyMessage)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: ClipOval(
                child: Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/emptyPhoto.webp',
                      ).image,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Visibility(
                    visible: widget.coachRow?.photoUrl != null &&
                        widget.coachRow?.photoUrl != '',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          widget.coachRow?.photoUrl,
                          'null',
                        ),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: () {
                  if (widget.chatsMessagesRow?.sticker != null &&
                      widget.chatsMessagesRow?.sticker != '') {
                    return Colors.transparent;
                  } else if (widget.isMyMessage) {
                    return FlutterFlowTheme.of(context).secondary;
                  } else {
                    return FlutterFlowTheme.of(context).white8;
                  }
                }(),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(valueOrDefault<double>(
                    widget.isMyMessage ? 18.0 : 0.0,
                    0.0,
                  )),
                  bottomRight: Radius.circular(valueOrDefault<double>(
                    widget.isMyMessage ? 0.0 : 18.0,
                    0.0,
                  )),
                  topLeft: const Radius.circular(18.0),
                  topRight: const Radius.circular(18.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 7.0, 12.0, 7.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.chatsMessagesRow?.sticker == null ||
                        widget.chatsMessagesRow?.sticker == '')
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.isMyMessage
                                  ? widget.myName
                                  : widget.coachRow?.name,
                              'null',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'NTSomic',
                                  color: widget.isMyMessage
                                      ? FlutterFlowTheme.of(context).info
                                      : FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Text(
                            ' • ${valueOrDefault<String>(
                              dateTimeFormat(
                                'Hm',
                                widget.chatsMessagesRow?.createdAt,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              'null',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'NTSomic',
                                  color: FlutterFlowTheme.of(context).white40,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.chatsMessagesRow?.message != null &&
                              widget.chatsMessagesRow?.message != '')
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.chatsMessagesRow?.message,
                                    'null',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'NTSomic',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (widget.chatsMessagesRow?.sticker != null &&
                        widget.chatsMessagesRow?.sticker != '')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              widget.chatsMessagesRow?.sticker,
                              'null',
                            ),
                            width: 200.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    if (widget.chatsMessagesRow?.photo != null &&
                        widget.chatsMessagesRow?.photo != '')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 200),
                            fadeOutDuration: const Duration(milliseconds: 200),
                            imageUrl: valueOrDefault<String>(
                              widget.chatsMessagesRow?.photo,
                              'null',
                            ),
                            width: 270.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    if (widget.chatsMessagesRow?.video != null &&
                        widget.chatsMessagesRow?.video != '')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: FlutterFlowVideoPlayer(
                          path: valueOrDefault<String>(
                            widget.chatsMessagesRow?.video,
                            'null',
                          ),
                          videoType: VideoType.network,
                          width: double.infinity,
                          autoPlay: false,
                          looping: false,
                          showControls: true,
                          allowFullScreen: true,
                          allowPlaybackSpeedMenu: false,
                          lazyLoad: true,
                        ),
                      ),
                    if (widget.chatsMessagesRow?.rlUsersTraining != null)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'Training',
                              queryParameters: {
                                'rlUsersTrainings': serializeParam(
                                  widget.chatsMessagesRow?.rlUsersTraining,
                                  ParamType.int,
                                ),
                                'dateTime': serializeParam(
                                  widget.chatsMessagesRow?.trainingDateTime,
                                  ParamType.DateTime,
                                ),
                                'isCoachView': serializeParam(
                                  FFAppState().isCoach,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  2.0, 0.0, 0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3A345C),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 4.0, 8.0, 4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Тренировка:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'NTSomic',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white40,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.33,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          widget.chatsMessagesRow?.trainingName,
                                          'null',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'NTSomic',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.33,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (widget.chatsMessagesRow?.rlExcercise != null)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: FutureBuilder<List<ExercisesRow>>(
                          future: ExercisesTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'id',
                              widget.chatsMessagesRow?.rlExcercise,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Image.asset(
                                '',
                              );
                            }
                            List<ExercisesRow> excerciseExercisesRowList =
                                snapshot.data!;
                            final excerciseExercisesRow =
                                excerciseExercisesRowList.isNotEmpty
                                    ? excerciseExercisesRowList.first
                                    : null;
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'ExercisesDetails',
                                  queryParameters: {
                                    'rlExercises': serializeParam(
                                      excerciseExercisesRow?.id,
                                      ParamType.int,
                                    ),
                                    'rlCoach': serializeParam(
                                      FFAppState().isCoach
                                          ? currentUserUid
                                          : widget.coachRow?.id,
                                      ParamType.String,
                                    ),
                                    'rlUser': serializeParam(
                                      FFAppState().isCoach
                                          ? widget.chatsMessagesRow?.rlUsers
                                          : currentUserUid,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      2.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF3A345C),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 4.0, 8.0, 4.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Упражнение:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'NTSomic',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white40,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.33,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              excerciseExercisesRow?.name,
                                              'null',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'NTSomic',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.33,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
