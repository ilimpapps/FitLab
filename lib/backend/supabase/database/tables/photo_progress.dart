import '../database.dart';

class PhotoProgressTable extends SupabaseTable<PhotoProgressRow> {
  @override
  String get tableName => 'photo_progress';

  @override
  PhotoProgressRow createRow(Map<String, dynamic> data) =>
      PhotoProgressRow(data);
}

class PhotoProgressRow extends SupabaseDataRow {
  PhotoProgressRow(super.data);

  @override
  SupabaseTable get table => PhotoProgressTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get imagePath => getField<String>('image_path');
  set imagePath(String? value) => setField<String>('image_path', value);

  String? get rlUsers => getField<String>('rl_users');
  set rlUsers(String? value) => setField<String>('rl_users', value);
}
