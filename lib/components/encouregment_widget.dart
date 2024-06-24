import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'encouregment_model.dart';
export 'encouregment_model.dart';

class EncouregmentWidget extends StatefulWidget {
  const EncouregmentWidget({super.key});

  @override
  State<EncouregmentWidget> createState() => _EncouregmentWidgetState();
}

class _EncouregmentWidgetState extends State<EncouregmentWidget>
    with TickerProviderStateMixin {
  late EncouregmentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EncouregmentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.lottieIndex = random_data.randomInteger(0, 2);
      _model.encouragementsIndex = random_data.randomInteger(
          0, functions.subtractOne(FFAppConstants.encouragements.length)!);
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 4000));
      if (animationsMap['columnOnActionTriggerAnimation'] != null) {
        await animationsMap['columnOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
      Navigator.pop(context);
    });

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Builder(
            builder: (context) {
              if (_model.lottieIndex == 0) {
                return Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Stack(
                    children: [
                      Lottie.asset(
                        'assets/lottie_animations/Animation1.json',
                        width: 150.0,
                        height: 130.0,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            100.0, 0.0, 0.0, 0.0),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 170.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              FFAppConstants
                                  .encouragements[_model.encouragementsIndex],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'NTSomic',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (_model.lottieIndex == 1) {
                return Align(
                  alignment: const AlignmentDirectional(-1.12, 1.0),
                  child: Stack(
                    children: [
                      Lottie.asset(
                        'assets/lottie_animations/Animation2.json',
                        width: 150.0,
                        height: 130.0,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            100.0, 0.0, 0.0, 0.0),
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 170.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              FFAppConstants
                                  .encouragements[_model.encouragementsIndex],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'NTSomic',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Align(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: Lottie.asset(
                            'assets/lottie_animations/Animation3.json',
                            width: 150.0,
                            height: 130.0,
                            fit: BoxFit.cover,
                            animate: true,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 120.0, 120.0),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 170.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondary,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  FFAppConstants.encouragements[
                                      _model.encouragementsIndex],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'NTSomic',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    )
        .animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!)
        .animateOnActionTrigger(
          animationsMap['columnOnActionTriggerAnimation']!,
        );
  }
}
