import '/backend/supabase/supabase.dart';
import '/components/choice_chip/choice_chip_widget.dart';
import '/components/empty_training_list/empty_training_list_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  DateTime? pickedDate;

  String pickedTraining = 'Запланированные';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in Home widget.
  List<UsersRow>? queryUsers;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 10;

  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel1;
  // Model for ChoiceChip component.
  late ChoiceChipModel choiceChipModel2;
  // Model for EmptyTrainingList component.
  late EmptyTrainingListModel emptyTrainingListModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    choiceChipModel1 = createModel(context, () => ChoiceChipModel());
    choiceChipModel2 = createModel(context, () => ChoiceChipModel());
    emptyTrainingListModel =
        createModel(context, () => EmptyTrainingListModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    choiceChipModel1.dispose();
    choiceChipModel2.dispose();
    emptyTrainingListModel.dispose();
    navBarModel.dispose();
  }
}
