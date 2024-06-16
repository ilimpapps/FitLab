import '/components/back/back_widget.dart';
import '/components/info_under_development/info_under_development_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'profile_app_model.dart';
export 'profile_app_model.dart';

class ProfileAppWidget extends StatefulWidget {
  const ProfileAppWidget({super.key});

  @override
  State<ProfileAppWidget> createState() => _ProfileAppWidgetState();
}

class _ProfileAppWidgetState extends State<ProfileAppWidget>
    with TickerProviderStateMixin {
  late ProfileAppModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileAppModel());

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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 48.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Text(
                    'О приложении',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'NTSomic',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Версия',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'NTSomic',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Text(
                    FFAppState().appVersion,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'NTSomic',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Text(
                    'Размер',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'NTSomic',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Text(
                    '75.2 Мб',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'NTSomic',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: InkWell(
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
                              child: GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: const InfoUnderDevelopmentWidget(),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 6.0),
                          child: Text(
                            'Политика обработки персональных данных',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'NTSomic',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: InkWell(
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
                              child: GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: const InfoUnderDevelopmentWidget(),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 6.0),
                          child: Text(
                            'Пользовательское соглашение',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'NTSomic',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
          ),
        ),
      ),
    );
  }
}
