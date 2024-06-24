import '../database.dart';

class ViewTemplatesTrainingsTable
    extends SupabaseTable<ViewTemplatesTrainingsRow> {
  @override
  String get tableName => 'view_templates_trainings';

  @override
  ViewTemplatesTrainingsRow createRow(Map<String, dynamic> data) =>
      ViewTemplatesTrainingsRow(data);
}

class ViewTemplatesTrainingsRow extends SupabaseDataRow {
  ViewTemplatesTrainingsRow(super.data);

  @override
  SupabaseTable get table => ViewTemplatesTrainingsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  DateTime? get trainingDate => getField<DateTime>('training_date');
  set trainingDate(DateTime? value) =>
      setField<DateTime>('training_date', value);

  int? get weekday => getField<int>('weekday');
  set weekday(int? value) => setField<int>('weekday', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get rlTemplatesTrainingsPlans =>
      getField<int>('rl_templates_trainings_plans');
  set rlTemplatesTrainingsPlans(int? value) =>
      setField<int>('rl_templates_trainings_plans', value);

  String? get coachName => getField<String>('coach_name');
  set coachName(String? value) => setField<String>('coach_name', value);

  String? get coachSurname => getField<String>('coach_surname');
  set coachSurname(String? value) => setField<String>('coach_surname', value);

  String? get coachPhotoUrl => getField<String>('coach_photo_url');
  set coachPhotoUrl(String? value) =>
      setField<String>('coach_photo_url', value);

  int? get exercisesCount => getField<int>('exercises_count');
  set exercisesCount(int? value) => setField<int>('exercises_count', value);
}
