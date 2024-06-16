// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:giphy_get/giphy_get.dart';

Future<String?> openGiphyDialog(
  BuildContext context,
  String apiKey,
  String? userID,
  Color? tabColor,
  int? pauseInKeystrokes,
  String? searchText,
) async {
  GiphyGif? gif = await GiphyGet.getGif(
    searchText: searchText ?? '',
    context: context,
    apiKey: apiKey,
    lang: GiphyLanguage.english,
    randomID: userID ?? '',
    tabColor: tabColor,
    debounceTimeInMilliseconds: pauseInKeystrokes ?? 350,
  );
  if (gif == null) {
    return null;
  }
  return gif.images?.original?.url;
}
