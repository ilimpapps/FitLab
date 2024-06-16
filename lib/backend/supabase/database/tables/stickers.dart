import '../database.dart';

class StickersTable extends SupabaseTable<StickersRow> {
  @override
  String get tableName => 'stickers';

  @override
  StickersRow createRow(Map<String, dynamic> data) => StickersRow(data);
}

class StickersRow extends SupabaseDataRow {
  StickersRow(super.data);

  @override
  SupabaseTable get table => StickersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);
}
