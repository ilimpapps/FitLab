import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isCoach = prefs.getBool('ff_isCoach') ?? _isCoach;
    });
    _safeInit(() {
      _startTrainingDateTime = prefs.containsKey('ff_startTrainingDateTime')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_startTrainingDateTime')!)
          : _startTrainingDateTime;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _appVersion = '1.0.0';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
  }

  String _tempPhoto = '';
  String get tempPhoto => _tempPhoto;
  set tempPhoto(String value) {
    _tempPhoto = value;
  }

  bool _isCoach = false;
  bool get isCoach => _isCoach;
  set isCoach(bool value) {
    _isCoach = value;
    prefs.setBool('ff_isCoach', value);
  }

  String _filterPlanTemplateGender = 'Любой пол';
  String get filterPlanTemplateGender => _filterPlanTemplateGender;
  set filterPlanTemplateGender(String value) {
    _filterPlanTemplateGender = value;
  }

  List<int> _bottomCoachTemplateExercises = [];
  List<int> get bottomCoachTemplateExercises => _bottomCoachTemplateExercises;
  set bottomCoachTemplateExercises(List<int> value) {
    _bottomCoachTemplateExercises = value;
  }

  void addToBottomCoachTemplateExercises(int value) {
    bottomCoachTemplateExercises.add(value);
  }

  void removeFromBottomCoachTemplateExercises(int value) {
    bottomCoachTemplateExercises.remove(value);
  }

  void removeAtIndexFromBottomCoachTemplateExercises(int index) {
    bottomCoachTemplateExercises.removeAt(index);
  }

  void updateBottomCoachTemplateExercisesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    bottomCoachTemplateExercises[index] =
        updateFn(_bottomCoachTemplateExercises[index]);
  }

  void insertAtIndexInBottomCoachTemplateExercises(int index, int value) {
    bottomCoachTemplateExercises.insert(index, value);
  }

  bool _conditionWidget = false;
  bool get conditionWidget => _conditionWidget;
  set conditionWidget(bool value) {
    _conditionWidget = value;
  }

  TrainingStartEndStruct _trainingStartEndList =
      TrainingStartEndStruct.fromSerializableMap(
          jsonDecode('{\"start_date_time\":\"\"}'));
  TrainingStartEndStruct get trainingStartEndList => _trainingStartEndList;
  set trainingStartEndList(TrainingStartEndStruct value) {
    _trainingStartEndList = value;
  }

  void updateTrainingStartEndListStruct(
      Function(TrainingStartEndStruct) updateFn) {
    updateFn(trainingStartEndList);
  }

  String _rlCoach = '';
  String get rlCoach => _rlCoach;
  set rlCoach(String value) {
    _rlCoach = value;
  }

  DateTime? _startTrainingDateTime;
  DateTime? get startTrainingDateTime => _startTrainingDateTime;
  set startTrainingDateTime(DateTime? value) {
    _startTrainingDateTime = value;
    value != null
        ? prefs.setInt('ff_startTrainingDateTime', value.millisecondsSinceEpoch)
        : prefs.remove('ff_startTrainingDateTime');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
