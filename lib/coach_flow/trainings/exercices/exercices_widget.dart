import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'exercices_model.dart';
export 'exercices_model.dart';

class ExercicesWidget extends StatefulWidget {
  const ExercicesWidget({
    super.key,
    this.rlCoach,
    this.rlClient,
  });

  final String? rlCoach;
  final String? rlClient;

  @override
  State<ExercicesWidget> createState() => _ExercicesWidgetState();
}

class _ExercicesWidgetState extends State<ExercicesWidget>
    with TickerProviderStateMixin {
  late ExercicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExercicesModel());

    _model.searchInputTextController ??= TextEditingController();
    _model.searchInputFocusNode ??= FocusNode();

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
            begin: const Offset(0.0, -20.0),
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 56.0, 0.0),
                          child: Text(
                            'Все упражнения',
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
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Container(
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).white8,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Icon(
                              FFIcons.ksearch,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.searchInputTextController,
                                focusNode: _model.searchInputFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.searchInputTextController',
                                  const Duration(milliseconds: 1000),
                                  () async {
                                    _model.apiResultbc9 = await SearchCall.call(
                                      searchInput:
                                          _model.searchInputTextController.text,
                                      table: 'exercises',
                                      column: 'name',
                                    );

                                    if ((_model.apiResultbc9?.succeeded ??
                                        true)) {
                                      setState(() {});
                                    }

                                    setState(() {});
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'NTSomic',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                        lineHeight: 1.28,
                                      ),
                                  hintText: 'Поиск по названию упражнения...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'NTSomic',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 20.0, 16.0, 20.0),
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
                                    .searchInputTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if ((_model.searchInputTextController
                                                  .text !=
                                              '') &&
                                      (getJsonField(
                                            (_model.apiResultbc9?.jsonBody ??
                                                ''),
                                            r'''$[:].id''',
                                          ) !=
                                          null)) {
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: FutureBuilder<List<ExercisesRow>>(
                                        future: ExercisesTable().queryRows(
                                          queryFn: (q) => q.in_(
                                            'id',
                                            getJsonField(
                                              (_model.apiResultbc9?.jsonBody ??
                                                  ''),
                                              r'''$[:].id''',
                                              true,
                                            )!,
                                          ),
                                          limit: 15,
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
                                          List<ExercisesRow>
                                              queryExercisesExercisesRowList =
                                              snapshot.data!;
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(
                                                queryExercisesExercisesRowList
                                                    .length,
                                                (queryExercisesIndex) {
                                              final queryExercisesExercisesRow =
                                                  queryExercisesExercisesRowList[
                                                      queryExercisesIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'ExercisesDetails',
                                                    queryParameters: {
                                                      'rlExercises':
                                                          serializeParam(
                                                        queryExercisesExercisesRow
                                                            .id,
                                                        ParamType.int,
                                                      ),
                                                      'rlCoach': serializeParam(
                                                        widget.rlCoach,
                                                        ParamType.String,
                                                      ),
                                                      'rlUser': serializeParam(
                                                        widget.rlClient,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 7.0,
                                                                0.0, 7.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        200),
                                                            fadeOutDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        200),
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              queryExercisesExercisesRow
                                                                  .photos.first,
                                                              'null',
                                                            ),
                                                            width: 100.0,
                                                            height: 100.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                AutoSizeText(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    queryExercisesExercisesRow
                                                                        .name,
                                                                    'null',
                                                                  ),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
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
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Доп. группы: ${valueOrDefault<String>(
                                                                      functions.listToCommaString(queryExercisesExercisesRow
                                                                          .additionalMuscle
                                                                          .toList()),
                                                                      'нет',
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'NTSomic',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                          lineHeight:
                                                                              1.28,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Снаряд: ${valueOrDefault<String>(
                                                                      functions.listToCommaString(queryExercisesExercisesRow
                                                                          .equipment
                                                                          .toList()),
                                                                      'нет',
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'NTSomic',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                          lineHeight:
                                                                              1.28,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Сложность: ${queryExercisesExercisesRow.difficulty}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'NTSomic',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                          lineHeight:
                                                                              1.28,
                                                                        ),
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
                                              );
                                            }).divide(const SizedBox(height: 12.0)),
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return FutureBuilder<
                                        List<ExercisesMuscleRow>>(
                                      future: ExercisesMuscleTable().queryRows(
                                        queryFn: (q) => q,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return const Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0x03E6FC70),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ExercisesMuscleRow>
                                            queryExercisesMuscleExercisesMuscleRowList =
                                            snapshot.data!;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              queryExercisesMuscleExercisesMuscleRowList
                                                  .length,
                                              (queryExercisesMuscleIndex) {
                                            final queryExercisesMuscleExercisesMuscleRow =
                                                queryExercisesMuscleExercisesMuscleRowList[
                                                    queryExercisesMuscleIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
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
                                                      if (_model.expandIndex ==
                                                          queryExercisesMuscleIndex) {
                                                        _model.expandIndex =
                                                            null;
                                                        setState(() {});
                                                      } else {
                                                        _model.expandIndex =
                                                            queryExercisesMuscleIndex;
                                                        setState(() {});
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white8,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    14.0,
                                                                    16.0,
                                                                    14.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      queryExercisesMuscleExercisesMuscleRow
                                                                          .muscle,
                                                                      'null',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
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
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (queryExercisesMuscleIndex ==
                                                                        _model
                                                                            .expandIndex) {
                                                                      return Icon(
                                                                        FFIcons
                                                                            .kup2,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            32.0,
                                                                      );
                                                                    } else {
                                                                      return Icon(
                                                                        FFIcons
                                                                            .kdown3,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            32.0,
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (queryExercisesMuscleIndex ==
                                                      _model.expandIndex)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FutureBuilder<
                                                          List<ExercisesRow>>(
                                                        future: ExercisesTable()
                                                            .queryRows(
                                                          queryFn: (q) =>
                                                              q.contains(
                                                            'muscle',
                                                            '{${queryExercisesMuscleExercisesMuscleRow.muscle}}',
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Image.asset(
                                                              '',
                                                            );
                                                          }
                                                          List<ExercisesRow>
                                                              queryExercisesExercisesRowList =
                                                              snapshot.data!;
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: List.generate(
                                                                queryExercisesExercisesRowList
                                                                    .length,
                                                                (queryExercisesIndex) {
                                                              final queryExercisesExercisesRow =
                                                                  queryExercisesExercisesRowList[
                                                                      queryExercisesIndex];
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'ExercisesDetails',
                                                                    queryParameters:
                                                                        {
                                                                      'rlExercises':
                                                                          serializeParam(
                                                                        queryExercisesExercisesRow
                                                                            .id,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                      'rlCoach':
                                                                          serializeParam(
                                                                        widget
                                                                            .rlCoach,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'rlUser':
                                                                          serializeParam(
                                                                        widget
                                                                            .rlClient,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            7.0,
                                                                            0.0,
                                                                            7.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                const Duration(milliseconds: 200),
                                                                            fadeOutDuration:
                                                                                const Duration(milliseconds: 200),
                                                                            imageUrl:
                                                                                valueOrDefault<String>(
                                                                              queryExercisesExercisesRow.photos.first,
                                                                              'null',
                                                                            ),
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    queryExercisesExercisesRow.name,
                                                                                    'null',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        fontFamily: 'NTSomic',
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                        lineHeight: 1.37,
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Доп. группы: ${valueOrDefault<String>(
                                                                                      functions.listToCommaString(queryExercisesExercisesRow.additionalMuscle.toList()),
                                                                                      'нет',
                                                                                    )}',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'NTSomic',
                                                                                          color: FlutterFlowTheme.of(context).white40,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                          lineHeight: 1.28,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Снаряд: ${valueOrDefault<String>(
                                                                                      functions.listToCommaString(queryExercisesExercisesRow.equipment.toList()),
                                                                                      'нет',
                                                                                    )}',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'NTSomic',
                                                                                          color: FlutterFlowTheme.of(context).white40,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                          lineHeight: 1.28,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Сложность: ${queryExercisesExercisesRow.difficulty}',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'NTSomic',
                                                                                          color: FlutterFlowTheme.of(context).white40,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                          lineHeight: 1.28,
                                                                                        ),
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
                                                              );
                                                            }).divide(const SizedBox(
                                                                height: 8.0)),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'columnOnPageLoadAnimation']!);
                                                        },
                                                      ),
                                                    ),
                                                ].addToStart(
                                                    const SizedBox(height: 12.0)),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ].addToEnd(const SizedBox(height: 50.0)),
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
