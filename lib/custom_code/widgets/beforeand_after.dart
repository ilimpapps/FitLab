// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//Credit to AsadKhan261 for Awsome Widget
//https://github.com/AsadKhan261/before_after_image_slider_nullsafty

import 'package:before_after_image_slider_nullsafty/before_after_image_slider_nullsafty.dart';

class BeforeandAfter extends StatefulWidget {
  const BeforeandAfter({
    Key? key,
    this.width,
    this.height,
    this.imagesAfter,
    this.imagesBefore,
    this.imageHeight,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String? imagesBefore;
  final String? imagesAfter;

  final double? imageHeight;

  @override
  _BeforeandAfterState createState() => _BeforeandAfterState();
}

class _BeforeandAfterState extends State<BeforeandAfter> {
  @override
  Widget build(BuildContext context) {
    return BeforeAfter(
      beforeImage: Image.network(
        widget.imagesBefore!,
        fit: BoxFit.cover,
      ),
      afterImage: Image.network(
        widget.imagesAfter!,
        fit: BoxFit.cover,
      ),
      imageHeight: widget.imageHeight,
    );
  }
}
