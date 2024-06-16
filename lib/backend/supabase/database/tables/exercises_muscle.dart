import '../database.dart';

class ExercisesMuscleTable extends SupabaseTable<ExercisesMuscleRow> {
  @override
  String get tableName => 'exercises_muscle';

  @override
  ExercisesMuscleRow createRow(Map<String, dynamic> data) =>
      ExercisesMuscleRow(data);
}

class ExercisesMuscleRow extends SupabaseDataRow {
  ExercisesMuscleRow(super.data);

  @override
  SupabaseTable get table => ExercisesMuscleTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get muscle => getField<String>('muscle');
  set muscle(String? value) => setField<String>('muscle', value);

  String? get imagePath => getField<String>('image_path');
  set imagePath(String? value) => setField<String>('image_path', value);
}
