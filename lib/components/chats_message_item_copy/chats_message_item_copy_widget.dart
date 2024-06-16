import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'chats_message_item_copy_model.dart';
export 'chats_message_item_copy_model.dart';

class ChatsMessageItemCopyWidget extends StatefulWidget {
  const ChatsMessageItemCopyWidget({
    super.key,
    bool? isMyMessage,
    required this.viewChatsMessages,
  }) : isMyMessage = isMyMessage ?? false;

  final bool isMyMessage;
  final ViewChatsMessagesRow? viewChatsMessages;

  @override
  State<ChatsMessageItemCopyWidget> createState() =>
      _ChatsMessageItemCopyWidgetState();
}

class _ChatsMessageItemCopyWidgetState
    extends State<ChatsMessageItemCopyWidget> {
  late ChatsMessageItemCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsMessageItemCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          valueOrDefault<double>(
            widget.isMyMessage ? 32.0 : 0.0,
            0.0,
          ),
          0.0,
          valueOrDefault<double>(
            widget.isMyMessage ? 0.0 : 32.0,
            0.0,
          ),
          0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
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
                    visible: widget.viewChatsMessages?.usersPhotoUrl != null &&
                        widget.viewChatsMessages?.usersPhotoUrl != '',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          widget.viewChatsMessages?.usersPhotoUrl,
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
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.isMyMessage
                    ? FlutterFlowTheme.of(context).secondary
                    : FlutterFlowTheme.of(context).white8,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.viewChatsMessages?.usersName,
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
                          ' • ${dateTimeFormat(
                            'Hm',
                            widget.viewChatsMessages?.createdAt,
                            locale: FFLocalizations.of(context).languageCode,
                          )}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'NTSomic',
                                    color: FlutterFlowTheme.of(context).white40,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ],
                    ),
                    if (widget.viewChatsMessages?.message != null &&
                        widget.viewChatsMessages?.message != '')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.viewChatsMessages?.message,
                            'null',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'NTSomic',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    if (widget.viewChatsMessages?.sticker != null &&
                        widget.viewChatsMessages?.sticker != '')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              widget.viewChatsMessages?.sticker,
                              'null',
                            ),
                            width: 200.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    if (widget.viewChatsMessages?.photo != null &&
                        widget.viewChatsMessages?.photo != '')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 200),
                            fadeOutDuration: const Duration(milliseconds: 200),
                            imageUrl: valueOrDefault<String>(
                              widget.viewChatsMessages?.photo,
                              'null',
                            ),
                            width: 270.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    if (widget.viewChatsMessages?.video != null &&
                        widget.viewChatsMessages?.video != '')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: FlutterFlowVideoPlayer(
                          path: widget.viewChatsMessages!.video!,
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
                    if (widget.viewChatsMessages?.rlTraining != null)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
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
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Тренировка:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'NTSomic',
                                            color: FlutterFlowTheme.of(context)
                                                .white40,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.33,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.viewChatsMessages
                                            ?.usersTrainingsName,
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
                            'ExercisesDetails',
                            queryParameters: {
                              'rlExercises': serializeParam(
                                widget.viewChatsMessages?.rlExcercise,
                                ParamType.int,
                              ),
                              'rlCoach': serializeParam(
                                '',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Container(
                          width: double.infinity,
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
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Упражнение:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'NTSomic',
                                            color: FlutterFlowTheme.of(context)
                                                .white40,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.33,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.viewChatsMessages?.exercisesName,
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
