import '/components/back/back_widget.dart';
import '/components/bottom_achievments/bottom_achievments_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'achievments_model.dart';
export 'achievments_model.dart';

class AchievmentsWidget extends StatefulWidget {
  const AchievmentsWidget({super.key});

  @override
  State<AchievmentsWidget> createState() => _AchievmentsWidgetState();
}

class _AchievmentsWidgetState extends State<AchievmentsWidget>
    with TickerProviderStateMixin {
  late AchievmentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AchievmentsModel());

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: wrapWithModel(
                            model: _model.backModel,
                            updateCallback: () => setState(() {}),
                            child: const BackWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Награды',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'NTSomic',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                    lineHeight: 1.2,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Получено 3 награды из 9',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'NTSomic',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.37,
                                    ),
                              ),
                            ),
                            GridView(
                              padding: const EdgeInsets.fromLTRB(
                                0,
                                32.0,
                                0,
                                32.0,
                              ),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 0.8,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(300.0),
                                            child: Image.asset(
                                              'assets/images/Ach7.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Железный человек',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'NTSomic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.37,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: const BottomAchievmentsWidget(
                                              index: 1,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 80.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(300.0),
                                            child: Image.asset(
                                              'assets/images/Ach9.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Марафонец месяца',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'NTSomic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.37,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: const BottomAchievmentsWidget(
                                              index: 2,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 80.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(300.0),
                                            child: Image.asset(
                                              'assets/images/Ach8.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Силач\n недели',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'NTSomic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.37,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(300.0),
                                            child: Image.asset(
                                              'assets/images/Ach6.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Фитнес-легенда',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'NTSomic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.37,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(300.0),
                                            child: Image.asset(
                                              'assets/images/Ach5.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Энергия дня',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'NTSomic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.37,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(300.0),
                                            child: Image.asset(
                                              'assets/images/Ach3.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Покоритель гор',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'NTSomic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.37,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: const BottomAchievmentsWidget(
                                              index: 3,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 80.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(300.0),
                                            child: Image.asset(
                                              'assets/images/Ach4.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Шаги к успеху',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'NTSomic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.37,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(300.0),
                                            child: Image.asset(
                                              'assets/images/Ach1.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Кардио-герой',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'NTSomic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.37,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(300.0),
                                            child: Image.asset(
                                              'assets/images/Ach2.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Мастер растяжки',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'NTSomic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.37,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ].addToStart(const SizedBox(height: 12.0)),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation']!),
                    ),
                  ),
                ].addToStart(const SizedBox(height: 54.0)),
              ),
            ],
          ).animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
