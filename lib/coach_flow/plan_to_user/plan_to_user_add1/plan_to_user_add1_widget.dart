import '/coach_flow/plan_templates/bottom_plan_templates_choice/bottom_plan_templates_choice_widget.dart';
import '/components/back/back_widget.dart';
import '/components/custom_picker/custom_picker_widget.dart';
import '/components/info_plan_creation/info_plan_creation_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'plan_to_user_add1_model.dart';
export 'plan_to_user_add1_model.dart';

class PlanToUserAdd1Widget extends StatefulWidget {
  const PlanToUserAdd1Widget({
    super.key,
    required this.usersName,
    required this.usersSurname,
    required this.usersPhotoUrl,
    required this.rlUsers,
  });

  final String? usersName;
  final String? usersSurname;
  final String? usersPhotoUrl;
  final String? rlUsers;

  @override
  State<PlanToUserAdd1Widget> createState() => _PlanToUserAdd1WidgetState();
}

class _PlanToUserAdd1WidgetState extends State<PlanToUserAdd1Widget>
    with TickerProviderStateMixin {
  late PlanToUserAdd1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanToUserAdd1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: const InfoPlanCreationWidget(),
            ),
          );
        },
      ).then((value) => setState(() {}));
    });

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
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Container(
            width: double.infinity,
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
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
                          ],
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          'Шаг 1 из 2',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'NTSomic',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white40,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.37,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'Новый план для пользователя',
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
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Клиент',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'NTSomic',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.37,
                                                      ),
                                            ),
                                            if (widget.usersPhotoUrl != null &&
                                                widget.usersPhotoUrl != '')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 0.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      widget.usersPhotoUrl,
                                                      'null',
                                                    ),
                                                    width: 32.0,
                                                    height: 32.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '${valueOrDefault<String>(
                                                  widget.usersName,
                                                  'null',
                                                )} ${valueOrDefault<String>(
                                                  widget.usersSurname,
                                                  'null',
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'NTSomic',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.37,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet<bool>(
                                                context: context,
                                                builder: (context) {
                                                  final datePickedCupertinoTheme =
                                                      CupertinoTheme.of(
                                                          context);
                                                  return Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            3,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    child: CupertinoTheme(
                                                      data:
                                                          datePickedCupertinoTheme
                                                              .copyWith(
                                                        textTheme:
                                                            datePickedCupertinoTheme
                                                                .textTheme
                                                                .copyWith(
                                                          dateTimePickerTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'NTSomic',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                        ),
                                                      ),
                                                      child:
                                                          CupertinoDatePicker(
                                                        mode:
                                                            CupertinoDatePickerMode
                                                                .date,
                                                        minimumDate:
                                                            getCurrentTimestamp,
                                                        initialDateTime:
                                                            getCurrentTimestamp,
                                                        maximumDate:
                                                            DateTime(2050),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        use24hFormat: false,
                                                        onDateTimeChanged:
                                                            (newDateTime) =>
                                                                safeSetState(
                                                                    () {
                                                          _model.datePicked =
                                                              newDateTime;
                                                        }),
                                                      ),
                                                    ),
                                                  );
                                                });
                                            if (_model.datePicked != null) {
                                              _model.endDate =
                                                  _model.datePicked;
                                              setState(() {});
                                            }
                                          },
                                          child: wrapWithModel(
                                            model: _model.customPickerModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: CustomPickerWidget(
                                              label: 'Дата окончания',
                                              text: dateTimeFormat(
                                                'dd.MM.yy',
                                                _model.endDate,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 0.0),
                                        child: Text(
                                          'Тренировки в неделю',
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
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final weekdaysChild = FFAppConstants
                                                .weekdays
                                                .toList();
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    weekdaysChild.length,
                                                    (weekdaysChildIndex) {
                                                  final weekdaysChildItem =
                                                      weekdaysChild[
                                                          weekdaysChildIndex];
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
                                                      _model.trainingsCount =
                                                          weekdaysChildItem;
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: 36.0,
                                                      height: 36.0,
                                                      decoration: BoxDecoration(
                                                        color: _model
                                                                    .trainingsCount ==
                                                                weekdaysChildItem
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .white8,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: _model
                                                                      .trainingsCount !=
                                                                  weekdaysChildItem
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .divider
                                                              : Colors
                                                                  .transparent,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            weekdaysChildItem
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'NTSomic',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight:
                                                                    1.37,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).divide(const SizedBox(width: 8.0)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].addToEnd(const SizedBox(height: 130.0)),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation']!),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 50.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: BottomPlanTemplatesChoiceWidget(
                                      rlUsers: widget.rlUsers!,
                                      usersName: widget.usersName,
                                      usersSurname: widget.usersSurname,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          text: 'Выберите шаблон',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 52.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0x00060409),
                            textStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'NTSomic',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          showLoadingIndicator: false,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: ((_model.trainingsCount == null) ||
                                    (_model.endDate == null) ||
                                    (_model.trainingsCount == 0))
                                ? null
                                : () async {
                                    context.pushNamed(
                                      'PlanToUserAdd2',
                                      queryParameters: {
                                        'trainingsCount': serializeParam(
                                          _model.trainingsCount,
                                          ParamType.int,
                                        ),
                                        'usersName': serializeParam(
                                          widget.usersName,
                                          ParamType.String,
                                        ),
                                        'usersSurname': serializeParam(
                                          widget.usersSurname,
                                          ParamType.String,
                                        ),
                                        'rlUsers': serializeParam(
                                          widget.rlUsers,
                                          ParamType.String,
                                        ),
                                        'endDate': serializeParam(
                                          _model.endDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                            text: 'Далее',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 52.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'NTSomic',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                              disabledColor:
                                  FlutterFlowTheme.of(context).divider,
                              disabledTextColor:
                                  FlutterFlowTheme.of(context).white40,
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ],
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
