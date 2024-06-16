import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/coach_details_card/coach_details_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'coach_list_model.dart';
export 'coach_list_model.dart';

class CoachListWidget extends StatefulWidget {
  const CoachListWidget({super.key});

  @override
  State<CoachListWidget> createState() => _CoachListWidgetState();
}

class _CoachListWidgetState extends State<CoachListWidget>
    with TickerProviderStateMixin {
  late CoachListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoachListModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
          body: Stack(
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
                  List<UsersRow> queryUsersUsersRowList = snapshot.data!;
                  final queryUsersUsersRow = queryUsersUsersRowList.isNotEmpty
                      ? queryUsersUsersRowList.first
                      : null;
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/bg.png',
                        ).image,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Тренеры',
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
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Container(
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).white8,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 0.0),
                                        child: Icon(
                                          FFIcons.ksearch,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          size: 24.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController',
                                              const Duration(milliseconds: 200),
                                              () => setState(() {}),
                                            ),
                                            onFieldSubmitted: (_) async {
                                              var shouldSetState = false;
                                              _model.apiResultg6y =
                                                  await SearchCall.call(
                                                searchInput:
                                                    _model.textController.text,
                                                table: 'users',
                                                column: 'surname',
                                              );
                                              shouldSetState = true;
                                              if (!(_model.apiResultg6y
                                                      ?.succeeded ??
                                                  true)) {
                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                                return;
                                              }
                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                            },
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Поиск',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'NTSomic',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.28,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'NTSomic',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.all(4.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'NTSomic',
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.37,
                                                ),
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (getJsonField(
                                              (_model.apiResultg6y?.jsonBody ??
                                                  ''),
                                              r'''$.id[:]''',
                                            ) !=
                                            null) {
                                          return FutureBuilder<List<UsersRow>>(
                                            future: UsersTable().queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'is_coach',
                                                    true,
                                                  )
                                                  .in_(
                                                    'id',
                                                    (getJsonField(
                                                      (_model.apiResultg6y
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.id[:]''',
                                                      true,
                                                    ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList(),
                                                  )
                                                  .order('coach_rating'),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return const Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        Color(0x03E6FC70),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsersRow>
                                                  queryUsersSearchUsersRowList =
                                                  snapshot.data!;
                                              return Container(
                                                decoration: const BoxDecoration(),
                                                child: Builder(
                                                  builder: (context) {
                                                    final allCoach =
                                                        queryUsersSearchUsersRowList
                                                            .toList();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          allCoach.length,
                                                          (allCoachIndex) {
                                                        final allCoachItem =
                                                            allCoach[
                                                                allCoachIndex];
                                                        return CoachDetailsCardWidget(
                                                          key: Key(
                                                              'Keyibc_${allCoachIndex}_of_${allCoach.length}'),
                                                          coachRow:
                                                              allCoachItem,
                                                          myCoach: allCoachItem
                                                                  .id ==
                                                              queryUsersUsersRow
                                                                  ?.rlCoach,
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          return FutureBuilder<List<UsersRow>>(
                                            future: UsersTable().queryRows(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'is_coach',
                                                    true,
                                                  )
                                                  .order('coach_rating'),
                                              limit: 100,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return const Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        Color(0x03E6FC70),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsersRow>
                                                  allCoachesUsersRowList =
                                                  snapshot.data!;
                                              return Container(
                                                decoration: const BoxDecoration(),
                                                child: Builder(
                                                  builder: (context) {
                                                    final allCoach =
                                                        allCoachesUsersRowList
                                                            .toList();
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          allCoach.length,
                                                          (allCoachIndex) {
                                                        final allCoachItem =
                                                            allCoach[
                                                                allCoachIndex];
                                                        return CoachDetailsCardWidget(
                                                          key: Key(
                                                              'Keyw82_${allCoachIndex}_of_${allCoach.length}'),
                                                          coachRow:
                                                              allCoachItem,
                                                          myCoach: allCoachItem
                                                                  .id ==
                                                              queryUsersUsersRow
                                                                  ?.rlCoach,
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation']!),
                    ),
                  );
                },
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: NavBarWidget(
                      index: 3,
                      isCoach: FFAppState().isCoach,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
