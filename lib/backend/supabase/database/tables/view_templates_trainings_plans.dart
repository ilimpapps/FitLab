import '../database.dart';

class ViewTemplatesTrainingsPlansTable
    extends SupabaseTable<ViewTemplatesTrainingsPlansRow> {
  @override
  String get tableName => 'view_templates_trainings_plans';

  @override
  ViewTemplatesTrainingsPlansRow createRow(Map<String, dynamic> data) =>
      ViewTemplatesTrainingsPlansRow(data);
}

class ViewTemplatesTrainingsPlansRow extends SupabaseDataRow {
  ViewTemplatesTrainingsPlansRow(super.data);

  @override
  SupabaseTable get table => ViewTemplatesTrainingsPlansTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  int? get weekdayCount => getField<int>('weekday_count');
  set weekdayCount(int? value) => setField<int>('weekday_count', value);
}
