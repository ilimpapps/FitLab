import '../database.dart';

class TemplatesTrainingsPlansTable
    extends SupabaseTable<TemplatesTrainingsPlansRow> {
  @override
  String get tableName => 'templates_trainings_plans';

  @override
  TemplatesTrainingsPlansRow createRow(Map<String, dynamic> data) =>
      TemplatesTrainingsPlansRow(data);
}

class TemplatesTrainingsPlansRow extends SupabaseDataRow {
  TemplatesTrainingsPlansRow(super.data);

  @override
  SupabaseTable get table => TemplatesTrainingsPlansTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);
}
