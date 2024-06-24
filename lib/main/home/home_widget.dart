import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/components/empty_training_list/empty_training_list_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/training_card_client/training_card_client_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.dark);
      _model.pickedDate = getCurrentTimestamp;
      setState(() {});
      _model.queryUsers = await UsersTable().queryRows(
        queryFn: (q) => q.eq(
          'id',
          currentUserUid,
        ),
      );
      FFAppState().isCoach = _model.queryUsers!.first.isCoach;
      FFAppState().rlCoach = valueOrDefault<String>(
        _model.queryUsers?.first.rlCoach,
        'null',
      );
      FFAppState().update(() {});
      if (!(_model.queryUsers?.first.name != null &&
          _model.queryUsers?.first.name != '')) {
        context.goNamed('FillUserInfo');
      }
    });

    animationsMap.addAll({
      'conditionalBuilderOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
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
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
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
                Builder(
                  builder: (context) {
                    if (FFAppState().isCoach) {
                      return FutureBuilder<List<ViewUsersTrainingsRow>>(
                        future: ViewUsersTrainingsTable().queryRows(
                          queryFn: (q) => q
                              .eq(
                                'rl_coach',
                                currentUserUid,
                              )
                              .order('created_at'),
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
                          List<ViewUsersTrainingsRow>
                              queryViewUsersTrainingsViewUsersTrainingsRowList =
                              snapshot.data!;
                          return Container(
                            decoration: const BoxDecoration(),
                            child: FutureBuilder<List<PassedTrainingsRow>>(
                              future: PassedTrainingsTable().queryRows(
                                queryFn: (q) => q.eq(
                                  'rl_coach',
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
                                List<PassedTrainingsRow>
                                    queryPassedTrainingsPassedTrainingsRowList =
                                    snapshot.data!;
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 48.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          functions.homeGreet(
                                                              getCurrentTimestamp),
                                                          'Доброго времени суток',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'NTSomic',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.28,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '${functions.stringUpperCase(valueOrDefault<String>(
                                                            _model.queryUsers
                                                                ?.first.name,
                                                            'null',
                                                          ))} ${functions.stringUpperCase(valueOrDefault<String>(
                                                            _model
                                                                .queryUsers
                                                                ?.first
                                                                .surname,
                                                            'null',
                                                          ))}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'NTSomic',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.1,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (_model.queryUsers?.first
                                                            .photoUrl !=
                                                        null &&
                                                    _model.queryUsers?.first
                                                            .photoUrl !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'ProfileInfo',
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: SizedBox(
                                                        width: 64.0,
                                                        height: 76.0,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/crown.webp',
                                                                    width: 24.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: 64.0,
                                                                height: 64.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .orange,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          const Duration(
                                                                              milliseconds: 200),
                                                                      fadeOutDuration:
                                                                          const Duration(
                                                                              milliseconds: 200),
                                                                      imageUrl:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        _model
                                                                            .queryUsers
                                                                            ?.first
                                                                            .photoUrl,
                                                                        'null',
                                                                      ),
                                                                      width:
                                                                          61.0,
                                                                      height:
                                                                          61.0,
                                                                      fit: BoxFit
                                                                          .cover,
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
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final dates = functions
                                                    .generateCarouselDateList()
                                                    .toList();
                                                return SizedBox(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  child: CarouselSlider.builder(
                                                    itemCount: dates.length,
                                                    itemBuilder: (context,
                                                        datesIndex, _) {
                                                      final datesItem =
                                                          dates[datesIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.pickedDate =
                                                              datesItem;
                                                          setState(() {});
                                                          await _model
                                                              .carouselController
                                                              ?.animateToPage(
                                                            datesIndex,
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    500),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        child: Container(
                                                          width: 40.0,
                                                          height: 58.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                dateTimeFormat(
                                                                          'd/M/y',
                                                                          datesItem,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        dateTimeFormat(
                                                                          'd/M/y',
                                                                          _model
                                                                              .pickedDate,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .white8,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        22.0),
                                                            border: Border.all(
                                                              color: datesIndex ==
                                                                      10
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .info
                                                                  : const Color(
                                                                      0x00000000),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        8.0,
                                                                        4.0,
                                                                        10.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  dateTimeFormat(
                                                                    'd',
                                                                    datesItem,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'NTSomic',
                                                                        color: dateTimeFormat(
                                                                                  'd/M/y',
                                                                                  datesItem,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ) ==
                                                                                dateTimeFormat(
                                                                                  'd/M/y',
                                                                                  _model.pickedDate,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                )
                                                                            ? FlutterFlowTheme.of(context).primaryBackground
                                                                            : FlutterFlowTheme.of(context).info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                        lineHeight:
                                                                            1.1,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  dateTimeFormat(
                                                                    'E',
                                                                    datesItem,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'NTSomic',
                                                                        color: dateTimeFormat(
                                                                                  'd/M/y',
                                                                                  datesItem,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ) ==
                                                                                dateTimeFormat(
                                                                                  'd/M/y',
                                                                                  _model.pickedDate,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                )
                                                                            ? FlutterFlowTheme.of(context).black40
                                                                            : FlutterFlowTheme.of(context).white40,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                        lineHeight:
                                                                            1.28,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    carouselController: _model
                                                            .carouselController ??=
                                                        CarouselController(),
                                                    options: CarouselOptions(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              10,
                                                              dates.length -
                                                                  1)),
                                                      viewportFraction: 0.14,
                                                      disableCenter: false,
                                                      enlargeCenterPage: false,
                                                      enlargeFactor: 0.0,
                                                      enableInfiniteScroll:
                                                          false,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      autoPlay: false,
                                                      onPageChanged: (index,
                                                              _) =>
                                                          _model.carouselCurrentIndex =
                                                              index,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 36.0, 0.0, 0.0),
                                            child: Text(
                                              'Тренировки',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'NTSomic',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.pickedTraining =
                                                          'Запланированные';
                                                      setState(() {});
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .choiceChipModel1,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: ChoiceChipWidget(
                                                        text: 'Запланированные',
                                                        isPicked: _model
                                                                .pickedTraining ==
                                                            'Запланированные',
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.pickedTraining =
                                                          'Завершенные';
                                                      setState(() {});
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .choiceChipModel2,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: ChoiceChipWidget(
                                                        text: 'Завершенные',
                                                        isPicked: _model
                                                                .pickedTraining ==
                                                            'Завершенные',
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(width: 8.0))
                                                    .addToStart(
                                                        const SizedBox(width: 20.0))
                                                    .addToEnd(
                                                        const SizedBox(width: 20.0)),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final childUsersTrainings =
                                                    queryViewUsersTrainingsViewUsersTrainingsRowList
                                                        .where((e) =>
                                                            (e.weekday ==
                                                                functions
                                                                    .dateTimeWeekday(
                                                                        _model
                                                                            .pickedDate)) &&
                                                            (_model.pickedDate! <
                                                                functions
                                                                    .dateTimeToEndDate(
                                                                        e.endDate)!) &&
                                                            () {
                                                              if (_model
                                                                      .pickedTraining ==
                                                                  'Завершенные') {
                                                                return (queryPassedTrainingsPassedTrainingsRowList
                                                                    .where((e) =>
                                                                        (e.endTraining !=
                                                                            null) &&
                                                                        (functions.dateTimeToDate(e.endTraining) ==
                                                                            functions.dateTimeToDate(_model.pickedDate)))
                                                                    .toList()
                                                                    .isNotEmpty);
                                                              } else if (_model
                                                                      .pickedTraining ==
                                                                  'Запланированные') {
                                                                return !(queryPassedTrainingsPassedTrainingsRowList
                                                                    .where((e) =>
                                                                        (e.endTraining !=
                                                                            null) &&
                                                                        (functions.dateTimeToDate(e.endTraining) ==
                                                                            functions.dateTimeToDate(_model.pickedDate)))
                                                                    .toList()
                                                                    .isNotEmpty);
                                                              } else {
                                                                return false;
                                                              }
                                                            }())
                                                        .toList();
                                                if (childUsersTrainings
                                                    .isEmpty) {
                                                  return const SizedBox(
                                                    width: double.infinity,
                                                    child:
                                                        EmptyTrainingListWidget(),
                                                  );
                                                }
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      childUsersTrainings
                                                          .length,
                                                      (childUsersTrainingsIndex) {
                                                    final childUsersTrainingsItem =
                                                        childUsersTrainings[
                                                            childUsersTrainingsIndex];
                                                    return Visibility(
                                                      visible: _model
                                                              .pickedDate! >=
                                                          functions.startOfDay(
                                                              getCurrentTimestamp),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'Training',
                                                            queryParameters: {
                                                              'rlUsersTrainings':
                                                                  serializeParam(
                                                                childUsersTrainingsItem
                                                                    .id,
                                                                ParamType.int,
                                                              ),
                                                              'dateTime':
                                                                  serializeParam(
                                                                _model
                                                                    .pickedDate,
                                                                ParamType
                                                                    .DateTime,
                                                              ),
                                                              'isCoachView':
                                                                  serializeParam(
                                                                true,
                                                                ParamType.bool,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          childUsersTrainingsItem
                                                                              .name,
                                                                          'null',
                                                                        ),
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
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kright4,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .white40,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (valueOrDefault<String>(
                                                                                childUsersTrainingsItem.usersPhotoUrl,
                                                                                'null',
                                                                              ) !=
                                                                              '')
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(24.0),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                const Duration(milliseconds: 200),
                                                                            fadeOutDuration:
                                                                                const Duration(milliseconds: 200),
                                                                            imageUrl:
                                                                                valueOrDefault<String>(
                                                                              childUsersTrainingsItem.usersPhotoUrl,
                                                                              'null',
                                                                            ),
                                                                            width:
                                                                                24.0,
                                                                            height:
                                                                                24.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${valueOrDefault<String>(
                                                                            childUsersTrainingsItem.usersName,
                                                                            'null',
                                                                          )} ${valueOrDefault<String>(
                                                                            childUsersTrainingsItem.usersSurname,
                                                                            'null',
                                                                          )}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'NTSomic',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
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
                                                      ),
                                                    );
                                                  }).divide(
                                                    const SizedBox(height: 12.0),
                                                    filterFn:
                                                        (childUsersTrainingsIndex) {
                                                      final childUsersTrainingsItem =
                                                          childUsersTrainings[
                                                              childUsersTrainingsIndex];
                                                      return _model
                                                              .pickedDate! >=
                                                          functions.startOfDay(
                                                              getCurrentTimestamp);
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ].addToEnd(const SizedBox(height: 126.0)),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    } else {
                      return FutureBuilder<List<ViewUsersTrainingsRow>>(
                        future: ViewUsersTrainingsTable().queryRows(
                          queryFn: (q) => q
                              .eq(
                                'rl_users',
                                currentUserUid,
                              )
                              .order('end_date', ascending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Image.asset(
                              '',
                            );
                          }
                          List<ViewUsersTrainingsRow>
                              queryViewUsersTrainingsViewUsersTrainingsRowList =
                              snapshot.data!;
                          return Container(
                            decoration: const BoxDecoration(),
                            child: FutureBuilder<List<PassedTrainingsRow>>(
                              future: PassedTrainingsTable().queryRows(
                                queryFn: (q) => q.eq(
                                  'rl_user',
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
                                List<PassedTrainingsRow>
                                    queryPassedTrainingsPassedTrainingsRowList =
                                    snapshot.data!;
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 48.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          functions.homeGreet(
                                                              getCurrentTimestamp),
                                                          'Доброго времени суток',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'NTSomic',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.28,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          '${functions.stringUpperCase(valueOrDefault<String>(
                                                            _model.queryUsers
                                                                ?.first.name,
                                                            'null',
                                                          ))} ${functions.stringUpperCase(valueOrDefault<String>(
                                                            _model
                                                                .queryUsers
                                                                ?.first
                                                                .surname,
                                                            'null',
                                                          ))}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'NTSomic',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.1,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (_model.queryUsers?.first
                                                            .photoUrl !=
                                                        null &&
                                                    _model.queryUsers?.first
                                                            .photoUrl !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'ProfileInfo',
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: SizedBox(
                                                        width: 64.0,
                                                        height: 76.0,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/crown.webp',
                                                                    width: 24.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: 64.0,
                                                                height: 64.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .orange,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          const Duration(
                                                                              milliseconds: 200),
                                                                      fadeOutDuration:
                                                                          const Duration(
                                                                              milliseconds: 200),
                                                                      imageUrl:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        _model
                                                                            .queryUsers
                                                                            ?.first
                                                                            .photoUrl,
                                                                        'null',
                                                                      ),
                                                                      width:
                                                                          61.0,
                                                                      height:
                                                                          61.0,
                                                                      fit: BoxFit
                                                                          .cover,
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
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context
                                                          .pushNamed('Advices');
                                                    },
                                                    child: Container(
                                                      width: 140.0,
                                                      height: 140.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xFFEEF099),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            14.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/advice.png',
                                                                width: 40.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            const Spacer(),
                                                            AutoSizeText(
                                                              'Совет дня',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'NTSomic',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.37,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Каждый день новые рекомендации',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'NTSomic',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.25,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation1']!),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'MyProgress',
                                                        queryParameters: {
                                                          'rlUser':
                                                              serializeParam(
                                                            currentUserUid,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 140.0,
                                                      height: 140.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .purpleLight,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            14.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Measure.png',
                                                                width: 40.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            const Spacer(),
                                                            AutoSizeText(
                                                              'Мой прогресс',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'NTSomic',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.37,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Посмотрите, как вы изменились',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'NTSomic',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.25,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation2']!),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'DiaryPhoto',
                                                        queryParameters: {
                                                          'rlUser':
                                                              serializeParam(
                                                            currentUserUid,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 140.0,
                                                      height: 140.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .orangeLight,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            14.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Diary2.png',
                                                                width: 40.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            const Spacer(),
                                                            AutoSizeText(
                                                              'Дневник',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'NTSomic',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.37,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Визуальный прогрес от занятий',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'NTSomic',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.37,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation3']!),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'Achievments');
                                                    },
                                                    child: Container(
                                                      width: 140.0,
                                                      height: 140.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .blueLight,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            14.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/achieves.png',
                                                                width: 40.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            const Spacer(),
                                                            AutoSizeText(
                                                              'Награды',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'NTSomic',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.37,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Посмотрите ваши достижения',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'NTSomic',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.37,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation4']!),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'Exercices',
                                                        queryParameters: {
                                                          'rlCoach':
                                                              serializeParam(
                                                            FFAppState()
                                                                .rlCoach,
                                                            ParamType.String,
                                                          ),
                                                          'rlClient':
                                                              serializeParam(
                                                            currentUserUid,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 140.0,
                                                      height: 140.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .greenLight,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            14.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/dumbbell.png',
                                                                width: 40.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            const Spacer(),
                                                            AutoSizeText(
                                                              'База знаний',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'NTSomic',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.37,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AutoSizeText(
                                                                'Актуальная информация об упражнениях',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'NTSomic',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.25,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation5']!),
                                                ]
                                                    .divide(
                                                        const SizedBox(width: 15.0))
                                                    .addToStart(
                                                        const SizedBox(width: 20.0))
                                                    .addToEnd(
                                                        const SizedBox(width: 20.0)),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 32.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Мои тренировки',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'NTSomic',
                                                          fontSize: 26.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context
                                                        .pushNamed('Archive');
                                                  },
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Text(
                                                        'Архив',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'NTSomic',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.28,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                                  .addToStart(
                                                      const SizedBox(width: 20.0))
                                                  .addToEnd(
                                                      const SizedBox(width: 20.0)),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if (queryViewUsersTrainingsViewUsersTrainingsRowList
                                                  .isNotEmpty) {
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final childDateTimeList = functions
                                                              .dateTimeList(
                                                                  getCurrentTimestamp,
                                                                  queryViewUsersTrainingsViewUsersTrainingsRowList
                                                                      .last
                                                                      .endDate)
                                                              ?.toList() ??
                                                          [];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            childDateTimeList
                                                                .length,
                                                            (childDateTimeListIndex) {
                                                          final childDateTimeListItem =
                                                              childDateTimeList[
                                                                  childDateTimeListIndex];
                                                          return Builder(
                                                            builder: (context) {
                                                              final childViewUsersTrainings = queryViewUsersTrainingsViewUsersTrainingsRowList
                                                                  .where((e) =>
                                                                      e.weekday ==
                                                                      functions
                                                                          .dateTimeWeekday(
                                                                              childDateTimeListItem))
                                                                  .toList();
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    childViewUsersTrainings
                                                                        .length,
                                                                    (childViewUsersTrainingsIndex) {
                                                                  final childViewUsersTrainingsItem =
                                                                      childViewUsersTrainings[
                                                                          childViewUsersTrainingsIndex];
                                                                  return Visibility(
                                                                    visible:
                                                                        !valueOrDefault<
                                                                            bool>(
                                                                      queryPassedTrainingsPassedTrainingsRowList
                                                                          .where((e) =>
                                                                              valueOrDefault<bool>(
                                                                                (e.endTraining != null) && (functions.dateTimeToDate(childDateTimeListItem) == functions.dateTimeToDate(e.endTraining)),
                                                                                false,
                                                                              ))
                                                                          .toList()
                                                                          .isNotEmpty,
                                                                      false,
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              childDateTimeListIndex == 0
                                                                                  ? 'СЕГОДНЯ'
                                                                                  : valueOrDefault<String>(
                                                                                      functions.dateTimeCalendarTitle(childDateTimeListItem),
                                                                                      'null',
                                                                                    ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'NTSomic',
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                              child: TrainingCardClientWidget(
                                                                                key: Key('Keygqc_${childViewUsersTrainingsIndex}_of_${childViewUsersTrainings.length}'),
                                                                                viewUsersTrainingsRow: childViewUsersTrainingsItem,
                                                                                isCurrentDate: functions.dateTimeToDate(getCurrentTimestamp) == functions.dateTimeToDate(childDateTimeListItem),
                                                                                dateTime: childDateTimeListItem,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }).divide(
                                                                  const SizedBox(
                                                                      height:
                                                                          12.0),
                                                                  filterFn:
                                                                      (childViewUsersTrainingsIndex) {
                                                                    final childViewUsersTrainingsItem =
                                                                        childViewUsersTrainings[
                                                                            childViewUsersTrainingsIndex];
                                                                    return !valueOrDefault<
                                                                        bool>(
                                                                      queryPassedTrainingsPassedTrainingsRowList
                                                                          .where((e) =>
                                                                              valueOrDefault<bool>(
                                                                                (e.endTraining != null) && (functions.dateTimeToDate(childDateTimeListItem) == functions.dateTimeToDate(e.endTraining)),
                                                                                false,
                                                                              ))
                                                                          .toList()
                                                                          .isNotEmpty,
                                                                      false,
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }).addToStart(const SizedBox(
                                                            height: 8.0)),
                                                      );
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 48.0,
                                                                0.0, 0.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .emptyTrainingListModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          const EmptyTrainingListWidget(),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ].addToEnd(const SizedBox(height: 126.0)),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    }
                  },
                ).animateOnPageLoad(
                    animationsMap['conditionalBuilderOnPageLoadAnimation']!),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: NavBarWidget(
                        index: 0,
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
