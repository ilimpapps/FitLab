import '../database.dart';

class UsersMeasurementsTable extends SupabaseTable<UsersMeasurementsRow> {
  @override
  String get tableName => 'users_measurements';

  @override
  UsersMeasurementsRow createRow(Map<String, dynamic> data) =>
      UsersMeasurementsRow(data);
}

class UsersMeasurementsRow extends SupabaseDataRow {
  UsersMeasurementsRow(super.data);

  @override
  SupabaseTable get table => UsersMeasurementsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get rlUsers => getField<String>('rl_users');
  set rlUsers(String? value) => setField<String>('rl_users', value);

  dynamic get measurements => getField<dynamic>('measurements');
  set measurements(dynamic value) => setField<dynamic>('measurements', value);

  String? get unit => getField<String>('unit');
  set unit(String? value) => setField<String>('unit', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
