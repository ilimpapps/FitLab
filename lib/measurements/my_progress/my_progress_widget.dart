import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/components/measurement_item/measurement_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'my_progress_model.dart';
export 'my_progress_model.dart';

class MyProgressWidget extends StatefulWidget {
  const MyProgressWidget({
    super.key,
    required this.rlUser,
  });

  final String? rlUser;

  @override
  State<MyProgressWidget> createState() => _MyProgressWidgetState();
}

class _MyProgressWidgetState extends State<MyProgressWidget>
    with TickerProviderStateMixin {
  late MyProgressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyProgressModel());

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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            FutureBuilder<List<UsersMeasurementsRow>>(
              future: UsersMeasurementsTable().queryRows(
                queryFn: (q) => q.eq(
                  'rl_users',
                  widget.rlUser,
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
                List<UsersMeasurementsRow> containerUsersMeasurementsRowList =
                    snapshot.data!;
                return Container(
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
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
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'MyProgressAdd',
                                    queryParameters: {
                                      'type': serializeParam(
                                        _model.picker,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: 56.0,
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    FFIcons.kplus2,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 0.0),
                                  child: Text(
                                    'Мой прогресс',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'NTSomic',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.25,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 8.0, 20.0, 0.0),
                                  child: Text(
                                    'Посмотрите, как изменились ваши параметры',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'NTSomic',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.picker = 'Тело';
                                            setState(() {});
                                          },
                                          child: wrapWithModel(
                                            model: _model.choiceChipModel1,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: ChoiceChipWidget(
                                              text: 'Тело',
                                              isPicked: _model.picker == 'Тело',
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.picker = 'Упражнения';
                                            setState(() {});
                                          },
                                          child: wrapWithModel(
                                            model: _model.choiceChipModel2,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: ChoiceChipWidget(
                                              text: 'Упражнения',
                                              isPicked:
                                                  _model.picker == 'Упражнения',
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(const SizedBox(width: 8.0))
                                          .addToStart(const SizedBox(width: 20.0))
                                          .addToEnd(const SizedBox(width: 20.0)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final ms =
                                          containerUsersMeasurementsRowList
                                              .where((e) =>
                                                  e.type == _model.picker)
                                              .toList();
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(ms.length, (msIndex) {
                                          final msItem = ms[msIndex];
                                          return MeasurementItemWidget(
                                            key: Key(
                                                'Keymwd_${msIndex}_of_${ms.length}'),
                                            usersMeasurementsRow: msItem,
                                          );
                                        }).divide(const SizedBox(height: 8.0)),
                                      );
                                    },
                                  ),
                                ),
                              ].addToEnd(const SizedBox(height: 50.0)),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
