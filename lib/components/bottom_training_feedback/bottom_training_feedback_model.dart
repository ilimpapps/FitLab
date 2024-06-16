import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_training_feedback_widget.dart' show BottomTrainingFeedbackWidget;
import 'package:flutter/material.dart';

class BottomTrainingFeedbackModel
    extends FlutterFlowModel<BottomTrainingFeedbackWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TrainingRating widget.
  double? trainingRatingValue;
  // State field(s) for StateRating widget.
  double? stateRatingValue;
  // State field(s) for CommentInput widget.
  FocusNode? commentInputFocusNode;
  TextEditingController? commentInputTextController;
  String? Function(BuildContext, String?)? commentInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentInputFocusNode?.dispose();
    commentInputTextController?.dispose();
  }
}
