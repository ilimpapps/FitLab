import '../database.dart';

class UsersTrainingsExercisesTable
    extends SupabaseTable<UsersTrainingsExercisesRow> {
  @override
  String get tableName => 'users_trainings_exercises';

  @override
  UsersTrainingsExercisesRow createRow(Map<String, dynamic> data) =>
      UsersTrainingsExercisesRow(data);
}

class UsersTrainingsExercisesRow extends SupabaseDataRow {
  UsersTrainingsExercisesRow(super.data);

  @override
  SupabaseTable get table => UsersTrainingsExercisesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get rlUsers => getField<String>('rl_users');
  set rlUsers(String? value) => setField<String>('rl_users', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  int? get rlUsersTrainings => getField<int>('rl_users_trainings');
  set rlUsersTrainings(int? value) =>
      setField<int>('rl_users_trainings', value);

  int? get rlExercises => getField<int>('rl_exercises');
  set rlExercises(int? value) => setField<int>('rl_exercises', value);

  dynamic get setsFact => getField<dynamic>('sets_fact');
  set setsFact(dynamic value) => setField<dynamic>('sets_fact', value);

  dynamic get setsPlan => getField<dynamic>('sets_plan');
  set setsPlan(dynamic value) => setField<dynamic>('sets_plan', value);
}
