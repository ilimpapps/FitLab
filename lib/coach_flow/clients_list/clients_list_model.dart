import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'clients_list_widget.dart' show ClientsListWidget;
import 'package:flutter/material.dart';

class ClientsListModel extends FlutterFlowModel<ClientsListWidget> {
  ///  Local state fields for this page.

  bool active = true;

  bool archive = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBarModel.dispose();
  }
}
