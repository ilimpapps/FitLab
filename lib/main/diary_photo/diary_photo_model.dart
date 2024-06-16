import '/components/back/back_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'diary_photo_widget.dart' show DiaryPhotoWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DiaryPhotoModel extends FlutterFlowModel<DiaryPhotoWidget> {
  ///  Local state fields for this page.

  bool photo = true;

  bool compare = false;

  String? photoBefore;

  String? photoAfter;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Back component.
  late BackModel backModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Stores action output result for [Bottom Sheet - BottomBeforeAfterPfoto] action in Container widget.
  String? beforeCopy;
  // Stores action output result for [Bottom Sheet - BottomBeforeAfterPfoto] action in Container widget.
  String? afterCopy;

  @override
  void initState(BuildContext context) {
    backModel = createModel(context, () => BackModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    backModel.dispose();
  }
}
