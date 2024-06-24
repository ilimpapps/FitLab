import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'my_progress_widget.dart' show MyProgressWidget;
import 'package:flutter/material.dart';

class MyProgressModel extends FlutterFlowModel<MyProgressWidget> {
  ///  Local state fields for this page.

  String picker = 'Тело';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel1;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel2;
  bool requestCompleted = false;
  String? requestLastUniqueKey;

  /// Query cache managers for this widget.

  final _usersMeasurementsCacheManager =
      FutureRequestManager<List<UsersMeasurementsRow>>();
  Future<List<UsersMeasurementsRow>> usersMeasurementsCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersMeasurementsRow>> Function() requestFn,
  }) =>
      _usersMeasurementsCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUsersMeasurementsCacheCache() =>
      _usersMeasurementsCacheManager.clear();
  void clearUsersMeasurementsCacheCacheKey(String? uniqueKey) =>
      _usersMeasurementsCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
    choiceChipModel1 = createModel(context, () => ChoiceChipModel());
    choiceChipModel2 = createModel(context, () => ChoiceChipModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
    choiceChipModel1.dispose();
    choiceChipModel2.dispose();

    /// Dispose query cache managers for this widget.

    clearUsersMeasurementsCacheCache();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
