import '../database.dart';

class ExercisesTemplateTable extends SupabaseTable<ExercisesTemplateRow> {
  @override
  String get tableName => 'exercises_template';

  @override
  ExercisesTemplateRow createRow(Map<String, dynamic> data) =>
      ExercisesTemplateRow(data);
}

class ExercisesTemplateRow extends SupabaseDataRow {
  ExercisesTemplateRow(super.data);

  @override
  SupabaseTable get table => ExercisesTemplateTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  dynamic get exercises => getField<dynamic>('exercises');
  set exercises(dynamic value) => setField<dynamic>('exercises', value);
}
