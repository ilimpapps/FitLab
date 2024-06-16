import '../database.dart';

class CoachTrainingsExercisesTable
    extends SupabaseTable<CoachTrainingsExercisesRow> {
  @override
  String get tableName => 'coach_trainings_exercises';

  @override
  CoachTrainingsExercisesRow createRow(Map<String, dynamic> data) =>
      CoachTrainingsExercisesRow(data);
}

class CoachTrainingsExercisesRow extends SupabaseDataRow {
  CoachTrainingsExercisesRow(super.data);

  @override
  SupabaseTable get table => CoachTrainingsExercisesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  int? get rlExercises => getField<int>('rl_exercises');
  set rlExercises(int? value) => setField<int>('rl_exercises', value);

  dynamic get setsFact => getField<dynamic>('sets_fact');
  set setsFact(dynamic value) => setField<dynamic>('sets_fact', value);

  dynamic get setsPlan => getField<dynamic>('sets_plan');
  set setsPlan(dynamic value) => setField<dynamic>('sets_plan', value);

  int? get rlCoachTrainings => getField<int>('rl_coach_trainings');
  set rlCoachTrainings(int? value) =>
      setField<int>('rl_coach_trainings', value);
}
