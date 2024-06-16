import '../database.dart';

class CoachTrainingsTemplateTable
    extends SupabaseTable<CoachTrainingsTemplateRow> {
  @override
  String get tableName => 'coach_trainings_template';

  @override
  CoachTrainingsTemplateRow createRow(Map<String, dynamic> data) =>
      CoachTrainingsTemplateRow(data);
}

class CoachTrainingsTemplateRow extends SupabaseDataRow {
  CoachTrainingsTemplateRow(super.data);

  @override
  SupabaseTable get table => CoachTrainingsTemplateTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  int? get trainingCount => getField<int>('training_count');
  set trainingCount(int? value) => setField<int>('training_count', value);

  List<String> get gender => getListField<String>('gender');
  set gender(List<String>? value) => setListField<String>('gender', value);

  String? get difficulty => getField<String>('difficulty');
  set difficulty(String? value) => setField<String>('difficulty', value);
}
