import '../database.dart';

class ExercisesTable extends SupabaseTable<ExercisesRow> {
  @override
  String get tableName => 'exercises';

  @override
  ExercisesRow createRow(Map<String, dynamic> data) => ExercisesRow(data);
}

class ExercisesRow extends SupabaseDataRow {
  ExercisesRow(super.data);

  @override
  SupabaseTable get table => ExercisesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  List<String> get muscle => getListField<String>('muscle');
  set muscle(List<String>? value) => setListField<String>('muscle', value);

  List<String> get additionalMuscle =>
      getListField<String>('additional_muscle');
  set additionalMuscle(List<String>? value) =>
      setListField<String>('additional_muscle', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  List<String> get equipment => getListField<String>('equipment');
  set equipment(List<String>? value) =>
      setListField<String>('equipment', value);

  String? get difficulty => getField<String>('difficulty');
  set difficulty(String? value) => setField<String>('difficulty', value);

  List<String> get photos => getListField<String>('photos');
  set photos(List<String>? value) => setListField<String>('photos', value);

  String? get technique => getField<String>('technique');
  set technique(String? value) => setField<String>('technique', value);

  String? get video => getField<String>('video');
  set video(String? value) => setField<String>('video', value);

  String? get videoPreview => getField<String>('video_preview');
  set videoPreview(String? value) => setField<String>('video_preview', value);
}
