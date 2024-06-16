import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/chat_item/chat_item_widget.dart';
import '/components/empty_chats_for_client/empty_chats_for_client_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'chats_model.dart';
export 'chats_model.dart';

class ChatsWidget extends StatefulWidget {
  const ChatsWidget({super.key});

  @override
  State<ChatsWidget> createState() => _ChatsWidgetState();
}

class _ChatsWidgetState extends State<ChatsWidget> {
  late ChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.disconnect(
        'chats_messages',
      );
      await Future.delayed(const Duration(milliseconds: 1000));
      await actions.connect(
        'chats_messages',
        () async {
          setState(() => _model.requestCompleter = null);
          await _model.waitForRequestCompleted();
          HapticFeedback.mediumImpact();
        },
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/bg.png',
                ).image,
              ),
            ),
            child: Stack(
              children: [
                FutureBuilder<List<UsersRow>>(
                  future: UsersTable().querySingleRow(
                    queryFn: (q) => q.eq(
                      'id',
                      currentUserUid,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Image.asset(
                        '',
                      );
                    }
                    List<UsersRow> stackUsersRowList = snapshot.data!;
                    final stackUsersRow = stackUsersRowList.isNotEmpty
                        ? stackUsersRowList.first
                        : null;
                    return Stack(
                      children: [
                        if (!stackUsersRow!.isCoach)
                          FutureBuilder<List<ChatsRow>>(
                            future: (_model.requestCompleter ??=
                                    Completer<List<ChatsRow>>()
                                      ..complete(ChatsTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'rl_users',
                                              currentUserUid,
                                            )
                                            .order('update_time'),
                                      )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Image.asset(
                                  '',
                                );
                              }
                              List<ChatsRow> clientChatQueryChatsRowList =
                                  snapshot.data!;
                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 48.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: Text(
                                          'Чаты',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'NTSomic',
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                      ),
                                      Flexible(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final chat =
                                                        clientChatQueryChatsRowList
                                                            .toList();
                                                    if (chat.isEmpty) {
                                                      return const SizedBox(
                                                        height: 400.0,
                                                        child:
                                                            EmptyChatsForClientWidget(),
                                                      );
                                                    }
                                                    return ListView.builder(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                        0,
                                                        8.0,
                                                        0,
                                                        0,
                                                      ),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: chat.length,
                                                      itemBuilder:
                                                          (context, chatIndex) {
                                                        final chatItem =
                                                            chat[chatIndex];
                                                        return FutureBuilder<
                                                            List<UsersRow>>(
                                                          future: UsersTable()
                                                              .querySingleRow(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'id',
                                                              chatItem.rlCoach,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Image
                                                                  .asset(
                                                                '',
                                                              );
                                                            }
                                                            List<UsersRow>
                                                                coachQueryUsersRowList =
                                                                snapshot.data!;
                                                            final coachQueryUsersRow =
                                                                coachQueryUsersRowList
                                                                        .isNotEmpty
                                                                    ? coachQueryUsersRowList
                                                                        .first
                                                                    : null;
                                                            return Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      ChatsMessagesRow>>(
                                                                future: ChatsMessagesTable()
                                                                    .querySingleRow(
                                                                  queryFn:
                                                                      (q) => q
                                                                          .eq(
                                                                            'rl_chats',
                                                                            chatItem.id,
                                                                          )
                                                                          .order(
                                                                              'created_at'),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Image
                                                                        .asset(
                                                                      '',
                                                                    );
                                                                  }
                                                                  List<ChatsMessagesRow>
                                                                      chatItemChatsMessagesRowList =
                                                                      snapshot
                                                                          .data!;
                                                                  final chatItemChatsMessagesRow = chatItemChatsMessagesRowList
                                                                          .isNotEmpty
                                                                      ? chatItemChatsMessagesRowList
                                                                          .first
                                                                      : null;
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'ChatsMessages',
                                                                        queryParameters:
                                                                            {
                                                                          'chat':
                                                                              serializeParam(
                                                                            chatItem,
                                                                            ParamType.SupabaseRow,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child:
                                                                        ChatItemWidget(
                                                                      key: Key(
                                                                          'Keyldv_${chatIndex}_of_${chat.length}'),
                                                                      name: coachQueryUsersRow!
                                                                          .name!,
                                                                      photo: coachQueryUsersRow
                                                                          .photoUrl!,
                                                                      surname:
                                                                          coachQueryUsersRow
                                                                              .surname!,
                                                                      time: chatItemChatsMessagesRow!
                                                                          .createdAt,
                                                                      messages:
                                                                          chatItemChatsMessagesRow,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ].addToEnd(const SizedBox(height: 128.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        if (stackUsersRow.isCoach ?? true)
                          FutureBuilder<List<ChatsRow>>(
                            future: ChatsTable().queryRows(
                              queryFn: (q) => q
                                  .eq(
                                    'rl_coach',
                                    currentUserUid,
                                  )
                                  .order('update_time'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Image.asset(
                                  '',
                                );
                              }
                              List<ChatsRow> coachChatQueryChatsRowList =
                                  snapshot.data!;
                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 48.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: Text(
                                          'Чаты',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'NTSomic',
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                      ),
                                      Flexible(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final chat =
                                                        coachChatQueryChatsRowList
                                                            .toList();
                                                    return ListView.builder(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                        0,
                                                        8.0,
                                                        0,
                                                        0,
                                                      ),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: chat.length,
                                                      itemBuilder:
                                                          (context, chatIndex) {
                                                        final chatItem =
                                                            chat[chatIndex];
                                                        return FutureBuilder<
                                                            List<UsersRow>>(
                                                          future: UsersTable()
                                                              .querySingleRow(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'id',
                                                              chatItem.rlUsers,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Image
                                                                  .asset(
                                                                '',
                                                              );
                                                            }
                                                            List<UsersRow>
                                                                userQueryUsersRowList =
                                                                snapshot.data!;
                                                            final userQueryUsersRow =
                                                                userQueryUsersRowList
                                                                        .isNotEmpty
                                                                    ? userQueryUsersRowList
                                                                        .first
                                                                    : null;
                                                            return Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      ChatsMessagesRow>>(
                                                                future: ChatsMessagesTable()
                                                                    .querySingleRow(
                                                                  queryFn:
                                                                      (q) => q
                                                                          .eq(
                                                                            'rl_chats',
                                                                            chatItem.id,
                                                                          )
                                                                          .order(
                                                                              'created_at'),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Image
                                                                        .asset(
                                                                      '',
                                                                    );
                                                                  }
                                                                  List<ChatsMessagesRow>
                                                                      chatItemChatsMessagesRowList =
                                                                      snapshot
                                                                          .data!;
                                                                  final chatItemChatsMessagesRow = chatItemChatsMessagesRowList
                                                                          .isNotEmpty
                                                                      ? chatItemChatsMessagesRowList
                                                                          .first
                                                                      : null;
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'ChatsMessages',
                                                                        queryParameters:
                                                                            {
                                                                          'chat':
                                                                              serializeParam(
                                                                            chatItem,
                                                                            ParamType.SupabaseRow,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child:
                                                                        ChatItemWidget(
                                                                      key: Key(
                                                                          'Keyet8_${chatIndex}_of_${chat.length}'),
                                                                      name: userQueryUsersRow!
                                                                          .name!,
                                                                      photo: userQueryUsersRow
                                                                          .photoUrl!,
                                                                      surname:
                                                                          userQueryUsersRow
                                                                              .surname!,
                                                                      time: chatItemChatsMessagesRow!
                                                                          .createdAt,
                                                                      messages:
                                                                          chatItemChatsMessagesRow,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ].addToEnd(const SizedBox(height: 128.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    );
                  },
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => setState(() {}),
                      child: NavBarWidget(
                        index: 1,
                        isCoach: FFAppState().isCoach,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
