import '../database.dart';

class ViewCoachTrainingsTable extends SupabaseTable<ViewCoachTrainingsRow> {
  @override
  String get tableName => 'view_coach_trainings';

  @override
  ViewCoachTrainingsRow createRow(Map<String, dynamic> data) =>
      ViewCoachTrainingsRow(data);
}

class ViewCoachTrainingsRow extends SupabaseDataRow {
  ViewCoachTrainingsRow(super.data);

  @override
  SupabaseTable get table => ViewCoachTrainingsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  String? get difficulty => getField<String>('difficulty');
  set difficulty(String? value) => setField<String>('difficulty', value);

  List<String> get exercises => getListField<String>('exercises');
  set exercises(List<String>? value) =>
      setListField<String>('exercises', value);

  List<int> get rlExercises => getListField<int>('rl_exercises');
  set rlExercises(List<int>? value) => setListField<int>('rl_exercises', value);
}
