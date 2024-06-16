import '/backend/supabase/supabase.dart';
import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'chats_messages_widget.dart' show ChatsMessagesWidget;
import 'package:flutter/material.dart';

class ChatsMessagesModel extends FlutterFlowModel<ChatsMessagesWidget> {
  ///  Local state fields for this page.

  bool hasAttach = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<List<ChatsMessagesRow>>? requestCompleter;
  // State field(s) for MessageField widget.
  FocusNode? messageFieldFocusNode;
  TextEditingController? messageFieldTextController;
  String? Function(BuildContext, String?)? messageFieldTextControllerValidator;
  // Model for Back component.
  late BackModel backModel;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    messageFieldFocusNode?.dispose();
    messageFieldTextController?.dispose();

    backModel.dispose();
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
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
