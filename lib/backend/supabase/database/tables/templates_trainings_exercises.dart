import '../database.dart';

class TemplatesTrainingsExercisesTable
    extends SupabaseTable<TemplatesTrainingsExercisesRow> {
  @override
  String get tableName => 'templates_trainings_exercises';

  @override
  TemplatesTrainingsExercisesRow createRow(Map<String, dynamic> data) =>
      TemplatesTrainingsExercisesRow(data);
}

class TemplatesTrainingsExercisesRow extends SupabaseDataRow {
  TemplatesTrainingsExercisesRow(super.data);

  @override
  SupabaseTable get table => TemplatesTrainingsExercisesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  int? get rlTemplatesTrainings => getField<int>('rl_templates_trainings');
  set rlTemplatesTrainings(int? value) =>
      setField<int>('rl_templates_trainings', value);

  int? get rlExercises => getField<int>('rl_exercises');
  set rlExercises(int? value) => setField<int>('rl_exercises', value);

  dynamic get setsPlan => getField<dynamic>('sets_plan');
  set setsPlan(dynamic value) => setField<dynamic>('sets_plan', value);
}
