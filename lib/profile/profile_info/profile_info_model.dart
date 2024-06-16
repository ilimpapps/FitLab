import '/components/basic_list_item/basic_list_item_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_info_widget.dart' show ProfileInfoWidget;
import 'package:flutter/material.dart';

class ProfileInfoModel extends FlutterFlowModel<ProfileInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BasicListItem component.
  late BasicListItemModel basicListItemModel1;
  // Model for BasicListItem component.
  late BasicListItemModel basicListItemModel2;
  // Model for BasicListItem component.
  late BasicListItemModel basicListItemModel3;
  // Model for BasicListItem component.
  late BasicListItemModel basicListItemModel4;
  // Model for BasicListItem component.
  late BasicListItemModel basicListItemModel5;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    basicListItemModel1 = createModel(context, () => BasicListItemModel());
    basicListItemModel2 = createModel(context, () => BasicListItemModel());
    basicListItemModel3 = createModel(context, () => BasicListItemModel());
    basicListItemModel4 = createModel(context, () => BasicListItemModel());
    basicListItemModel5 = createModel(context, () => BasicListItemModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    basicListItemModel1.dispose();
    basicListItemModel2.dispose();
    basicListItemModel3.dispose();
    basicListItemModel4.dispose();
    basicListItemModel5.dispose();
    navBarModel.dispose();
  }
}
