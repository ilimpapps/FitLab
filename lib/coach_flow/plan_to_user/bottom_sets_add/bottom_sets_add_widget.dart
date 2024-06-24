import '/backend/schema/structs/index.dart';
import '/components/plan_creation_by_hands_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'bottom_sets_add_model.dart';
export 'bottom_sets_add_model.dart';

class BottomSetsAddWidget extends StatefulWidget {
  const BottomSetsAddWidget({
    super.key,
    this.exerciseName,
  });

  final String? exerciseName;

  @override
  State<BottomSetsAddWidget> createState() => _BottomSetsAddWidgetState();
}

class _BottomSetsAddWidgetState extends State<BottomSetsAddWidget> {
  late BottomSetsAddModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomSetsAddModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 52.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.exerciseName,
                                  'Упражнение',
                                ),
                                textAlign: TextAlign.center,
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: 32.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).white8,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                FFIcons.kclose3,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 8.0)),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Количество \nподходов',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'NTSomic',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.37,
                                            ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final childSets =
                                                  FFAppConstants.sets.toList();
                                              return Wrap(
                                                spacing: 8.0,
                                                runSpacing: 8.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: List.generate(
                                                    childSets.length,
                                                    (childSetsIndex) {
                                                  final childSetsItem =
                                                      childSets[childSetsIndex];
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
                                                      _model.setsPlan = [];
                                                      setState(() {});
                                                      while (_model.index <
                                                          childSetsItem) {
                                                        _model.addToSetsPlan(
                                                            SetsPlanStruct());
                                                        setState(() {});
                                                        _model.index =
                                                            _model.index + 1;
                                                        setState(() {});
                                                      }
                                                      _model.index = 0;
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: childSetsItem ==
                                                                _model.setsPlan
                                                                    .length
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .white8,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .divider,
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
                                                            childSetsItem
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
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
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ]
                                        .addToStart(const SizedBox(width: 20.0))
                                        .addToEnd(const SizedBox(width: 20.0)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 32.0, 20.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final child = _model.setsPlan.toList();
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(child.length,
                                        (childIndex) {
                                      final childItem = child[childIndex];
                                      return wrapWithModel(
                                        model: _model
                                            .planCreationByHandsItemModels
                                            .getModel(
                                          childIndex.toString(),
                                          childIndex,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: PlanCreationByHandsItemWidget(
                                          key: Key(
                                            'Keyhbz_${childIndex.toString()}',
                                          ),
                                          index: childIndex,
                                          action: () async {
                                            _model.updateSetsPlanAtIndex(
                                              childIndex,
                                              (e) => e
                                                ..reps = int.tryParse(_model
                                                        .planCreationByHandsItemModels
                                                        .getValueAtIndex(
                                                      childIndex,
                                                      (m) => m
                                                          .repsInputTextController
                                                          .text,
                                                    ) ??
                                                    '')
                                                ..weightKg = functions
                                                    .stringToDouble(_model
                                                        .planCreationByHandsItemModels
                                                        .getValueAtIndex(
                                                  childIndex,
                                                  (m) => m
                                                      .weightKgInputTextController
                                                      .text,
                                                )),
                                            );
                                            setState(() {});
                                          },
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ].addToEnd(const SizedBox(height: 130.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    20.0,
                    0.0,
                    20.0,
                    valueOrDefault<double>(
                      (isWeb
                              ? MediaQuery.viewInsetsOf(context).bottom > 0
                              : _isKeyboardVisible)
                          ? 8.0
                          : 50.0,
                      0.0,
                    )),
                child: FFButtonWidget(
                  onPressed: (_model.setsPlan
                          .where((e) =>
                              (e.reps == null) ||
                              (e.reps == 0) ||
                              (e.weightKg == null) ||
                              (e.weightKg == 0.0))
                          .toList()
                          .isNotEmpty)
                      ? null
                      : () async {
                          await Future.delayed(
                              const Duration(milliseconds: 200));
                          Navigator.pop(
                              context,
                              SetsPlanListStruct(
                                setsPlan: _model.setsPlan,
                              ));
                        },
                  text: 'Добавить',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 52.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'NTSomic',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: const BorderSide(
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(18.0),
                    disabledColor: FlutterFlowTheme.of(context).accent1,
                    disabledTextColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                  showLoadingIndicator: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
