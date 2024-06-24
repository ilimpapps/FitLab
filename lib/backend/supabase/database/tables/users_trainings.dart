import '../database.dart';

class UsersTrainingsTable extends SupabaseTable<UsersTrainingsRow> {
  @override
  String get tableName => 'users_trainings';

  @override
  UsersTrainingsRow createRow(Map<String, dynamic> data) =>
      UsersTrainingsRow(data);
}

class UsersTrainingsRow extends SupabaseDataRow {
  UsersTrainingsRow(super.data);

  @override
  SupabaseTable get table => UsersTrainingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get rlUsers => getField<String>('rl_users')!;
  set rlUsers(String value) => setField<String>('rl_users', value);

  String? get rlCoach => getField<String>('rl_coach');
  set rlCoach(String? value) => setField<String>('rl_coach', value);

  int? get weekday => getField<int>('weekday');
  set weekday(int? value) => setField<int>('weekday', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);
}
