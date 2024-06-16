import '../database.dart';

class CoachTrainingsTable extends SupabaseTable<CoachTrainingsRow> {
  @override
  String get tableName => 'coach_trainings';

  @override
  CoachTrainingsRow createRow(Map<String, dynamic> data) =>
      CoachTrainingsRow(data);
}

class CoachTrainingsRow extends SupabaseDataRow {
  CoachTrainingsRow(super.data);

  @override
  SupabaseTable get table => CoachTrainingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  String? get difficulty => getField<String>('difficulty');
  set difficulty(String? value) => setField<String>('difficulty', value);
}
