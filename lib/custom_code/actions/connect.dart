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

import 'package:realtime_client/realtime_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future connect(
  String table,
  Future<dynamic> Function() action,
) async {
  // Add your function code here!
  final supabase = SupaFlow.client;
  final channelName = 'public:' + table;
  final channel = supabase.channel(channelName);

  // Configure the new subscription
  channel.on(
    RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: '*', schema: 'public', table: table),
    (payload, [ref]) {
      action();
      print('Reloaded.');
    },
  ).subscribe();
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
