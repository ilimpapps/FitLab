import '../database.dart';

class ViewTemplatesTrainingsExercisesTable
    extends SupabaseTable<ViewTemplatesTrainingsExercisesRow> {
  @override
  String get tableName => 'view_templates_trainings_exercises';

  @override
  ViewTemplatesTrainingsExercisesRow createRow(Map<String, dynamic> data) =>
      ViewTemplatesTrainingsExercisesRow(data);
}

class ViewTemplatesTrainingsExercisesRow extends SupabaseDataRow {
  ViewTemplatesTrainingsExercisesRow(super.data);

  @override
  SupabaseTable get table => ViewTemplatesTrainingsExercisesTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  int? get rlTemplatesTrainings => getField<int>('rl_templates_trainings');
  set rlTemplatesTrainings(int? value) =>
      setField<int>('rl_templates_trainings', value);

  int? get rlExercises => getField<int>('rl_exercises');
  set rlExercises(int? value) => setField<int>('rl_exercises', value);

  dynamic get setsPlan => getField<dynamic>('sets_plan');
  set setsPlan(dynamic value) => setField<dynamic>('sets_plan', value);

  String? get exerciseName => getField<String>('exercise_name');
  set exerciseName(String? value) => setField<String>('exercise_name', value);
}
