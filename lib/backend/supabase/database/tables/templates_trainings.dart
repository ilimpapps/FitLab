import '../database.dart';

class TemplatesTrainingsTable extends SupabaseTable<TemplatesTrainingsRow> {
  @override
  String get tableName => 'templates_trainings';

  @override
  TemplatesTrainingsRow createRow(Map<String, dynamic> data) =>
      TemplatesTrainingsRow(data);
}

class TemplatesTrainingsRow extends SupabaseDataRow {
  TemplatesTrainingsRow(super.data);

  @override
  SupabaseTable get table => TemplatesTrainingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

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
}
